if (!hasInterface) exitWith {systemChat "Radioactivity System exiting, non-player entity detected";};
if (player != player) then {waitUntil {player == player}};

"ChemicalDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];

player setVariable ["Threat",0,false];
private _threat = 0;
private _threatArray = [];
private _sources = missionNamespace getVariable "radioactivitySources";
private _ui = uiNamespace getVariable "RscWeaponChemicalDetector";
private _obj = _ui displayCtrl 101;

//Script for managing Chemical detector screen update and also applies the number to the player's threat variable
while {sleep 1; alive player} do {
	if ("ChemicalDetector_01_watch_F" in (assignedItems player)) then {
		{
			_x params ["_source","_active","_maxRange","_minRange","_maxThreat"];
			if (_active) then {
				private _distance = (((player distance _source) - _minRange) min _maxRange) max 0;
				private _threatLocal = parseNumber ((_maxThreat - (_distance/_maxRange * _maxThreat)) toFixed 2);
				_threatArray set [_forEachIndex,_threatLocal];
			} else {
				_threatArray set [_forEachIndex,0];
			};
		} forEach _sources;
		_threat = selectMax _threatArray;
		_obj ctrlAnimateModel ["Threat_Level_Source", _threat, true];
		player setVariable ["Threat",_threat,false];
	};
};