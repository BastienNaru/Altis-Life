enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.7";

life_adminsList = [
	"76561198032371812", // Cry
	"76561197981897974", // Seb
	"76561198144354778", // Pavel
	"76561198176118075", // Koba
	"76561198128002626", // Hugo
	"76561198129224992" // Malcom
];

life_modsList = [
	"76561198092815279", // Collins
	"76561198093015056", // John Rambo
	"76561198093024711", // John Cena
	"76561198062937481", // Pablo
	"76561198068492271", // Deamers
	"76561198057294586", // Narwin
	"76561197994460020" // VeckPex
];

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

// Addons
[] execVM "addons\init.sqf";

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
onPlayerDisconnected {[_id, _name, _uid] call life_fnc_onPlayerDisconnect};