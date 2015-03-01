_pathtotools = "addons\admintools\tools\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';

if ((getPlayerUID player) in life_adminsList) then {
	ToolsMenu =
	[
		["",true],
			["Mode invincible", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
			["Véhicule invincible", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
			["Mode spectateur", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
			["Téléporter à soi", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
			["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
			["Se téléporter", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
			["Caméra libre", [8], "", -5, [["expression", format[_EXECscript1, "camera.sqf"]]], "1", "1"],
			["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Quitter", [13], "", -3, [["expression", ""]], "1", "1"]
	];
}
else {
	ToolsMenu =
	[
		["",true],
			["Mode spectateur", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
			["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
			["Caméra libre", [8], "", -5, [["expression", format[_EXECscript1, "camera.sqf"]]], "1", "1"],
			["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Quitter", [13], "", -3, [["expression", ""]], "1", "1"]
	];
};

showCommandingMenu "#USER:ToolsMenu";