#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if ((__GETC__(life_mercoLevel)) == 0) exitWith {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

if ((str(player) in ["merco_16","merco_17","merco_18","merco_19","merco_20"])) exitWith {
	if((__GETC__(life_donator) < 1)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

if ((str(player) in ["merco_01"]) && (__GETC__(life_mercoLevel) < 10)) exitWith {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

player setVariable["merco_rank",(__GETC__(life_mercoLevel)),true];

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.