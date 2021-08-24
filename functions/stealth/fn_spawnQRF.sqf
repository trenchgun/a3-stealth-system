/*
	Author: 
		Trenchgun

	Description:
		Spawns a wave of groups whose makeup and number is determined by the passed array

	Parameter(s):
		0: ARRAY		_units: list of unit classnames to pull from as STRINGS
		1: SIDE			_side: which side the spawned units will belong to
		2: BOOL			_randomizeUnits: if true, a group will be spawned with random number and type of units. If false, will spawn entire _unit array as each group
		3: ARRAY		_spawnPositions: list of OBJECTS or POSITIONS where groups will randomly spawn at
		4: ARRAY 		_targetPosition: list of OBJECTS or POSITIONS where groups will be randomly directed to attack
		5: INTEGER		_minUnits: minimum number of units to create in a group (ignored if _randomizeUnits is false)
		6: INTEGER		_maxUnits: maximum number of units to create in a group (ignored if _randomizeUnits is false)
		7: INTEGER		_minGroups: minimum number of groups to spawn in the wave
		8: INTEGER		_maxGroups: maximum number of groups to spawn in the wave
		
	Returns:
		none
*/

// TODO:
// Handle vehicles being spawned -- perhaps move to dedicated vehicle spawn script?
if (count _this < 1) exitWith {systemChat "no unit array given."}; 
params [
	"_units", 
	"_side", 
	"_randomizeUnits", 
	"_spawnPositions",
	"_randomizeSpawnPos",
	"_targetPosition", 
	"_unitRange", 
	"_groupRange"
];

_groupAmount = _groupRange call BIS_fnc_randomInt;
systemChat format ["spawning %1 QRF groups...", _groupAmount];
for "_i" from 0 to _groupAmount do {
	_spawnPos = _spawnPositions select (_i mod (count _spawnPositions));
	if (_randomizeSpawnPos) then {
		_spawnPos = selectRandom _spawnPositions;
	};
	systemChat format ["group %1 spawn selected: %2", _i, _spawnPos];
	_group = createGroup [_side, true];
	if (_randomizeUnits) then {
		// choose randomly from provided units, spawn a random amount from params provided
		_unitAmount = _unitRange call BIS_fnc_randomInt;
		systemChat format ["Spawning random units, amount: %1", _unitAmount];
		for "_j" from 0 to _unitAmount do {
			_unit = selectRandom _units;
			_newUnit = _group createUnit [_unit, _spawnPos, [], 0, "NONE"];
			
			systemChat format ["spawning unit %1 of type %2", _j, _unit];
			
			// apply loadout if one exists in XPT loadouts
			if (isClass ((getMissionConfig "CfgXPT") >> "CuratorLoadouts" >> _unit)) then {
				[_newUnit, (getMissionConfig "CfgXPT") >> "CuratorLoadouts" >> _unit] call XPT_fnc_loadInventory;
			};
			systemChat format ["loadout given to unit %1 of type %2", _j, _unit];
			
			// make sure to spread out execution instead of trying to do it in a single frame
			sleep 0.001;
		};
	} else {
		// spawn all the provided units, first unit is group leader
		{
			_group createUnit [_x, _spawnPos, [], 0, "NONE"];
			sleep 0.001;
		} forEach _units;
	};
	_targetPos = selectRandom _targetPosition;
	_wp = _group addWaypoint [_targetPos, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointSpeed "FULL";
	_group setCurrentWaypoint [_group, 1];
	
	// add to curator
	{
		_x addCuratorEditableObjects [units _group, false];
	} forEach allCurators;
	
	
	systemChat format ["group %1 spawn completed", _i];
};

