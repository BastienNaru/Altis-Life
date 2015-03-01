if ((getPlayerUID player) in life_adminsList + life_modsList) then {
	player addaction [("<t color=""#0074E8"">" + ("Menu d'Administration") +"</t>"),"addons\admintools\AdminToolsMain.sqf","",5,false,true,"",""];
};