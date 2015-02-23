#include <macro.h>
/*
	File: fn_vehicleListCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vendeurs Véhicules
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
/*
****************************
***********CIVILS***********
****************************	
*/
// ********************
// ******* Kart *******
// ********************
	case "kart_shop":
	{
		_return =
		[
			["C_Kart_01_Blu_F",50000],
			["C_Kart_01_Fuel_F",50000],
			["C_Kart_01_Red_F",50000],
			["C_Kart_01_Vrana_F",50000]
		];				
	};	
// ********************
// ******* CARS *******
// ********************
	case "civ_car":
	{
		_return =
		[
			["B_Quadbike_01_F",5000],
			["C_Hatchback_01_F",21000],
			["C_Hatchback_01_sport_F",149000],
			["C_SUV_01_F",38000],
			["C_Offroad_01_F",45000],
			["C_Van_01_transport_F",90000]
		];
		
		if(license_civ_depanneur) then
		{
			_return pushBack ["C_Offroad_01_F",35000]; // service truck		
		};
		
		if(license_civ_taxi) then
		{
			_return pushBack ["C_SUV_01_F",35002]; // taxi		
			_return pushBack ["C_Offroad_01_F",25001]; // taxi pickup
		};			
	};	
	
// ********************
// ********************	
// ****** Trunck ******
// ********************
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",121000],
			["I_Truck_02_transport_F",170000],
			["I_Truck_02_covered_F",220000],
			["B_Truck_01_transport_F",530000],
			["B_Truck_01_box_F",850000],
			["O_Truck_03_device_F",650000],
			["I_Truck_02_box_F",50000] //Camion Pegasus
		];	
	};

// ********************
	
	case "civ_Pegasus_1":
	{
		_return =
		[
			["I_Truck_02_box_F",50000] //Camion Pegasus
		];	
	};
// ********************
// *******  AIR *******
// ********************	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",300000],
			["C_Heli_Light_01_civil_F",250000],
			["O_Heli_Light_02_unarmed_F",450000]
		];
			
		if(__GETC__(life_donator) >= 1) then
		{
			_return pushBack ["I_Plane_Fighter_03_AA_F",10000000];	
		};
	};

// ********************
// *******  MER *******
// ********************	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",10000],
			["I_G_Boat_Transport_01_F",15000],
			["C_Boat_Civil_01_F",44000]
		];
	};	

/*
****************************
**********REBELLES**********
****************************	
*/			
// ******* CARS *******

	case "reb_v":
	{
		_return =
		[
			["B_Quadbike_01_F",5000],
			["C_SUV_01_F",38000],
			["O_MRAP_02_F",435000],
			["B_G_Offroad_01_F",45000],
			["B_G_Offroad_01_armed_F",585000]
		];
	};

	case "reb_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",825000],
			["O_Heli_Light_02_unarmed_F",990000],
			["I_Heli_light_03_unarmed_F",1650000],
			["O_Heli_Transport_04_covered_F",1100000],
			["O_Heli_Attack_02_F",3300000]
		];		
	};

/*
****************************
**********MERCENAIRES**********
****************************	
*/			
// ******* CARS *******

	case "merco_v":
	{
		_return =
		[
			["B_Quadbike_01_F",1700],
			["C_SUV_01_F",12000],
			["I_MRAP_03_F",116000],
			["B_G_Offroad_01_F",35000],
			["B_G_Offroad_01_armed_F",198000]
		];		
	};
			
// ******* AIR *******

	case "merco_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",150000],
			["O_Heli_Light_02_unarmed_F",320000],
			["I_Heli_light_03_unarmed_F",430000]
		];	
	};

/*
****************************
***********POLICE***********
****************************	
*/	
// ******* CARS *******
	
	case "cop_car":
	{
		_return =
		[
			["B_Quadbike_01_F",5000],
			["C_Offroad_01_F",30000],
			["C_SUV_01_F",30000]
		];
			
		if(__GETC__(life_coplevel) > 1) then //lvl 2 - Brigadier/Sergent -
		{
			_return pushBack ["C_Hatchback_01_sport_F",50000];	
		};
		
		if(__GETC__(life_coplevel) > 3) then //lvl 4 - Adjudant/Adjudant-chef -
		{
			_return pushBack ["B_MRAP_01_F",150000];	
		};

		if(__GETC__(life_coplevel) > 4) then //lvl 5 - Major/Aspirant -
		{
			_return pushBack ["B_G_Offroad_01_armed_F",250000];
		};
					
		if(__GETC__(life_coplevel) > 5) then //lvl 6 - Major/Aspirant -
		{
			_return pushBack ["I_MRAP_03_F",150000];
		};
	};
	
// ********************
// *******  AIR *******
// ********************	
	case "cop_air":
	{
		if(__GETC__(life_coplevel) > 1) then //lvl 2 - Brigadier/Sergent 
		{
			_return pushBack ["B_Heli_Light_01_F",100000];	
		};

		if(__GETC__(life_coplevel) > 2) then //lvl 3
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F",200000];
		};

		if(__GETC__(life_coplevel) > 3) then //lvl 4
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",250000];
		};

		if(__GETC__(life_coplevel) > 4) then //lvl 5
		{
			_return pushBack ["B_Heli_Transport_01_F",1500000];	
		};
		
		if(__GETC__(life_coplevel) > 5) then //lvl 6
		{
			_return pushBack ["B_Heli_Light_01_armed_F",1000000];
			_return pushBack ["B_Heli_Transport_03_unarmed_F",1250000];
		};
		
		if(__GETC__(life_coplevel) > 6) then
		{
			_return pushBack ["B_Heli_Attack_01_F",1500000];
		};
	};

// ********************
// *******  MER *******
// ********************	
	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",2000]
		];
		
		if(__GETC__(life_coplevel) > 1) then //lvl 2 + Hors-Bord Police
		{
			_return pushBack ["C_Boat_Civil_01_police_F",30000];	
		};
		
		if(__GETC__(life_coplevel) > 6) then //lvl 7 + Sous-Marin+ Bateau Armé
		{
			_return pushBack ["B_SDV_01_F",50000];
			_return pushBack ["B_Boat_Armed_01_minigun_F",50000];	
		};
	};
	
// *********************	
// ********Medecin******
// *********************

	case "medecin_car":
	{
		_return pushBack ["C_Offroad_01_F",20000];
		_return pushBack ["C_SUV_01_F",25000];
		_return pushBack ["C_Hatchback_01_sport_F",40000];
		_return pushBack ["C_Van_01_box_F",100000];
	};
};

_return;
