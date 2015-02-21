#include <macro.h>
/*
	File: fn_vehiculeInsure.sqf
	Author: CryLegend
	
	Description:
	Assure le véhicule du garage sélectionné
*/
private["_dataArr","_vehicle","_vid","_pid","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_dataArr = lbData[2802,(lbCurSel 2802)];
_dataArr = call compile format["%1",_dataArr];
_vehicle = _dataArr select 0;
_hasInsurance =  (_dataArr select 2) - 1;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

if(_hasInsurance > 0) exitWith {hint "Ce véhicule est déjà assuré!"};

_price = [_vehicle,__GETC__(life_vehicles_price)] call TON_fnc_index;

if(_price == -1) then {
	_price = 5000;
}
else {
	_price = round(((__GETC__(life_vehicles_price) select _price) select 1) * 0.25);
};

hint "En attente de la réponse de votre assureur...";

[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleInsure",false,false] spawn life_fnc_MP;

closeDialog 0;