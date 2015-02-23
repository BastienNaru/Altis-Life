/*
	File: ESP.sqf
	Description: Voir joueurs sur la map
*/
private["_markers"];

if (esp_enabled) exitWith {esp_enabled = false;};

esp_enabled = true;

cutText ["ESP activé", "PLAIN"];

while {esp_enabled} do
{
	_markers = [];
	
	{
		deleteMarkerLocal format["%1_espmarker",_x];
		
		_marker = createMarkerLocal [format["%1_espmarker",_x],visiblePosition _x];
		
		_color = switch (side _x) do {
			case west: {"ColorBLUFOR"};
			case east: {"ColorOPFOR"};
			case civilian: {"ColorCivilian"};
			default {"ColorUNKNOWN"};
		};
		
		_marker setMarkerColorLocal _color;
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];

		_markers pushBack [_marker,_x];
	} foreach playableUnits;
	
	sleep 0.02;
	
	{
		if (!alive (_x select 1)) then {
			deleteMarkerLocal (_x select 0);
		};
	} foreach _markers;
};

cutText ["ESP désactivé", "PLAIN"];