if (!hasInterface) exitWith {systemChat "Geiger System exiting, non-player entity detected";};
if (player != player) then {waitUntil {player == player}};

private _soundObjectOne = objNull;
private _soundObjectTwo = objNull;
private _soundObjectThree = objNull;
private _logicGroup = createGroup sideLogic;

waitUntil {!isNil {player getVariable "Threat"}};

while {sleep 2; alive player} do {
	if ("ChemicalDetector_01_watch_F" in (assignedItems player)) then {
		if (player getVariable "Threat" > 6) then {
			if (isNull _soundObjectOne) then {
				_soundObjectOne = _logicGroup createUnit ["Logic", player,[],0,"NONE"];
				_soundObjectOne attachTo [player,[0,0,0],"hlava"];
			};
				_soundObjectOne say3D "GeigerCounterLong01";
		} else {
			deleteVehicle _soundObjectOne;
		};
		if (player getVariable "Threat" > 7.5) then {
			if (isNull _soundObjectTwo) then {
				_soundObjectTwo = _logicGroup createUnit ["Logic", player,[],0,"NONE"];
				_soundObjectTwo attachTo [player,[0,0,0],"hlava"];
			};
				_soundObjectTwo say3D "GeigerCounterLong01";
		} else {
			deleteVehicle _soundObjectTwo;
		};
		if (player getVariable "Threat" > 9) then {
			if (isNull _soundObjectThree) then {
				_soundObjectThree = _logicGroup createUnit ["Logic", player,[],0,"NONE"];
				_soundObjectThree attachTo [player,[0,0,0],"hlava"];
			};
				_soundObjectThree say3D "GeigerCounterLong01";
		} else {
			deleteVehicle _soundObjectThree;
		};
	} else {
		if (!isNull _soundObjectOne) then {
			deleteVehicle _soundObjectOne;
		};
		if (!isNull _soundObjectTwo) then {
			deleteVehicle _soundObjectTwo;
		};
		if (!isNull _soundObjectThree) then {
			deleteVehicle _soundObjectThree;
		};
	};
};