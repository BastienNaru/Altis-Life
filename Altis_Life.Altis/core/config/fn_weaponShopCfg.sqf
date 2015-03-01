#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description: Vendeurs d'armes
	(refonte totale de la config)
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_Armes":
	{
		if (playerSide != west) then {
			"Seuls les policiers sont autorisés à commander des armes ici!"
		};
		
		_content =
		[
			["hgun_P07_snds_F","Tazer",2000],
			["16Rnd_9x21_Mag",nil,50],
			["SMG_02_F","Sting 9 mm",6200],
			["30Rnd_9x21_Mag",nil,60],
			["hgun_Pistol_Signal_F","Pistolet de détresse",2000],
			["6Rnd_GreenSignal_F","Fusée éclairante Verte",50],
			["6Rnd_RedSignal_F","Fusée éclairante Rouge",50]
		];
		
		if (__GETC__(life_coplevel) >= 2) then {
			_content pushBack ["hgun_Pistol_heavy_01_MRD_F",nil,2000];
			_content pushBack ["11Rnd_45ACP_Mag",nil,70];
			_content pushBack ["arifle_MXC_F","MXC 6.5 mm",7000];
			_content pushBack ["30Rnd_65x39_caseless_mag",nil,100];
		};
		
		if (__GETC__(life_coplevel) >= 3) then {
			_content pushBack ["arifle_Mk20_F","Mk20C 5.56 mm",5000];
			_content pushBack ["30Rnd_556x45_Stanag",nil,100];
		};
		
		if (__GETC__(life_coplevel) >= 4) then {
			_content pushBack ["arifle_MXM_F","MXM 6.5 mm",5000];
		};
		
		if (__GETC__(life_coplevel) >= 5) then {
			_content pushBack ["srifle_EBR_F","Mk18 ABR 7.62 mm",10000];
			_content pushBack ["20Rnd_762x51_Mag",nil,100];
			_content pushBack ["LMG_Mk200_F","Mk200 6.5 mm",10000];
			_content pushBack ["200Rnd_65x39_cased_Box",nil,100];
			_content pushBack ["srifle_LRR_LRPS_F","M320 LRR .408",50000];
			_content pushBack ["7Rnd_408_Mag",nil,100];
		};
		
		if (__GETC__(life_coplevel) >= 6) then {
			_content pushBack ["srifle_GM6_SOS_F","GM6 Lynx 12.7 mm",35000];
			_content pushBack ["5Rnd_127x108_Mag",nil,100];
			_content pushBack ["LMG_Zafir_F","Zafir 7.62 mm",10000];
			_content pushBack ["150Rnd_762x51_Box",nil,100];
			_content pushBack ["launch_Titan_short_F",nil,100000];
			_content pushBack ["Titan_AP",nil,75000];
		};
		
		["Armurerie police", _content];
	};

	case "cop_equip_Armes":
	{
		if (playerSide != west) then {
			"Seuls les policiers sont autorisés à commander des accessoires d'armes ici!"
		};
		
		_content =
		[
			["muzzle_snds_L","Silencieux 9 mm ",450],
			["optic_Aco_smg",nil,2000],
			["optic_Arco",nil,2000]
		];
		
		if (__GETC__(life_coplevel) >= 2) then {
			_content pushBack ["muzzle_snds_H","Silencieux 6.5 mm",380];
			_content pushBack ["optic_ACO_grn",nil,2000];
			_content pushBack ["optic_Holosight",nil,2000];
			_content pushBack ["optic_MRCO",nil,2000];
			_content pushBack ["optic_DMS",nil,2000];
			_content pushBack ["acc_pointer_IR",nil,2000];
			_content pushBack ["acc_flashlight",nil,1000];
		};
		
		if (__GETC__(life_coplevel) >= 3) then {
			_content pushBack ["muzzle_snds_M","Silencieux 5.56 mm",350];
		};
		
		if (__GETC__(life_coplevel) >= 4) then {
			_content pushBack ["muzzle_snds_B","Silencieux 7.62 mm",400];
			_content pushBack ["muzzle_snds_H_MG","Silencieux 6.5 mm pour Mk200",400];
			_content pushBack ["optic_NVS",nil,2000];
			_content pushBack ["optic_SOS",nil,2000];
			_content pushBack ["optic_LRPS",nil,2000];
		};
		
		["Armurerie police (accessoires)", _content];
	};

	case "cop_divers":
	{
		if (playerSide != west) then {
			"Seuls les policiers sont autorisés à accéder à ce shop";
		};
		
		_content =
		[
			["ItemMap",nil,50],
			["ItemGPS",nil,1250],
			["ItemRadio",nil,200],
			["Binocular",nil,150],
			["NVGoggles",nil,2500],
			["Rangefinder",nil,3400],
			["Chemlight_red",nil,300],
			["Chemlight_yellow",nil,300],
			["Chemlight_green",nil,300],
			["Chemlight_blue",nil,300],
			["ToolKit",nil,250],
			["FirstAidKit",nil,150],
			["Medikit",nil,2000]
		];
		
		if (__GETC__(life_coplevel) >= 2) then {
			_content pushBack ["MiniGrenade","Grenade aveuglante",500];
			_content pushBack ["SmokeShellBlue","Gaz lacrymogene",500];
		};
				
		if (__GETC__(life_coplevel) >= 4) then {
			_content pushBack ["B_UavTerminal",nil,2000];
		};
		
		["Divers", _content];
	};

	case "rebel":
	{
		if (playerSide != civilian || !license_civ_rebel) then {
			"Seuls les rebelles sont autorisés à commander des armes ici!"
		};
		
		_content =
		[
			["hgun_Pistol_heavy_02_F","Zubr .45",15000],
			["arifle_TRG20_F",nil,25000],
			["arifle_SDAR_F","Fusil de plongée SDAR",30000],
			["arifle_Katiba_F",nil,50000],
			["srifle_DMR_01_F",nil,80000],
			["srifle_EBR_ACO_F",nil,80000],
			["LMG_Mk200_F","Mk200 6.5 mm",125000],
			["LMG_Zafir_F","Zafir 7.62 mm",200000],
			["srifle_LRR_camo_F","M320 LRR .408",350000],
			["launch_RPG32_F",nil,500000],
			["optic_DMS",nil,2000],
			["optic_LRPS",nil,2000],
			["optic_MRCO",nil,2000],
			["optic_ACO_grn",nil,3500],
			["optic_Holosight",nil,3600],
			["optic_SOS",nil,2000],
			["optic_NVS",nil,7500],
			["optic_Arco",nil,2000],
			["optic_Yorris",nil,2000],
			["optic_Hamr",nil,3500],
			["acc_flashlight",nil,1000],
			["Rangefinder",nil,8000],
			["6Rnd_45ACP_Cylinder",nil,250],
			["30Rnd_9x21_Mag",nil,500],
			["20Rnd_556x45_UW_mag",nil,500],
			["30Rnd_556x45_Stanag",nil,500],
			["10Rnd_762x51_Mag",nil,300],
			["20Rnd_762x51_Mag",nil,500],
			["30Rnd_65x39_caseless_green",nil,500],
			["200Rnd_65x39_cased_Box",nil,1500],
			["150Rnd_762x51_Box",nil,1500],
			["7Rnd_408_Mag",nil,1000],
			["RPG32_F",nil,300000],
			["hgun_Pistol_Signal_F","Pistolet de détresse",2000],
			["6Rnd_GreenSignal_F","Fusée éclairante Verte",50],
			["6Rnd_RedSignal_F","Fusée éclairante Rouge",50]
		];
		
		if(__GETC__(life_donator) >= 1) then {
			_content pushBack ["srifle_GM6_camo_F","GM6 Lynx 12.7 mm",200000];
			_content pushBack ["5Rnd_127x108_Mag",nil,1000];
			_content pushBack ["arifle_Mk20_F","Mk20C 5.56 mm",28500];
			_content pushBack ["hgun_Pistol_heavy_01_F",nil,15000];
			_content pushBack ["11Rnd_45ACP_Mag",nil,110];
		};
		
		["Armurerie rebelle", _content];
	};

	case "merco":
	{
		if (playerSide != east) then {
			"Seuls les mercenaires sont autorisés à commander des armes ici!"
		};
		
		_content =
		[
			["hgun_Pistol_heavy_02_F","Zubr .45",5000],
			["arifle_TRG20_F",nil,8300],
			["arifle_SDAR_F","Fusil de plongée SDAR",10000],
			["arifle_MXM_Black_F","Mk20C 5.56 mm",13000],
			["arifle_MX_SW_Black_F",nil,50000],
			["srifle_DMR_01_F",nil,26000],
			["srifle_EBR_F",nil,26000],
			["LMG_Mk200_F","Mk200 6.5 mm",42000],
			["LMG_Zafir_F","Zafir 7.62 mm",60000],
			["srifle_LRR_F","M320 LRR .408",110000],
			["launch_NLAW_F",nil,160000],
			["optic_DMS",nil,660],
			["optic_LRPS",nil,660],
			["optic_MRCO",nil,660],
			["optic_ACO_grn",nil,1100],
			["optic_Holosight",nil,1200],
			["optic_SOS",nil,660],
			["optic_NVS",nil,2500],
			["optic_Arco",nil,660],
			["optic_Yorris",nil,660],
			["optic_Hamr",nil,1200],
			["acc_flashlight",nil,330],
			["Rangefinder",nil,2700],
			["6Rnd_45ACP_Cylinder",nil,80],
			["30Rnd_9x21_Mag",nil,170],
			["20Rnd_556x45_UW_mag",nil,170],
			["100Rnd_65x39_caseless_mag",nil,170],
			["10Rnd_762x51_Mag",nil,100],
			["20Rnd_762x51_Mag",nil,160],
			["30Rnd_65x39_caseless_mag",nil,160],
			["200Rnd_65x39_cased_Box",nil,500],
			["150Rnd_762x51_Box",nil,500],
			["7Rnd_408_Mag",nil,330],
			["NLAW_F",nil,100000],
			["hgun_Pistol_Signal_F","Pistolet de détresse",660],
			["6Rnd_GreenSignal_F","Fusée éclairante Verte",16],
			["6Rnd_RedSignal_F","Fusée éclairante Rouge",16]
		];
		
		if(__GETC__(life_donator) >= 1) then {
			_content pushBack ["srifle_GM6_F","GM6 Lynx 12.7 mm",75000];
			_content pushBack ["5Rnd_127x108_Mag",nil,300];
			_content pushBack ["arifle_Mk20_F","Mk20C 5.56 mm",9500];
			_content pushBack ["hgun_Pistol_heavy_01_F",nil,5000];
			_content pushBack ["11Rnd_45ACP_Mag",nil,30];
		};
		
		["Armurerie mercenaire", _content];
	};
	
	case "gun":
	{
		if (playerSide != civilian) then {
			"Seuls les civils sont autorisés à accéder à ce shop";
		};
		
		if (!license_civ_gun) then {
			"Le permis de port d'armes est requis pour commander des armes en toute légalité à cette armurerie";
		};
		
		_content =
		[
			["arifle_SDAR_F","Fusil de plongée SDAR",50000],
			["hgun_Rook40_F",nil,6500],
			["hgun_Pistol_heavy_02_F",nil,20000],
			["hgun_ACPC2_F",nil,11500],
			["hgun_PDW2000_F",nil,20000],
			["optic_ACO_grn_smg",nil,2500],
			["V_Rangemaster_belt",nil,2500],
			["6Rnd_45ACP_Cylinder",nil,100],
			["9Rnd_45ACP_Mag",nil,100],
			["16Rnd_9x21_Mag",nil,100],
			["30Rnd_9x21_Mag",nil,150],
			["30Rnd_556x45_Stanag",nil,500],
			["hgun_Pistol_Signal_F","Pistolet de détresse",2000],
			["6Rnd_GreenSignal_F","Fusée éclairante Verte",50],
			["6Rnd_RedSignal_F","Fusée éclairante Rouge",50]
		];
		
		["Armurerie (port d'armes requis)", _content];
	};
	
	case "gang":
	{
		if (playerSide != civilian) then {
			"Seuls les civils sont autorisés à accéder à ce shop";
		};
		
		if (license_civ_rebel) then {
			_content =
			[
				["hgun_Pistol_heavy_02_F","Zubr .45",15000],
				["arifle_TRG20_F",nil,25000],
				["arifle_SDAR_F","Fusil de plongée SDAR",30000],
				["arifle_Katiba_F",nil,50000],
				["srifle_DMR_01_F",nil,80000],
				["srifle_EBR_ACO_F",nil,80000],
				["LMG_Mk200_F","Mk200 6.5 mm",125000],
				["LMG_Zafir_F","Zafir 7.62 mm",200000],
				["srifle_LRR_camo_F","M320 LRR .408",350000],
				["launch_RPG32_F",nil,500000],
				["optic_DMS",nil,2000],
				["optic_LRPS",nil,2000],
				["optic_MRCO",nil,2000],
				["optic_ACO_grn",nil,3500],
				["optic_Holosight",nil,3600],
				["optic_SOS",nil,2000],
				["optic_NVS",nil,7500],
				["optic_Arco",nil,2000],
				["optic_Yorris",nil,2000],
				["optic_Hamr",nil,3500],
				["acc_flashlight",nil,1000],
				["Rangefinder",nil,8000],
				["6Rnd_45ACP_Cylinder",nil,250],
				["30Rnd_9x21_Mag",nil,500],
				["20Rnd_556x45_UW_mag",nil,500],
				["30Rnd_556x45_Stanag",nil,500],
				["10Rnd_762x51_Mag",nil,300],
				["20Rnd_762x51_Mag",nil,500],
				["30Rnd_65x39_caseless_green",nil,500],
				["200Rnd_65x39_cased_Box",nil,1500],
				["150Rnd_762x51_Box",nil,1500],
				["7Rnd_408_Mag",nil,1000],
				["RPG32_F",nil,300000],
				["hgun_Pistol_Signal_F","Pistolet de détresse",2000],
				["6Rnd_GreenSignal_F","Fusée éclairante Verte",50],
				["6Rnd_RedSignal_F","Fusée éclairante Rouge",50]
			];
			
			if(__GETC__(life_donator) >= 1) then {
				_content pushBack ["srifle_GM6_camo_F","GM6 Lynx 12.7 mm",200000];
				_content pushBack ["5Rnd_127x108_Mag",nil,1000];
				_content pushBack ["arifle_Mk20_F","Mk20C 5.56 mm",28500];
				_content pushBack ["hgun_Pistol_heavy_01_F",nil,15000];
				_content pushBack ["11Rnd_45ACP_Mag",nil,110];
			};
		
			["Armurerie gang rebelle", _content];
		}
		else {
			_content =
			[
				["arifle_Katiba_F",nil,60000],
				["arifle_SDAR_F","Fusil de plongée SDAR",30000],
				["hgun_Rook40_F",nil,11050],
				["hgun_Pistol_heavy_02_F",nil,25000],
				["hgun_ACPC2_F",nil,19550],
				["hgun_PDW2000_F",nil,34000],
				["optic_ACO_grn_smg",nil,4250],
				["optic_MRCO",nil,7500],
				["optic_ACO_grn",nil,7500],
				["V_Rangemaster_belt",nil,2000],
				["30Rnd_65x39_caseless_green",nil,500],
				["30Rnd_556x45_Stanag",nil,500],
				["16Rnd_9x21_Mag",nil,200],
				["9Rnd_45ACP_Mag",nil,200],
				["6Rnd_45ACP_Cylinder",nil,200],
				["30Rnd_9x21_Mag",nil,200]
			];
		
			["Armurerie gang civile", _content];
		};
	};
	
	case "gunblack":
	{
		if (playerSide != civilian) then {
			"Seuls les civils sont autorisés à accéder à ce shop";
		};
		
		_content =
		[
			["arifle_Katiba_F",nil,60000],
			["arifle_SDAR_F","Fusil de plongée SDAR",30000],
			["hgun_Rook40_F",nil,11050],
			["hgun_Pistol_heavy_02_F",nil,25000],
			["hgun_ACPC2_F",nil,19550],
			["hgun_PDW2000_F",nil,34000],
			["optic_ACO_grn_smg",nil,4250],
			["optic_MRCO",nil,7500],
			["optic_ACO_grn",nil,7500],
			["V_Rangemaster_belt",nil,2000],
			["30Rnd_65x39_caseless_green",nil,500],
			["30Rnd_556x45_Stanag",nil,500],
			["16Rnd_9x21_Mag",nil,200],
			["9Rnd_45ACP_Mag",nil,200],
			["6Rnd_45ACP_Cylinder",nil,200],
			["30Rnd_9x21_Mag",nil,200]
		];
		
		["Marché noir", _content];
	};
	
	case "genstore":
	{
		_content =
		[
				["Binocular",nil,150],
				["ItemMap",nil,50],
				["ItemGPS",nil,1250],
				["ItemRadio",nil,200],
				["ToolKit",nil,250],
				["FirstAidKit",nil,1500],
				["Medikit",nil,15000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
		];
		["Divers", _content];
	};
	
	case "medstore":
	{
		if (playerSide != civilian || !license_civ_medecin) then {
			"Seuls les médecins sont autorisés à accéder à ce shop";
		};
		
		_content =
		[
			["ItemMap",nil,50],
			["ItemGPS",nil,1250],
			["ItemRadio",nil,200],
			["Binocular",nil,150],
			["Rangefinder",nil,3400],
			["Chemlight_red",nil,300],
			["Chemlight_yellow",nil,300],
			["Chemlight_green",nil,300],
			["Chemlight_blue",nil,300],
			["ToolKit",nil,250],
			["Medikit",nil,2000]
		];
		
		["Divers", _content];
	};
	
	case "mercostore":
	{
		if (playerSide != east) then {
			"Seuls les mercenaires sont autorisés à accéder à ce shop";
		};
		
		_content =
		[
			["ItemMap",nil,50],
			["ItemGPS",nil,1250],
			["ItemRadio",nil,200],
			["Binocular",nil,150],
			["NVGoggles",nil,2500],
			["Rangefinder",nil,3400],
			["Chemlight_red",nil,300],
			["Chemlight_yellow",nil,300],
			["Chemlight_green",nil,300],
			["Chemlight_blue",nil,300],
			["MiniGrenade","Grenade aveuglante",500],
			["SmokeShellBlue","Gaz lacrymogene",500],
			["ToolKit",nil,250],
			["FirstAidKit",nil,150],
			["Medikit",nil,2000]
		];
		
		["Divers", _content];
	};
	
	case "rebstore":
	{
		_content =
		[
			["Binocular",nil,150],
			["ItemMap",nil,50],
			["ItemGPS",nil,1250],
			["ItemRadio",nil,200],
			["ToolKit",nil,250],
			["FirstAidKit",nil,1500],
			["Medikit",nil,15000],
			["Chemlight_red",nil,300],
			["Chemlight_yellow",nil,300],
			["Chemlight_green",nil,300],
			["Chemlight_blue",nil,300],
			["NVGoggles",nil,10000],
			["SmokeShellBlue","Gaz lacrymogene",10000]
		];
		
		["Divers", _content];
	};
	
	default
	{
		"Ce shop n'existe pas! Veuillez prévenir un membre de l'équipe de modération pour que cela soit corrigé.";
	};
};
