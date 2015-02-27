/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep","_isTazer"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

_isTazer = false;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball"] && _curWep in ["hgun_P07_F","hgun_P07_snds_F"]) then {
			_isTazer = true;
			
			_unit setDamage 0;
			
			private["_distance","_isVehicle","_isQuad"];
			_distance = 15;
			_isVehicle = if(vehicle player != player) then {true} else {false};
			_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) in ["B_Quadbike_01_F","C_Kart_01_F"]) then {true} else {false}} else {false};
			
			_damage = 0;
			if(_unit distance _source < _distance) then {
				if(!life_istazed && !(_unit getVariable["restrained",false])) then {
					if(_isVehicle) then {
						if (_isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						};
					} else {
						[_unit,_source] spawn life_fnc_tazed;
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			/*if(playerSide == west && side _source == west) then {
				_damage = false;
			};*/
		};
	};
};

if (_isTazer) exitWith {};

// Flashbang
if (_projectile in ["mini_Grenade"]) then {
	_damage = 0;
	[_projectile] spawn life_fnc_handleFlashbang;
};

if (_part != "?") then
{
	// Reduce impact damage (from vehicle collisions and falling)
	if (_projectile == "") then
	{
		_oldDamage = if (_selection == "") then { damage _unit } else { _unit getHit _selection };

		if (!isNil "_oldDamage") then
		{
			_damage = if ((vehicle _unit) isKindOf "ParachuteBase") then {
				_oldDamage // Disable collision damage while in parachute
			} else {
				((_damage - _oldDamage) * 0.5) + _oldDamage
			};
		};
	};

	// Revive stuff
	_this call FAR_HandleDamage_EH;
};

[] call life_fnc_hudUpdate;

_damage;