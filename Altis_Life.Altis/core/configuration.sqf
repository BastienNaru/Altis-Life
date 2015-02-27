#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 2; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_sync_time = time;
life_action_gathering = false;

//Persistent Saving
// Par défaut, je sauvegarde tout niveau armes et tout
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,0); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,100000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,3); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];

life_fatigue = 0.8; //Set the max fatigue limit (80%)
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(f2wqRL3J46UYrNb4pchK_period,5); //Five minutes
hBf0MznDHQm7X5DFFSmy = 0;
__CONST__(life_impound_car,350);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,850);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
life_vehicles_tracked = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		R6cuXKTCWDZFxfbfdATm = 10000; //Starting Bank Money
		f2wqRL3J46UYrNb4pchK = 5000; //Paycheck Amount
	};
	case civilian: 
	{
		R6cuXKTCWDZFxfbfdATm = 30000; //Starting Bank Money
		f2wqRL3J46UYrNb4pchK = 2000; //Paycheck Amount
	};
	
	case east:
	{
		R6cuXKTCWDZFxfbfdATm = 10000;
		f2wqRL3J46UYrNb4pchK = 5000;
	};
	
	case independent: {
		R6cuXKTCWDZFxfbfdATm = 6500;
		f2wqRL3J46UYrNb4pchK = 4000;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = [];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..


life_vShop_rentalOnly = [
	"I_Plane_Fighter_03_AA_F"
];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly);

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_barriere",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_menotte",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_phosphore",
	"life_inv_soude",
	"life_inv_meth",
	"life_inv_tracker",
	"life_inv_bouchons",
	"life_inv_storagesmall",
	"life_inv_storagebig"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_meth","civ"],
	["license_civ_medecin","civ"],
	["license_civ_depanneur","civ"],
	["license_civ_taxi","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",3000],["cocaine",1500],["cocainep",2500],["marijuana",2150],["turtle",3000],["blastingcharge",10000],["boltcutter",500],["phosphore",2000],["soude",2000],["meth",8000]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["heroinu",500],
	["heroinp",3000],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",1000],
	["turtle",3000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2150],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",500],
	["cocainep",2500],
	["diamond",750],
	["diamondc",2000],
	["iron_r",500],
	["copper_r",400],
	["salt_r",450],
	["glass",400],
	["fuelF",500],
	["spikeStrip",1200],
	["barriere",1200],
	["cement",1950],
	["goldbar",100000],
	["menotte",200],
	["bouchons",10],
	["meth",7000],
	["tracker",2000]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["barriere",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["menotte",800],
	["bouchons",50],
	["tracker",50000]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

/*
	Plus petit prix disponible pour chaque véhicule
	(utilisé pour calculer le prix de sortie, de vente, d'assurance, de location et de caution)
*/
life_vehicles_prices =
[
	["C_Kart_01_Blu_F",50000],
	["C_Kart_01_Fuel_F",50000],
	["C_Kart_01_Red_F",50000],
	["C_Kart_01_Vrana_F",50000],
	["B_Quadbike_01_F",5000],
	["C_Hatchback_01_F",21000],
	["C_Hatchback_01_sport_F",50000],
	["C_SUV_01_F",38000],
	["C_Offroad_01_F",45000],
	["C_Van_01_transport_F",90000],
	["C_Van_01_box_F",121000],
	["I_Truck_02_transport_F",170000],
	["I_Truck_02_covered_F",220000],
	["B_Truck_01_transport_F",530000],
	["B_Truck_01_box_F",850000],
	["O_Truck_03_device_F",650000],
	["I_Truck_02_box_F",50000],
	["B_Heli_Light_01_F",100000],
	["C_Heli_Light_01_civil_F",250000],
	["O_Heli_Light_02_unarmed_F",450000],
	["C_Rubberboat",10000],
	["I_G_Boat_Transport_01_F",15000],
	["C_Boat_Civil_01_F",44000],
	["O_MRAP_02_F",435000],
	["B_G_Offroad_01_armed_F",198000],
	["I_Heli_light_03_unarmed_F",1650000],
	["O_Heli_Transport_04_covered_F",1100000],
	["O_Heli_Attack_02_F",3300000],
	["I_MRAP_03_F",116000],
	["I_Plane_Fighter_03_AA_F",10000000]
];
__CONST__(life_vehicles_prices,life_vehicles_prices);