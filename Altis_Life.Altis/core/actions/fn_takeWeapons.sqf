/*
fn_takeWeapons.sqf
*/

private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
sleep 1;

{
	_unit removeWeaponGlobal _x
}
forEach weapons _unit;

[[2,"Quelqu'un vient de te saisir tes armes!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
titleText["Vous avez saisi les armes de cette personne.","PLAIN"];