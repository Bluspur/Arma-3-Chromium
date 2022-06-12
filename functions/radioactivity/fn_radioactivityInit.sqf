params ["_source","_active","_maxRange","_minRange",["_maxThreat",9.99]];

//Check if the values are reasonable and if not assign them some defaults
if (_maxThreat > 9.99) then {_maxThreat = 9.99;};
if (_minRange < 0) then {_minRange = 0;};

//if this is done first then create the missionNamespace variable
if (isNil{missionNamespace getVariable "radioactivitySources"}) then {
	missionNamespace setVariable ["radioactivitySources",[]];
};

//get a copy of the variable and append the current object to it
_update = missionNamespace getVariable "radioactivitySources";
_update pushBack [_source,_active,_maxRange,_minRange,_maxThreat];