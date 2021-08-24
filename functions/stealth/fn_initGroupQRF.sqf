/*
	Author: 
		Trenchgun

	Description:
		Call from init of a group placed in editor. Will disable simulations and hide the vehicle, then activate and unhide once given alert level is reached

	Parameter(s):
		0: GROUP		_group: group to hide/unhide
		1: INTEGER		_level: what alert level the unit should be activated at
		
	Returns:
		none
*/

params ["_leader", "_level"];

sleep 1;
_group = group _leader;

{
	_x hideObjectGlobal true;
	_x enableSimulationGlobal false;
	
	switch (_level) do {
		case 1: {
			[
				"TG_event_alert_level_1", 
				{
					_thisArgs hideObjectGlobal false;
					_thisArgs enableSimulationGlobal true;
					["TG_event_alert_level_1", _thisID] call CBA_fnc_removeEventHandler;
				}, 
				_x
			] call CBA_fnc_addEventHandlerArgs;
		};
		case 2: {
			[
				"TG_event_alert_level_2", 
				{
					_thisArgs hideObjectGlobal false;
					_thisArgs enableSimulationGlobal true;
					["TG_event_alert_level_2", _thisID] call CBA_fnc_removeEventHandler;
				}, 
				_x
			] call CBA_fnc_addEventHandlerArgs;
		};
		case 3: {
			[
				"TG_event_alert_level_3", 
				{
					_thisArgs hideObjectGlobal false;
					_thisArgs enableSimulationGlobal true;
					["TG_event_alert_level_3", _thisID] call CBA_fnc_removeEventHandler;
				}, 
				_x
			] call CBA_fnc_addEventHandlerArgs;
		};
		default {};
	};
	
} forEach units _group;