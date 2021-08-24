// XPTloadouts.hpp
// Used for defining advanced respawn loadouts for players
// Default behaviour is to check if the player unit has a special loadout defined. Otherwise, it will check to see if the classname matches a loadout
// Advanced functionality allows mission creator to define exactly where items are placed in unit inventories
// Also supports sub-loadout randomization. If a loadout has sub-classes defined, the script will automatically select one of them to apply to the unit.
class loadouts
{	
	class CUP_B_US_SpecOps_TL 
	{
		//Requires the following DLC: Apex
		displayName = "CUP_B_US_SpecOps_TL";

		primaryWeapon[] = {"CUP_arifle_M4A1_SOMMOD_black","CUP_muzzle_snds_M16","ACE_acc_pointer_green","optic_Arco_blk_F",{"ACE_30Rnd_556x45_Stanag_Tracer_Dim",30},{},""};
		secondaryWeapon[] = {};
		handgunWeapon[] = {"hgun_P07_blk_F","CUP_muzzle_snds_M9","","",{"16Rnd_9x21_Mag",17},{},""};

		uniformClass = "tmtm_u_combatUniformC_mcamBGrey";
		headgearClass = "tmtm_h_helmetEnhanced_grey";
		facewearClass = "G_Balaclava_TI_blk_F";
		vestClass = "V_PlateCarrier2_blk";
		backpackClass = "tmtm_b_rangemasterBelt_blk";

		linkedItems[] = {"ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ItemWatch","CUP_NVG_GPNVG_black"};

		uniformItems[] = {{"ACE_CableTie",4},{"ItemcTabHCam",1},{"ACE_Flashlight_MX991",1},{"16Rnd_9x21_Mag",2,17}};
		vestItems[] = {{"ACE_30Rnd_556x45_Stanag_Tracer_Dim",10,30},{"ACE_M84",4,1},{"B_IR_Grenade",4,1},{"MiniGrenade",2,1}};
		backpackItems[] = {{"ACE_wirecutter",1},{"B_IR_Grenade",2,1}};

		basicMedUniform[] = {{"ACE_fieldDressing",10},{"ACE_epinephrine",2},{"ACE_morphine",1},{"ACE_tourniquet",4}};
		basicMedVest[] = {};
		basicMedBackpack[] = {{"ACE_fieldDressing",10},{"ACE_epinephrine",2},{"ACE_morphine",1}};
	};
	
	class CUP_B_US_SpecOps_Medic
	{
		//Requires the following DLC: Apex
		displayName = "CUP_B_US_SpecOps_Medic";

		primaryWeapon[] = {"CUP_arifle_M4A1_SOMMOD_black","CUP_muzzle_snds_M16","ACE_acc_pointer_green","optic_Arco_blk_F",{"ACE_30Rnd_556x45_Stanag_Tracer_Dim",30},{},""};
		secondaryWeapon[] = {};
		handgunWeapon[] = {"hgun_P07_blk_F","CUP_muzzle_snds_M9","","",{"16Rnd_9x21_Mag",17},{},""};

		uniformClass = "tmtm_u_combatUniformC_mcamBGrey";
		headgearClass = "tmtm_h_helmetEnhanced_grey";
		facewearClass = "G_Balaclava_TI_blk_F";
		vestClass = "V_PlateCarrier2_blk";
		backpackClass = "B_TacticalPack_blk";

		linkedItems[] = {"ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ItemWatch","CUP_NVG_GPNVG_black"};

		uniformItems[] = {{"ACE_CableTie",4},{"ItemcTabHCam",1},{"ACE_Flashlight_MX991",1},{"16Rnd_9x21_Mag",2,17}};
		vestItems[] = {{"ACE_30Rnd_556x45_Stanag_Tracer_Dim",10,30},{"ACE_M84",4,1},{"B_IR_Grenade",4,1},{"MiniGrenade",2,1}};
		backpackItems[] = {{"ACE_wirecutter",1}};

		basicMedUniform[] = {{"ACE_fieldDressing",10},{"ACE_epinephrine",2},{"ACE_morphine",1},{"ACE_tourniquet",4}};
		basicMedVest[] = {};
		basicMedBackpack[] = {{"ACE_fieldDressing",30},{"ACE_epinephrine",10},{"ACE_morphine",10},{"ACE_bloodIV",4},{"ACE_bloodIV_500",4},{"ACE_bloodIV_250",4},{"ACE_adenosine",5},{"ACE_tourniquet",4}};
	};
	
	class CUP_B_US_SpecOps
	{
		//Requires the following DLC: Apex
		displayName = "CUP_B_US_SpecOps";

		primaryWeapon[] = {"CUP_arifle_M4A1_SOMMOD_black","CUP_muzzle_snds_M16","ACE_acc_pointer_green","optic_Arco_blk_F",{"ACE_30Rnd_556x45_Stanag_Tracer_Dim",30},{},""};
		secondaryWeapon[] = {};
		handgunWeapon[] = {"hgun_P07_blk_F","CUP_muzzle_snds_M9","","",{"16Rnd_9x21_Mag",17},{},""};

		uniformClass = "tmtm_u_combatUniformC_mcamBGrey";
		headgearClass = "tmtm_h_helmetEnhanced_grey";
		facewearClass = "G_Balaclava_TI_blk_F";
		vestClass = "V_PlateCarrier2_blk";
		backpackClass = "tmtm_b_rangemasterBelt_blk";

		linkedItems[] = {"ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ItemWatch","CUP_NVG_GPNVG_black"};

		uniformItems[] = {{"ACE_CableTie",4},{"ItemcTabHCam",1},{"ACE_Flashlight_MX991",1},{"16Rnd_9x21_Mag",2,17}};
		vestItems[] = {{"ACE_30Rnd_556x45_Stanag_Tracer_Dim",10,30},{"ACE_M84",4,1},{"B_IR_Grenade",4,1},{"MiniGrenade",2,1}};
		backpackItems[] = {{"ACE_wirecutter",1}};

		basicMedUniform[] = {{"ACE_fieldDressing",10},{"ACE_epinephrine",2},{"ACE_morphine",1},{"ACE_tourniquet",4}};
		basicMedVest[] = {};
		basicMedBackpack[] = {{"ACE_fieldDressing",10},{"ACE_epinephrine",2},{"ACE_morphine",1}};
	};
	
	class CUP_B_US_SpecOps_UAV
	{
		//Requires the following DLC: Apex
		displayName = "CUP_B_US_SpecOps_UAV";

		primaryWeapon[] = {"CUP_arifle_M4A1_SOMMOD_black","CUP_muzzle_snds_M16","ACE_acc_pointer_green","optic_Arco_blk_F",{"ACE_30Rnd_556x45_Stanag_Tracer_Dim",30},{},""};
		secondaryWeapon[] = {};
		handgunWeapon[] = {"hgun_P07_blk_F","CUP_muzzle_snds_M9","","",{"16Rnd_9x21_Mag",17},{},""};

		uniformClass = "tmtm_u_combatUniformC_mcamBGrey";
		headgearClass = "tmtm_h_helmetEnhanced_grey";
		facewearClass = "G_Balaclava_TI_blk_F";
		vestClass = "V_PlateCarrier2_blk";
		backpackClass = "tmtm_b_rangemasterBelt_blk";

		linkedItems[] = {"ItemMap","B_UavTerminal","TFAR_anprc152","ItemCompass","ItemWatch","CUP_NVG_GPNVG_black"};

		uniformItems[] = {{"ACE_CableTie",4},{"ItemcTabHCam",1},{"ACE_Flashlight_MX991",1},{"16Rnd_9x21_Mag",2,17}};
		vestItems[] = {{"ACE_30Rnd_556x45_Stanag_Tracer_Dim",10,30},{"ACE_M84",4,1},{"B_IR_Grenade",4,1},{"MiniGrenade",2,1}};
		backpackItems[] = {{"ACE_wirecutter",1}};

		basicMedUniform[] = {{"ACE_fieldDressing",10},{"ACE_epinephrine",2},{"ACE_morphine",1},{"ACE_tourniquet",4}};
		basicMedVest[] = {};
		basicMedBackpack[] = {{"ACE_fieldDressing",10},{"ACE_epinephrine",2},{"ACE_morphine",1}};
	};
};