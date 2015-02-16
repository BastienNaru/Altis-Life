/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Btn11 37460
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(_curTarget isKindOf "House_F") exitWith {
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then {
		_display = findDisplay 37400;
		_Btn1 = _display displayCtrl Btn1;
		_Btn2 = _display displayCtrl Btn2;
		_Btn3 = _display displayCtrl Btn3;
		_Btn4 = _display displayCtrl Btn4;
		_Btn5 = _display displayCtrl Btn5;
		_Btn6 = _display displayCtrl Btn6;
		_Btn7 = _display displayCtrl Btn7;
		_Btn8 = _display displayCtrl Btn8;
		_Btn9 = _display displayCtrl Btn9;
		_Btn10 = _display displayCtrl Btn10;
		_Btn11 = _display displayCtrl Btn11;
		life_pInact_curTarget = _curTarget;
		
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor;";
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate;";
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;
		_Btn11 ctrlShow false;
	} else {
		closeDialog 0;
	};
};
		
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Btn11 = _display displayCtrl Btn11;
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

//Set Check Licenses Button
_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn2 buttonSetAction "[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn life_fnc_MP";

//Set Search Button
_Btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_copInteractionMenu;";
} else {
	_Btn4 ctrlSetText localize "STR_pInAct_Escort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Set Ticket Button
_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

_Btn6 ctrlSetText localize "STR_pInAct_Arrest";
_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_arrestAction;";

//Check that you are near jail to jail them.
if(!(player distance (getMarkerPos "jail_send") < 30)) then 
{
	_Btn6 ctrlEnable false;
};

_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

_Btn8 ctrlSetText "Saisir armes";
_Btn8 buttonSetAction "{life_pInact_curTarget removeWeaponGlobal _x} forEach weapons life_pInact_curTarget;";

if (count weapons life_pInact_curTarget == 0) then {
	_Btn8 ctrlEnable false;
};

_Btn9 ctrlSetText "Saisir cagoule";
_Btn9 buttonSetAction "[] call life_fnc_takeCagoule; closeDialog 0;";

if (!(headgear life_pInact_curTarget == "H_Shemag_olive"
	|| headgear life_pInact_curTarget == "H_ShemagOpen_khk"
	|| headgear life_pInact_curTarget == "H_Shemag_tan"
	|| headgear life_pInact_curTarget == "H_ShemagOpen_tan"
	|| goggles life_pInact_curTarget == "G_Balaclava_blk"
	|| goggles life_pInact_curTarget == "G_Balaclava_combat"
	|| goggles life_pInact_curTarget == "G_Balaclava_oli"
	|| goggles life_pInact_curTarget == "G_Bandanna_aviator"
	|| goggles life_pInact_curTarget == "G_Bandanna_sport"
	|| goggles life_pInact_curTarget == "G_Bandanna_shades")) then {
	_Btn9 ctrlEnable false;
};

_Btn10 ctrlSetText "Saisir Radio";
_Btn10 buttonSetAction "[] call life_fnc_takePhone; closeDialog 0;";

if (!("ItemRadio" in (items life_pInact_curTarget + assignedItems life_pInact_curTarget))) then {
	_Btn10 ctrlEnable false;
};

_Btn11 ctrlSetText "Saisir vêtements";
_Btn11 buttonSetAction "[] call life_fnc_takeUniform; closeDialog 0;";

_uni = ["U_IG_Guerilla1_1","U_I_G_Story_Protagonist_F","U_I_G_resistanceLeader_F","U_O_SpecopsUniform_ocamo","U_B_PilotCoveralls","U_O_PilotCoveralls","U_I_pilotCoveralls ","U_IG_leader","U_I_CombatUniform""U_O_CombatUniform_oucamo","U_O_GhillieSuit"];
_vest = ["V_TacVest_khk","V_BandollierB_cbr","V_TacVest_oli","V_HarnessO_brn","V_PlateCarrier1_rgr"];

if((!(uniform life_pInact_curTarget in _uni)) OR (!(vest life_pInact_curTarget in _vest))) then {
	_Btn11 ctrlEnable false;
};
