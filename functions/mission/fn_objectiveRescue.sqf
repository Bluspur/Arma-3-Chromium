params ["_hostageGroup"];

private _animations = [
	"Acts_AidlPsitMstpSsurWnonDnon01",
	"Acts_AidlPsitMstpSsurWnonDnon02",
	"Acts_AidlPsitMstpSsurWnonDnon03",
	"Acts_AidlPsitMstpSsurWnonDnon04",
	"Acts_AidlPsitMstpSsurWnonDnon05"
];

private _blindfolds = [
	"G_Blindfold_01_black_F",
	"G_Blindfold_01_white_F"
];

{
	//Prep the unit for being a hostage
	removeAllItems _x;
	removeAllWeapons _x;
	removeHeadgear _x;
	removeGoggles _x;
	removeBackpack _x;
	removeVest _x;
	
	_x addGoggles (selectRandom _blindfolds);
	_x setCaptive true;
	_x setDamage (random 0.4);
	
	_x disableAI "MOVE";
	_x disableAI "ANIM";
	_x disableAI "AUTOTARGET";
	_x disableAI "RADIOPROTOCOL";
	
	_x allowFleeing 0;
	_x setBehaviour "CARELESS";

	//Randomly selects an animation
	_anim = selectRandom _animations;
	null = [_x,_anim] remoteExec ["switchMove", 0, _x];

	null = [
		_x,
		"Free Hostage",
		"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
		"(_this distance _target) < 5 && alive _target",
		"true",
		{},
		{},
		{

			if (_this select 3 select 0 == "Acts_ExecutionVictim_Loop") then {
								
				null = [(_this select 0),"Acts_ExecutionVictim_Unbow"] remoteExec ["playMove", 2, false];
				
			} else {
								
				null = [(_this select 0),"Acts_AidlPsitMstpSsurWnonDnon_out"] remoteExec ["switchMove", 0, false];
									
			};
								
			_complMessage = selectRandom [
			
				"I thought I was gonna die in here!",
				"Thank you so much man.",
				"Let's get out of here!",
				"Where the hell am I?",
				"I didn't think I was going to make it..."
			];
								
			null = ["Hostage", _complMessage] call BIS_fnc_showSubtitle;

			_update = missionNamespace getVariable "ObjectiveRescue";
			_update = _update + 1;
			missionNamespace setVariable ["ObjectiveRescue",_update];
			(_this select 0) addEventHandler ["Killed", {
				_update = missionNamespace getVariable "ObjectiveRescue";
				_update = _update - 1;
				missionNamespace setVariable ["ObjectiveRescue",_update];
			}];
						
			sleep 5.5;
			removeGoggles (_this select 0);
			null = [(_this select 0),"MOVE"] remoteExec ["enableAI", 2, false];
			null = [(_this select 0),"AUTOTARGET"] remoteExec ["enableAI", 2, false];
			null = [(_this select 0),"ANIM"] remoteExec ["enableAI", 2, false];
			null = [(_this select 0),"SAFE"] remoteExec ["setBehaviour", 2, false];
			null = [(_this select 0),"RADIOPROTOCOL"] remoteExec ["enableAI", 2, false];
			null = [(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove", [0,-2] select isDedicated,(_this select 0)];
			[(_this select 0)] join (group (_this select 1));

		},
		{
			_intrMessage = selectRandom [
							
				"Hey! I don't wanna die here!",
				"Don't leave me here man! Please!",
				"*Mumbles* Shit shit shit...",
				"Please! I want to go home!"
			];
			
			null = ["Hostage", _intrMessage] call BIS_fnc_showSubtitle;
		},
		[_anim],
		3,
		0,
		true,
		false
	] remoteExec ["bis_fnc_holdActionAdd", [0,-2] select isDedicated, _x];
} forEach units _hostageGroup;

