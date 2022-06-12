if (!isServer) exitWith {};
params ["_core"];

[
	_core,
	"Secure November",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa",
	"_this distance _target < 4",						// Condition for the action to be shown
	"_caller distance _target < 4",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{deleteVehicle _target; missionNamespace setVariable ["ObjectiveCollect",true];},							// Code execute on success
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	2,													// Action duration [s]
	0,													// Priority
	false,												// Remove on completion
	false												// Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd", 0, _core];	