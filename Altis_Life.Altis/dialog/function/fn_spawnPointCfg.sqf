#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Comm. Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Comm. Pyrgos","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Comm. Athira","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Base Aérienne","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_5","Héliport","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};
	
	case east:
	{
		_return = [
			["merco_spawn_1","Base Mercenaire","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["merco_spawn_2","Base Mercenaire","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};
	
	case civilian:
	{
		if (license_civ_rebel) then {
			_return = [
				["reb_spawn_5","Camp Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_1","Camp Katalaki","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_2","Camp Frini","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_3","Camp Iraklia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_4","Camp Sfaka","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		}
		else {
			_return = [
				["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				//["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_5","Neochiri","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
			if (license_civ_medecin) then {
				_return pushBack ["medic_spawn_1","Hôpital Kavala","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
				_return pushBack ["medic_spawn_2","Poste de secours de l'aéroport","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
				_return pushBack ["medic_spawn_3","Poste de secours de Pyrgos","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
			};
		};
		
		if (grpPlayer getVariable ["gang_id", 0] == 371) then {
			_return pushBack ["base_spawn_lameute","Base de la Meute","\a3\ui_f\data\map\MapControl\rock_ca.paa"];
		};
		
		if (grpPlayer getVariable ["gang_id", 0] == 369) then {
			_return pushBack ["base_spawn_lamafia","Base de la A.R.I","\a3\ui_f\data\map\MapControl\rock_ca.paa"];
		};
		
		if (count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;