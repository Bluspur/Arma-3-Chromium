params ["_player"];

while {sleep 4; alive player} do {
	if (player getVariable "MaskOn") then {
		_soundObject = player getVariable "SoundObject";
		if (isNull _soundObject) then {
			_logicGroup = createGroup sideLogic;
			_soundObject = _logicGroup createUnit ["Logic", player,[],0,"NONE"];
			_soundObject attachTo [player,[0,0,0],"hlava"];
			player setVariable ["SoundObject",_soundObject];
		};
		_soundObject say3d "BreathingSound";
		player setVariable ["Breathing",true];
	} else {
		if (player getVariable "Breathing") then {
			_soundObject = player getVariable "SoundObject";
			deleteVehicle _soundObject;
			deleteGroup group _soundObject;
		};
	};
};