// TODO: handles maintaining compromise level

systemChat "Unsilenced shot detected! You have been compromised.";

// increase the compromise level
_compromiseValue = missionNamespace getVariable "TG_compromiseValue";
if (isNil "_compromiseValue") exitWith {
	missionNamespace setVariable ["TG_compromiseValue", 1];
	hint format ["Compromise Value: %1", 1];
};

_compromiseValue = _compromiseValue + 1;
_compromiseValue = [_compromiseValue, 0, 100] call BIS_fnc_clamp;
missionNamespace setVariable ["TG_compromiseValue", _compromiseValue];
hint format ["Compromise Value: %1", _compromiseValue];
