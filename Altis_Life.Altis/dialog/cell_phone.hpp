#define PHONE_X safeZoneX + safeZoneW - 0.15 - 0.4
#define PHONE_Y safeZoneY + safeZoneH - 0.05 - 1
#define COLUMN_1 PHONE_X + 0.045
#define COLUMN_2 COLUMN_1 + 0.1625

class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cellphone";
	
	class controlsBackground {
		class Voxidphone : Life_RscPicture 
		{
			idc = 3001;
			text = "textures\autre\telephone.paa";
			colorBackground[] = {0,0,0,0};
			x = PHONE_X;
			y = PHONE_Y;
			w = 0.4;
			h = 1;
		};
	};
			
	class controls {
		class TextToSend : Life_RscTitle 
		{
			idc = 3002;
			style = ST_CENTER;
			text = "Altis Messenger";
			x = COLUMN_1;
			y = PHONE_Y + 0.211;
			w = 0.3125;
			h = 0.04;
		};
		
		class textEdit : Life_RscEdit 
		{
			idc = 3003;
			text = "";
			colorBackground[] = {0.6,0.6,0.6,0.3};
			x = COLUMN_1;
			y = PHONE_Y + 0.345;
			w = 0.3125;
			h = 0.26;
		};
		
		class TextMsgButton : life_RscButtonMenu 
		{
			idc = 3015;
			text = "Message";
			colorBackground[] = {0,0.6,0.2,0.7};
			onButtonClick = "[] call TON_fnc_cell_textmsg";
			colorActive[] = {0,0,0,0};
			
			x = COLUMN_1;
			y = PHONE_Y + 0.64;
			w = 0.15;
			h = 0.05;
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 3004;
			
			x = COLUMN_1;
			y = PHONE_Y + 0.28;
			w = 0.3125;
			h = 0.04;
		};

		class TextCopButton : life_RscButtonMenu 
		{
			idc = 3016;
			text = "Police Secours";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_textcop";
			
			x = COLUMN_2;
			y = PHONE_Y + 0.64;
			w = 0.15;
			h = 0.05;
		};
		
		class TextAdminButton : life_RscButtonMenu 
		{
			idc = 3017;
			text = "Besoin d'aide";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_textadmin";
			
			x = COLUMN_2;
			y = PHONE_Y + 0.72;
			w = 0.15;
			h = 0.05;
		};
		
		class AdminMsgButton : life_RscButtonMenu 
		{
			idc = 3020;
			text = "Msg Admin";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_adminmsg";
			
			x = COLUMN_1;
			y = PHONE_Y + 0.8;
			w = 0.15;
			h = 0.05;
		};
		
		class AdminMsgAllButton : life_RscButtonMenu 
		{
			idc = 3021;
			text = "Msg Global";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			
			x = COLUMN_2;
			y = PHONE_Y + 0.8;
			w = 0.15;
			h = 0.05;
		};
		
		class EMSRequest : life_RscButtonMenu
		{
			idc = 3022;
			text = "SAMU";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_emsrequest";
			
			x = COLUMN_1;
			y = PHONE_Y + 0.72;
			w = 0.15;
			h = 0.05;
		};
		
		class CloseButtonKey : Life_RscButtonInvisibleByVoxid {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;";
			x = COLUMN_2 - 0.00625 - 0.025;
			y = PHONE_Y + 0.9;
			w = 0.05;
			h = 0.07;
		};
	};
};