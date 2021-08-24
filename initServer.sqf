// initServer.sqf
// Executes only on the server at mission start
// No parameters are passed to this script

// Call the template initServer function
[] call XPT_fnc_initServer; // DO NOT CHANGE THIS LINE

// Call the script to handle initial task setup
[] execVM "scripts\tasks.sqf";



//////////////////////////////////////////////////////////
///// Add any mission specific code after this point /////
//////////////////////////////////////////////////////////

// Create a list of mission objects that should not be curator editable
XPT_blacklistedMissionObjects = [];

level_1 = [
	["CUP_O_Partisans_soldier_TTsKO"],		// _units
	opfor, 					// _side
	true, 							// _randomizeUnits
	[spawn_1, spawn_2, spawn_3, spawn_4, spawn_5, spawn_6, spawn_7], 	// _spawnPositions
	true,							// _randomizeSpawnPositions
	[target_1, target_2], 							// _targetPosition
	[1, 2],	 						// _unitAmount
	[3, 6]							// _groupAmount
];

level_2 = [];

level_3 = [
	["CUP_O_Partisans_soldier_TTsKO"],		// _units
	opfor, 					// _side
	true, 							// _randomizeUnits
	[spawn_8, spawn_9, spawn_10, spawn_11], 	// _spawnPositions
	true,							// _randomizeSpawnPositions
	[target_1, target_3], 							// _targetPosition
	[6, 10],	 					// _unitAmount
	[4, 6]						// _groupAmount
];


[
	[zone_1],
	opfor
] call TG_fnc_FSM_alertLevel;