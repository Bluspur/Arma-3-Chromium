if (player != player) then {waitUntil {player == player}};

player setVariable ["Mask",""];
player setVariable ["MaskOn",false];
player setVariable ["SuitOn",false];
player setVariable ["Breathing",false];
player setVariable ["SoundObject",objNull];

//Creates the briefing for the local player
_null = execVM "briefing.sqf";

//Start the system for handling Chemical Detectors.
null = [] spawn BLU_fnc_radioactivityChemDecInit;
null = [] spawn BLU_fnc_radioactivityChemDecBeep;
//Start the system for handling geiger counter imititation for chemical detectors.
null = [] spawn BLU_fnc_radioactivityGeigerClick;
//Start the system that handles damaging the player and checks if they are wearing protection
null = [] spawn BLU_fnc_radioactivityDamage;
//Starts the system for handling the player's breathing sfx
null = [player] spawn BLU_fnc_maskBreathing;

//Checks each frame if the local player is wearing a mask and then applies a filter if they are
//If the player removes the mask then the filter is removed
//Mask classes are defined in a public variable sent out by the server

/*
Known Issues:
- Connections between masks and backpacks work, but do not show to other clients
*/

addMissionEventHandler ["EachFrame", {
	if (goggles player in RadFacewear) then {
		if (!(player getVariable "MaskOn") || (goggles player != (player getVariable "Mask"))) then {
			switch (goggles player) do {
				case "G_AirPurifyingRespirator_01_F";
				case "G_AirPurifyingRespirator_01_nofilter_F": {
					"GasMask" cutRsc ["RscCBRN_APR", "PLAIN", -1, false];
					player setVariable ["MaskOn",true];
					player setVariable ["Mask",goggles player];
					[player] call BIN_fnc_CBRNHoseInit;
				};
				case "G_AirPurifyingRespirator_02_black_F";
				case "G_AirPurifyingRespirator_02_olive_F";
				case "G_AirPurifyingRespirator_02_sand_F": {
					"GasMask" cutRsc ["RscCBRN_APR_02", "PLAIN", -1, false];
					player setVariable ["MaskOn",true];	
					player setVariable ["Mask",goggles player];
					[player] call BIN_fnc_CBRNHoseInit;
				};
				case "G_RegulatorMask_F": {
					"GasMask" cutRsc ["RscCBRN_Regulator", "PLAIN", -1, false];
					player setVariable ["MaskOn",true];
					player setVariable ["Mask",goggles player];
					[player] call BIN_fnc_CBRNHoseInit;
				};
				default {
					"GasMask" cutRsc ["RscCBRN_APR", "PLAIN", -1, false];
					player setVariable ["MaskOn",true];
					player setVariable ["Mask",goggles player];
					[player] call BIN_fnc_CBRNHoseInit;
				};
			};
		};
	}
	else {
		if (player getVariable "MaskOn") then {
			"GasMask" cutText ["", "PLAIN"];
			player setVariable ["MaskOn",false];
			player setVariable ["Mask",""];
		};
	};
}];

//Similar to above, checks each frame if the player is wearing a CBRN uniform
addMissionEventHandler ["EachFrame", {
	if (uniform player in RadUniforms) then {
		if !(player getVariable "SuitOn") then {
			player setVariable ["SuitOn", true];
		};
	}
	else {
		if (player getVariable "SuitOn") then {
			player setVariable ["SuitOn", false];
		};
	};
}];