/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Erm�glicht senden bzw. die Abfrage des Geschriebenen.

*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if (hBf0MznDHQm7X5DFFSmy < 50000 ) exitWith { hint "Vous avez besoin de 50000� pour faire passer votre message!"; };
if (playerSide != civilian ) exitWith { hint "Vous devez �tre un civil!"; };
hBf0MznDHQm7X5DFFSmy = hBf0MznDHQm7X5DFFSmy - 50000;

_message = ctrlText 9001;

_message = [_message] call life_fnc_safeString;

[[1,format["<t size='2' color='#00FF00'>Message publicitaire</t><br /><br /><t align='left'><t color='#009000'>De la part de:</t> %1<br /><br /><t color='#009000'>Message:</t> <br />%2</t>", name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
