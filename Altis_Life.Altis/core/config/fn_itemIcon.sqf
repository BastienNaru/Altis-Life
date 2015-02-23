/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {("textures\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("textures\items\oil_processed.paa")};
	case "life_inv_heroinu": {("textures\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("textures\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("textures\items\cannabis.paa")};
	case "life_inv_marijuana": {("textures\items\marijuana.paa")};
	case "life_inv_apple": {("textures\items\apple.paa")};
	case "life_inv_rabbit": {("textures\items\meat.paa")};
	case "life_inv_salema": {("textures\items\fish.paa")};
	case "life_inv_ornate": {("textures\items\fish.paa")};
	case "life_inv_mackerel": {("textures\items\fish.paa")};
	case "life_inv_tuna": {("textures\items\fish.paa")};
	case "life_inv_mullet": {("textures\items\fish.paa")};
	case "life_inv_catshark": {("textures\items\fish.paa")};
	case "life_inv_turtle": {("textures\items\turtle.paa")};
	case "life_inv_fishingpoles": {("textures\items\fishingpoles.paa")};
	case "life_inv_water": {("textures\items\water.paa")};
	case "life_inv_coffee": {("textures\items\coffee.paa")};
	case "life_inv_turtlesoup": {("textures\items\turtle_soup.paa")};
	case "life_inv_donuts": {("textures\items\donut.paa")};
	case "life_inv_fuelE": {("textures\items\fuel_can.paa")};
	case "life_inv_fuelF": {("textures\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("textures\items\pickaxe.paa")};
	case "life_inv_copperore": {("textures\items\copper_ore.paa")};
	case "life_inv_ironore": {("textures\items\iron_ore.paa")};
	case "life_inv_ironr": {("textures\items\iron.paa")};
	case "life_inv_copperr": {("textures\items\copper.paa")};
	case "life_inv_sand": {("textures\items\sand.paa")};
	case "life_inv_salt": {("textures\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("textures\items\salt.paa")};
	case "life_inv_glass": {("textures\items\glass.paa")};
	case "life_inv_diamond": {("textures\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("textures\items\diamond.paa")};
	case "life_inv_tbacon": {("textures\items\meat.paa")};
	case "life_inv_redgull": {("textures\items\redgull.paa")};
	case "life_inv_lockpick": {("textures\items\lockpick.paa")};
	case "life_inv_peach": {("textures\items\peach.paa")};
	case "life_inv_coke": {("textures\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("textures\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("textures\items\spikestrip.paa")};
	case "life_inv_rock": {("textures\items\rock.paa")};
	case "life_inv_cement": {("textures\items\cement.paa")};
	case "life_inv_goldbar": {("textures\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("textures\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("textures\items\boltcutter.paa")};
	case "life_inv_defusekit": {("textures\items\defusekit.paa")};
	case "life_inv_storagesmall": {("textures\items\storagesmall.paa")};
	case "life_inv_storagebig": {("textures\items\storagebig.paa")};
};
