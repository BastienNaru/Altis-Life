/*
	File: fn_wantedInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls back information about the wanted criminal.
*/
private["_display","_list","_crimes","_bounty","_mylist","_count"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_mylist = [];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {_list lbAdd "Impossible d'actualiser les crimes";};
if(typeName _data != "ARRAY") exitWith {_list lbAdd "Impossible d'actualiser les crimes";};
if(count _data == 0) exitWith {_list lbAdd "Impossible d'actualiser les crimes";};
lbClear _list;

_crimes = _data select 2;
_bounty = _data select 3;
	
{
	_crime = _x;
	if(!(_crime in _mylist)) then
	{
		_mylist pushBack _crime;
		_count = {_x == _crime} count _crimes;
		if (_count > 1) then {
			_list lbAdd format["%1 accusations de %2",_count,_crime];
		}
		else {
			_list lbAdd format["%1 accusation de %2",_count,_crime];
		};
	};
} foreach _crimes;

ctrlSetText[2403,format["La prime sur ce joueur s'élève à %1€",[_bounty] call life_fnc_numberText]];