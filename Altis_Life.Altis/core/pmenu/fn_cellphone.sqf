#include <macro.h>
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_type"];

disableSerialization;

if(!("ItemRadio" in (assignedItems player))) exitWith {
	hint "Vous n'avez pas de téléphone! (Radio)";
	closeDialog 0;
};

if (player getVariable ["restrained", false]) exitWith {
	hint "Vous êtes menotté, il est donc difficile de sortir votre téléphone de votre poche!";
	closeDialog 0;
};

waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_units = _display displayCtrl 3004;

ctrlSetText [3003, ""];
lbClear _units;

if((__GETC__(life_adminlevel) < 1)) then
{
	ctrlShow[3020,false];
	ctrlShow[3021,false];
};
{
	if(alive _x && _x != player) then
	{
		switch (side _x) do
		{
			case west: {_type = "Policier"};
			case civilian: {_type = "Civil"};
			case independent: {_type = "Médecin"};
			case east: {_type = "Mercenaire"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [3004,0];