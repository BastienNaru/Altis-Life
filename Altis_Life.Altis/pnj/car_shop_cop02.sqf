/* 
	CarshopLucel
*/
_this enableSimulation false; 
_this allowDamage false; 
_this addAction["<t color='#00aeef'>Concessionnaire Police</t>",
life_fnc_vehicleShopMenu,["cop_car",west,["cop_car_2","cop_car_2_1"]
,"cop","Concessionnaire Police"]];

_this addAction["<t color='#FF9900'>Garage</t>",
{  [[getPlayerUID player,playerSide,"Car",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
life_garage_type = "Car";
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,"Recherches des véhicules...."];
life_garage_sp = "cop_car_2";  },"",0,false,false,"",'playerSide == WEST'];
_this addAction["<t color='#FF9900'>Rentrer au garage</t>",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store && playerSide == WEST'];
_this setVariable["realname", "Concessionnaire Police"];
