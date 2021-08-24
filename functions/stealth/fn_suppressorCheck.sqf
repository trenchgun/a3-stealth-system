/*
	Author: 
		Trenchgun, based on method by Keth

	Description:
		Returns true if the passed muzzle is a silencer.

	Parameter(s):
		0: STRING - name of the muzzle device of fired object

	Returns:
		BOOL - true if weapon has silencer, false if not
*/

/*
//private ["_suppressor"];
params ["_muzzle"];
_suppressor = false;
systemChat format ["Muzzle: %1", _muzzle];
if !(_muzzle == "") then { _suppressor = true; };

/*
if (!_suppresor) then {
	// compromised
	// raise compromise value, public variable
	systemChat "Unsilenced shot detected! You have been compromised.";
};
*/


params ["_unit", "_weaponFired"];

private ["_suppressor"]; 
_weaponItems = weaponsItems _unit; 
_suppressor = false; 
 
// go through each equipped item and check if it was the one fired AND if it had a silencer
{ 
	_x params ["_weapon", "_muzzle", "_flashlight", "_optics", "_primaryMuzzleMagazine", "_secondaryMuzzleMagazine", "_bipod"];
	if ( (_weaponFired == _weapon) && !(_muzzle == "") ) then { 
		_suppressor = true; 
	}; 
} forEach _weaponItems; 
 
 /*
if (!_suppressor) then {
	K_coverblown = true; 
	publicVariable "K_coverblown";
}; 
 */
 
_suppressor;