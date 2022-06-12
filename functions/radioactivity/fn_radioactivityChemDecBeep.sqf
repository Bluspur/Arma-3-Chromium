if (!hasInterface) exitWith {systemChat "Radioactivity System exiting, non-player entity detected";};
if (player != player) then {waitUntil {player == player}};

private _interval = 4;

waitUntil {!isNil {player getVariable "Threat"}};
while {sleep _interval; alive player} do {
	if ("ChemicalDetector_01_watch_F" in (assignedItems player)) then {
			_threat = player getVariable "Threat";
		if (_threat > 0) then {
			_interval = ((9.99 - _threat) max 0.2) min 4;
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\drill_start.wss", player,false,getPosASL player,0.75,1,15];
		} else {
			_interval = 4;
	};
	} else {
		_interval = 4;
	};
};