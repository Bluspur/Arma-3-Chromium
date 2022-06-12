if (!isServer) exitWith {};
//Collection Objective
[
	true,
	"CollectTask",
	"CollectTask",
	objNull,
	"CREATED"
] call BIS_fnc_taskCreate;

//Rescue Objective
[
	true,
	"RescueTask",
	"RescueTask",
	objNull,
	"CREATED"
] call BIS_fnc_taskCreate;

while {sleep 2; true} do {
	//Check the stage of the collection objective
	if ((missionNamespace getVariable "ObjectiveCollect") && ("CollectTask" call BIS_fnc_taskState != "SUCCEEDED")) then {
		["CollectTask","SUCCEEDED"] call BIS_fnc_taskSetState;
		[
			true,
			"ExtractTask",
			"ExtractTask",
			(getMarkerPos "markerStart"),
			"ASSIGNED"
		] call BIS_fnc_taskCreate;
	};
	//Check the stage of the extract objective
	if ((count(allPlayers inAreaArray ExtractArea) > 0) && ("CollectTask" call BIS_fnc_taskState == "SUCCEEDED") && ("ExtractTask" call BIS_fnc_taskState != "SUCCEEDED")) then {
		_hostages = missionNamespace getVariable "ObjectiveRescue";
		switch (_hostages) do {
			case 0:
			{
				["ExtractTask","SUCCEEDED"] call BIS_fnc_taskSetState;
				sleep 3;
				["RescueTask","FAILED"] call BIS_fnc_taskSetState;
				sleep 3;
				"End0" call BIS_fnc_endMissionServer;
			};
			case 1:
			{
				["ExtractTask","SUCCEEDED"] call BIS_fnc_taskSetState;
				sleep 3;
				["RescueTask","SUCCEEDED"] call BIS_fnc_taskSetState;
				sleep 3;
				"End1" call BIS_fnc_endMissionServer;
			};
			case 2:
			{
				["ExtractTask","SUCCEEDED"] call BIS_fnc_taskSetState;
				sleep 3;
				["RescueTask","SUCCEEDED"] call BIS_fnc_taskSetState;
				sleep 3;
				"End2" call BIS_fnc_endMissionServer;
			};
		};
	};
};