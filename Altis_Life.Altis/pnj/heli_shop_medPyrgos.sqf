/* 
	CarshopLucel
*/
removeallWeapons _this; 
_this enableSimulation false; 
_this allowDamage false; 
_this addAction["<t color='#AAF200'>Héliport médecin</t>",
life_fnc_vehicleShopMenu,["medic_air",civilian,["medic_air_02","medic_air_02_1"]
,"civ","Héliport médecin"],0,false,false,"",'license_civ_medecin'];

_this addAction["<t color='#FF9900'>Garage</t>",
{  [[getPlayerUID player,playerSide,"Air",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
life_garage_type = "Air";
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,"Recherches des véhicules...."];
life_garage_sp = "medic_air_02";  },"",0,false,false,"",'license_civ_medecin'];
_this addAction["<t color='#FF9900'>Rentrer au garage</t>",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store && license_civ_medecin'];
_this setVariable["realname", "Héliport médecin"];