// XPTCuratorLoadouts.hpp
// Used for defining advanced loadouts for Zeus spawned units (works almost the same as XPTLoadouts)
// Use XPT_fnc_exportInventory to get correct loadout format, picture guide can be found here: https://imgur.com/a/GrDaJNZ, courtesy of O'Mally
// Supports applying loadouts to crew in vehicles as long as crew classname matches the one defined in here
// Default behaviour is to check if the Zeus placed unit has a special loadout defined. Otherwise, it will use the default loadout as normal
// Advanced functionality allows mission creator to define exactly where items are placed in unit inventories
// Also supports sub-loadout randomization. If a loadout has sub-classes defined, the script will automatically select one of them to apply to the unit.
class curatorLoadouts
{
	class CUP_O_Partisans_soldier_TTsKO
	{
		//Requires the following DLC: Contact
		displayName = "CUP_O_Partisans_soldier_TTsKO";

		primaryWeapon[] = {"CUP_arifle_M4A1_standard_short_black","","CUP_acc_Flashlight","CUP_optic_MicroT1",{"CUP_30Rnd_556x45_Stanag_Tracer_Red",30},{},""};
		secondaryWeapon[] = {};
		handgunWeapon[] = {};

		uniformClass = "tmtm_u_commandoSweater_erdlArvn";
		headgearClass = "CUP_H_OpsCore_Black";
		facewearClass = "CUP_G_Scarf_Face_Blk";
		vestClass = "tmtm_v_modularVestLite_black";

		linkedItems[] = {"ItemMap","","ItemRadio","ItemCompass","ItemWatch",""};

		uniformItems[] = {{"FirstAidKit",1}};
		vestItems[] = {{"CUP_30Rnd_556x45_Stanag_Tracer_Red",6,30}};

		basicMedUniform[] = {};
		basicMedVest[] = {};

	};
};