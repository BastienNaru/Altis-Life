#include <macro.h>
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_basePrice","_sellPrice","_retrievePrice","_hasInsurance","_insurance"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index; _dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_vehicleColor = [_className,_dataArr select 1] call life_fnc_vehicleColorStr;
_hasInsurance =  (_dataArr select 2) - 1;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_basePrice = [_className,__GETC__(life_vehicles_prices)] call TON_fnc_index;
_basePrice = if(_basePrice == -1) then {10000} else {(__GETC__(life_vehicles_prices) select _basePrice) select 1;};

_sellPrice = round(_basePrice * 0.5);

if (__GETC__(life_donator) >= 1) then {
	_sellPrice = round(_sellPrice * (1 + 0.05 * __GETC__(life_donator)));
};

if(playerSide == west) then {
	_retrievePrice = 1000
}
else {
	_retrievePrice = round(_basePrice * 0.1);
};

if (__GETC__(life_donator) >= 1) then {
	_retrievePrice = round(_retrievePrice * (1 - 0.05 * __GETC__(life_donator)));
};

_insurePrice = round(_basePrice * 0.25);

if (__GETC__(life_donator) >= 1) then {
	_insurePrice = round(_insurePrice * (1 - 0.05 * __GETC__(life_donator)));
};

if (_hasInsurance > 0) then {
  _insurance = "<t color='#00FF00'>Assuré</t>";
}
else {
  _insurance = "<t color='#FF0000'>Non assuré</t>";
};

(getControl(2800,2803)) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>%1€</t><br/>
	" +(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b'>%2€</t><br/>
	" +(localize "STR_Shop_Veh_UI_Color")+ " %3<br/>
	" +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %4 km/h<br/>
	" +(localize "STR_Shop_Veh_UI_HPower")+ " %5<br/>
	" +(localize "STR_Shop_Veh_UI_PSeats")+ " %6<br/>
	" +(localize "STR_Shop_Veh_UI_Trunk")+ " %7<br/>
	" +(localize "STR_Shop_Veh_UI_Fuel")+ " %8<br/>
	Assurance: %9<br/>
	Prix de l'assurance: <t color='#8cff9b'>%10€</t>
	",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
_vehicleColor,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_insurance,
_insurePrice
];

ctrlShow [2803,true];
ctrlShow [2830,true];