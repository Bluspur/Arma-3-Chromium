if (!hasInterface) exitWith {systemChat "Geiger System exiting, non-player entity detected";};
if (player != player) then {waitUntil {player == player}};

waitUntil {!isNil {player getVariable "Threat"}};

while {sleep 1; alive player} do {
	private _damageModifier = damage player;
	if ((player getVariable "Threat") > 7) then {
		if !(player getVariable "MaskOn") then {
			_damageModifier = _damageModifier + 0.01;
		};
	};
	if ((player getVariable "Threat") > 8) then {
		if !(player getVariable "MaskOn") then {
			_damageModifier = _damageModifier + 0.02;
		};
		if !(player getVariable "SuitOn") then {
			_damageModifier = _damageModifier + 0.02;
		};
	};
	if ((player getVariable "Threat") > 9) then {
		if (!(player getVariable "MaskOn") || !(player getVariable "SuitOn")) then {
			_damageModifier = _damageModifier + 0.05;
		};
	};
	player setDamage _damageModifier;
};