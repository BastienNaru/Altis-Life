/*
fn_takeUniform.sqf
*/

private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
sleep 1;
[[2,format["Quelqu'un vient de te déchirer tes vêtements!", name _unit, name player]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
titleText[format["Vous avez déchiré les vêtements de cette personne."],"PLAIN"];
removeUniform _unit;
removeVest _unit;
