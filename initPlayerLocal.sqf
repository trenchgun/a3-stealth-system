// initPlayerLocal.sqf
// Executes on a client machine when they load the mission, regardless of if it's at mission start or JIP.
// _this = [player:Object, didJIP:Boolean]
params ["_player", "_jip"];

// Call the template initPlayerLocal function
_this call XPT_fnc_initPlayerLocal; // DO NOT CHANGE THIS LINE

// Add any mission specific code after this point

// Uncomment the line below to use briefing.sqf for mission briefings. Un-needed if you're using XPTBriefings.hpp
[] execVM "scripts\briefing.sqf";


[
	laptop_1,
	"Secure Laptop",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	"_this distance _target < 3",
	"_caller distance _target < 3",
	{},
	{},
	{ 
		["task_laptop_1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
		deleteVehicle laptop_1;
	},
	{},
	[],
	1,
	0,
	true,
	false
] call BIS_fnc_holdActionAdd;
[
	laptop_2,
	"Secure Laptop",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	"_this distance _target < 3",
	"_caller distance _target < 3",
	{},
	{},
	{ 
		["task_laptop_2", "SUCCEEDED", true] call BIS_fnc_taskSetState;
		deleteVehicle laptop_2;
	},
	{},
	[],
	1,
	0,
	true,
	false
] call BIS_fnc_holdActionAdd;
[
	laptop_3,
	"Secure Laptop",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	"_this distance _target < 3",
	"_caller distance _target < 3",
	{},
	{},
	{ 
		["task_laptop_3", "SUCCEEDED", true] call BIS_fnc_taskSetState;
		deleteVehicle laptop_3;
	},
	{},
	[],
	1,
	0,
	true,
	false
] call BIS_fnc_holdActionAdd;