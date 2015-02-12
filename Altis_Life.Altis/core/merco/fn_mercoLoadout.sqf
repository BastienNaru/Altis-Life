/*
	File: fn_mercoLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: J.Deamers
	
	Description:
	Loads the merco out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default merco gear.
player addUniform "U_B_CombatUniform_mcam_worn";
//player addVest "V_I_G_resistanceLeader_F";


/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[] call life_fnc_saveGear;