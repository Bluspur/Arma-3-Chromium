//Facewear that protects the user from radiation
//Add modded gas mask classNames here
RadFacewear = [
	"G_AirPurifyingRespirator_01_nofilter_F",
	"G_AirPurifyingRespirator_01_F",
	"G_AirPurifyingRespirator_02_black_F",
	"G_AirPurifyingRespirator_02_olive_F",
	"G_AirPurifyingRespirator_02_sand_F",
	"G_RegulatorMask_F",
	"gm_gc_army_facewear_schm41m",
	"sg_sm_facewear_gp5",
	"gm_ge_facewear_m65"
	];
publicVariable "RadFacewear";
//CBRN uniforms that protect the user from radiation
//Add modded CBRN uniforms here
RadUniforms = [
	"U_B_CBRN_Suit_01_MTP_F",
	"U_B_CBRN_Suit_01_Tropic_F",
	"U_B_CBRN_Suit_01_Wdl_F",
	"U_I_CBRN_Suit_01_AAF_F",
	"U_I_E_CBRN_Suit_01_EAF_F",
	"U_C_CBRN_Suit_01_Blue_F",
	"U_C_CBRN_Suit_01_White_F",
	"sg_sm_cbr_suit_ozk"
	];
publicVariable "RadUniforms";
//View Distance
setViewDistance 1000;
//Starts the ambient sound system
null = [] spawn BLU_fnc_distantFire;
//Objective variables
missionNamespace setVariable ["ObjectiveCollect",false];
missionNamespace setVariable ["ObjectiveRescue",0];
//Sets up the hostage objective
null = [HostageGroup] spawn BLU_fnc_objectiveRescue;
//Start the system that checks the current state of objectives
null = [] execVM "scripts\taskFlow.sqf";