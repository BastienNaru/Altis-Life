/*
    Fichier: fn_tracker.sqf
    Autheur: Poseidon / Modifié par DeathBlade
    
    Description: Attache un traqueur GPS sur le véhicule sélectionné.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _unit) exitWith {};

if(!(_unit isKindOf "AllVehicles") && !(isPlayer _unit)) exitWith {hint "Vous ne pouvez pas utiliser le GPS tracker ici."};

if (_unit isKindOf "AllVehicles") then {
	_type = "véhicule";
}
else {
	if (!(isPlayer _unit)) exitWith {
		hint "Vous ne pouvez pas utiliser le GPS tracker ici.";
	}
	else {
		_type = "véhicule";
	};
};

if(player distance _unit > 7) exitWith {hint "Vous devez vous mettre plus près du véhicule !"};

if(!([false,"tracker",1] call life_fnc_handleInv)) exitWith {};

closeDialog 0;

life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4;
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Vous n'êtes pas à proximité d'un véhicule !","PLAIN"];};
titleText["Vous avez un GPS tracker fixé à ce véhicule.","PLAIN"];


[_unit] spawn {
    _veh = _this select 0;
    _markerName = format["%1_gpstracker",_veh];
    _marker = createMarkerLocal [_markerName, visiblePosition _veh];
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerTypeLocal "Mil_dot";
    _marker setMarkerTextLocal "GPS Tracker " + getText(configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
    _marker setMarkerPosLocal getPos _veh;
    while {true} do {
        if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
        _marker setMarkerPosLocal getPos _veh;
        sleep 0.5;
    };
};​
