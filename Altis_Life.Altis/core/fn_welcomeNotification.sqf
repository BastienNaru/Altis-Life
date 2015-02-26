/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
"" hintC parseText format[
"<t size='1.5' color='#3344DD'>Bienvenue à toi %1 sur le serveur d'AltisLife-France.com !</t><br />
<img size='5' image='textures\autre\logo.paa'/><br />
<br />
<t size='1.5' color='#FF0000'>Prénom + Nom RP obligatoire! (ex. Jean Durant)</t><br />
<br />
Notre TeamSpeak: <t color='#AAF200'>ts.altislife-france.com</t><br />
Notre Site: <t color='#AAF200'>www.altislife-france.com</t><br />
<br />
Pour obtenir de l'aide, ouvrez la carte et allez dans ""Infos utiles""<br />
<br />
Bon jeu sur notre serveur!"
, profileName];

welcomeNotification_hintC_EH = findDisplay 57 displayAddEventHandler ["unload", {
	0 = _this spawn {
		sleep 3;
		_this select 0 displayRemoveEventHandler ["unload", welcomeNotification_hintC_EH];
		hintSilent "";
	};
}];