/*
	File: fn_clothing_merco.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Magasin de mercenaire"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_B_CombatUniform_mcam_worn","Tenue de mercenaire",550],
			["U_B_survival_uniform",nil,550],
			["U_I_GhillieSuit",nil,15000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_HelmetB",nil,850],
			["H_Watchcap_blk",nil,850],
			["H_Beret_grn",nil,850],
			["H_Beret_Colonel",nil,800]	
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_I_G_resistanceLeader_F",nil,3500],
			["V_RebreatherIA",nil,2500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000]
		];
	};
};
