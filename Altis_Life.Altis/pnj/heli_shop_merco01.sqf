/* 
	CarshopLucel
*/
removeallWeapons _this; 
_this enableSimulation false; 
_this allowDamage false; 
_this addAction["<t color='#AAF200'>Héliport mercenaire</t>",
life_fnc_vehicleShopMenu,["merco_air",civilian,["air_merco_1"]
,"civ","Héliport mercenaire"],0,false,false,"",'player getVariable["merco_rank",0] > 0'];

_this addAction["<t color='#FF9900'>Garage</t>",
{  [[getPlayerUID player,playerSide,"Air",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
life_garage_type = "Air";
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,"Recherches des véhicules...."];
life_garage_sp = "air_merco_1";  },"",0,false,false,"",'player getVariable["merco_rank",0] > 0'];
_this addAction["<t color='#FF9900'>Rentrer au garage</t>",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store && player getVariable["merco_rank",0] > 0'];
_this setVariable["realname", "Héliport mercenaire"];