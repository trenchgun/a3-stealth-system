/*
	Author: 
		Trenchgun

	Description:
		Call from init of a vehicle placed in editor. Will disable simulations and hide the vehicle, then activate and unhide once given alert level is reached

	Parameter(s):
		0: OBJECT		_vic: vehicle to hide/unhide
		1: INTEGER		_level: what alert level the unit should be activated at
		
	Returns:
		none
*/

params [
	"_zoneList",		// ARRAY of TRIGGERS to use as stealth zones
	"_side"			// INTEGER, same as above
];

// initialize each stealth zone
{
	[_x, _side] call TG_fnc_fsm_patrol;
} forEach _zoneList;


private _alertLevelFSM = [
	[zone_1],		// list of everything the stateMachine should be run on
	true			// skip any items that are null (i.e. dead AI)
] call CBA_statemachine_fnc_create;

/*************
	STATES
*************/

[_alertLevelFSM, {}, {systemChat "Alert Level 0"}, {}, "level_0"] call CBA_statemachine_fnc_addState;

[_alertLevelFSM, {
	/* dangerous infinite spawns :^)
	if (delay_1 > 0) then {
		sleep delay_1;
		level_1 spawn TG_fnc_spawnQRF;
	};
	*/
}, {
	systemChat "Alert Level 1";
	// raise event
	["TG_event_alert_level_1", ""] call CBA_fnc_globalEvent;
	
	level_1 spawn TG_fnc_spawnQRF;
	//_level_1_qrf remoteExec ["TG_fnc_spawnQRF", 2];
	systemChat "called TG_fnc_spawnQRF";

}, {}, "level_1"] call CBA_statemachine_fnc_addState;

[_alertLevelFSM, {
	/* dangerous infinite spawns :^)
	if (delay_2 > 0) then {
		sleep delay_2;
		level_2 spawn TG_fnc_spawnQRF;
	};
	*/
}, {
	systemChat "Alert Level 2";
	// raise event
	["TG_event_alert_level_2", ""] call CBA_fnc_globalEvent;
	level_2 spawn TG_fnc_spawnQRF;
}, {}, "level_2"] call CBA_statemachine_fnc_addState;

[_alertLevelFSM, {
	/* dangerous infinite spawns :^)
	if (delay_3 > 0) then {
		sleep delay_3;
		level_3 spawn TG_fnc_spawnQRF;
	};
	*/
}, {
	systemChat "Alert Level 3";
	// raise event
	["TG_event_alert_level_3", ""] call CBA_fnc_globalEvent;
	level_3 spawn TG_fnc_spawnQRF;
}, {}, "level_3"] call CBA_statemachine_fnc_addState;

/*************************
	STATE TRANSITIONS
*************************/

[_alertLevelFSM, "level_0", "level_1",
	{ (missionNamespace getVariable "TG_compromiseValue") > 0 },
	{ systemChat "alert level increased" }, 
"level_0_to_1"] call CBA_stateMachine_fnc_addTransition;

[_alertLevelFSM, "level_1", "level_2",
	{ (missionNamespace getVariable "TG_compromiseValue") > 10 },
	{ systemChat "alert level increased" }, 
"level_1_to_2"] call CBA_stateMachine_fnc_addTransition;

[_alertLevelFSM, "level_1", "level_2",
	{ (missionNamespace getVariable "TG_compromiseValue") > 99 },
	{ systemChat "alert level increased" }, 
"level_1_to_2"] call CBA_stateMachine_fnc_addTransition;
