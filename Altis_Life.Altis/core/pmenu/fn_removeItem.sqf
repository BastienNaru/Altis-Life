/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Merci de sélectionner un item à supprimer.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Merci d'entrer un nombre valide."};
if(parseNumber(_value) <= 0) exitWith {hint "Merci d'entrer un montant valide d'items à supprimer."};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["Ceci est un item illégal, vous ne pouvez pas vous débarasser de cette preuve étant donné que la police tente de vous arrêter.","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Vous ne pouvez pas supprimer un item étant dans un véhicule.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Couldn't remove that much of that item, maybe you don't have that amount?"};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["You have successfully removed %1 %2 from your inventory.",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;