/*
	Author: 
		Trenchgun

	Description:
		Handles alertness of units in given trigger zone

	Parameter(s):
		0: TRIGGER		_area: trigger area which will have its units controlled by this FSM
		1: SIDE			_side: side of units to use within trigger zone
		
	Returns:
		none
*/

params ["_area","_side"];
_unitList = units _side inAreaArray _area;

// initialize the FSM
private _patrolFSM = [_unitList, true] call CBA_statemachine_fnc_create;

/*************
	STATES
*************/

[	// unit is unaware of enemies and patrols as normal
	_patrolFSM, 
	{}, 
	{
		_this setCombatMode "GREEN";
		systemChat format ["%1 State: NEUTRAL", _this];
	}, 
	{}, 
	"neutral"
] call CBA_statemachine_fnc_addState;


[	// unit is suspicous of enemy activity
	_patrolFSM, 
	{}, 
	{
		_this setCombatMode "YELLOW";
		// adjust waypoint to SAD on position
		
	}, 
	{}, 
	"alert"
] call CBA_statemachine_fnc_addState;


[	//	unit is in AGGRO state, combat mode RED
	_patrolFSM, 
	{}, 
	{
		_this setCombatMode "RED";
		systemChat format ["%1 State: AGGRO", _this];
	}, 
	{}, 
	"aggro"
] call CBA_statemachine_fnc_addState;


/*************************
	STATE TRANSITIONS
*************************/

// detect if unit is no longer in GREEN combat state
[_patrolFSM, "neutral", "alert",
	{ combatMode _this != "GREEN"},
	{},				
	"ALERT"			
] call CBA_statemachine_fnc_addTransition;

// if the unit is shot, then force a switch to AGGRO state
/*
_event_aggro = ["TG_event_aggro", {
	_this params ["_unit", "_shooter"];
	_state = [_unit, PATROL_FSM] call CBA_statemachine_fnc_getCurrentState;
	systemChat _state;
	if (_state == "neutral") then
	{
		[_unit, PATROL_FSM, "neutral", "aggro", {systemChat "neutral_to_aggro"}, "neutral_to_aggro"] call CBA_statemachine_fnc_manualTransition;
	};
	if (_state == "alert") then
	{
		[_unit, PATROL_FSM, "alert", "aggro", {systemChat "alert_to_aggro"}, "alert_to_aggro"] call CBA_statemachine_fnc_manualTransition;
	};
	systemChat "CBA event triggered!";

}] call CBA_fnc_addEventHandlerArgs;
*/
/*
_event_alert = ["TG_event_alert", {
	_this params ["_unit", "_shooter"];
	_state = [_unit, PATROL_FSM] call CBA_statemachine_fnc_getCurrentState;
	systemChat _state;
	if (_state == "neutral") then
	{
		[_unit, PATROL_FSM, "neutral", "alert", {
			systemChat "neutral_to_alert";
			_unit setDir (_unit getDir _shooter);
			_unit playMove "Acts_Peering_Front";
		}, "neutral_to_alert"] call CBA_statemachine_fnc_manualTransition;
		systemChat "CBA event triggered!";
	};
}] call CBA_fnc_addEventHandlerArgs;
*/

/*********************
	EVENT HANDLERS
*********************/

{	// make the unit reset its anim and go alert if it is shot
	_x addEventHandler ["Dammaged", {
		params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
		
		// check if unit is not unconscious
		if !(_unit getVariable ["ACE_isUnconscious", false]) then {
			if (stance _unit isEqualTo "STAND") then {
				_unit switchMove "";
			};
		};
		
		_unit setCombatMode "RED";
		//["TG_event_aggro", [_unit, _shooter]] call CBA_fnc_serverEvent;
		_state = [_unit, _patrolFSM] call CBA_statemachine_fnc_getCurrentState;
		systemChat _state;
		if (_state == "neutral") then
		{
			[_unit, _patrolFSM, "neutral", "aggro", {
				systemChat "neutral_to_aggro";
				
			}, "neutral_to_aggro"] call CBA_statemachine_fnc_manualTransition;
		};
		if (_state == "alert") then
		{
			[_unit, _patrolFSM, "alert", "aggro", {
				systemChat "alert_to_aggro";
			}, "alert_to_aggro"] call CBA_statemachine_fnc_manualTransition;
		};
	}];
} forEach _unitList;

{	// detect if another unit fires nearby the unit
	_x addEventHandler ["FiredNear", {
		params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
		if (_distance < 10) then {
			_state = [_unit, _patrolFSM] call CBA_statemachine_fnc_getCurrentState;
			systemChat _state;
			if (_state == "neutral") then
			{
				[_unit, _patrolFSM, "neutral", "alert", {
					systemChat "neutral_to_alert";
					_unit setDir (_unit getDir _firer);
					_unit playMove "Acts_Peering_Front";
					//_group = group _unit;
					_currentWP = currentWaypoint group _unit;
					_wp = group _unit addWaypoint [_firer, 0, _currentWP];
					_wp setWaypointType "SAD";
					_wp setWaypointBehaviour "AWARE";
					_wp setWaypointSpeed "LIMITED";
				}, "neutral_to_alert"] call CBA_statemachine_fnc_manualTransition;
				systemChat "CBA event triggered!";
			};
		};
	}];
} forEach _unitList;

{	// if the unit fires their weapon, then add to the compromise level
	_x addEventHandler["Fired", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		if !( [_unit, _weapon] call TG_fnc_suppressorCheck ) then { call TG_fnc_compromised; };
		// need to make every unit go to alert
		// hmm... may be best to do this in the alertLevel FSM
		{
			[_x, _patrolFSM, "neutral", "alert", {
				systemChat format ["%1 went alert!", _x];
			}, "neutral_to_alert"] call CBA_statemachine_fnc_manualTransition;
		} forEach _unitList;
	}];
} forEach _unitList;

{	// remove all event handlers if the unit dies
	_x addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		_unit removeAllEventHandlers "Killed";
		_unit removeAllEventHandlers "Fired";
		_unit removeAllEventHandlers "Dammaged";
	}];
} forEach _unitList;

/*********************
	AI Adjustments
*********************/
{
	_x setSkill ["commanding", 0.1];
	_x setSkill ["spotDistance", 0.1];
	_x setSkill ["spotTime", 0.1];
	_x disableAI "AUTOTARGET";
	_x disableAI "FSM";
	_x disableAI "RADIOPROTOCOL";
} forEach _unitList;
