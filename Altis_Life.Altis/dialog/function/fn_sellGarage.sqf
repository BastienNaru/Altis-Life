#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicle,__GETC__(life_vehicles_price)] call TON_fnc_index;

if(_price == -1) then {
	_price = 5000;
}
else {
	_price = round(((__GETC__(life_vehicles_price) select _price) select 1) * 0.5);
};

hint "En attente de la réponse de votre garagiste...";

[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;

closeDialog 0;