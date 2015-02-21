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
			x = 1.1675;
			y = 0.3;
			w = 0.4;
			h = 1;
		};
	
	};
			
	class controls {
		
		class TextToSend : Life_RscTitle 
		{
		
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 1.2125;
			y = 0.510809;
			w = 0.2725;
			h = 0.04;
		};
		
		   class textEdit : Life_RscEdit 
		{
		
		idc = 3003;
		
		text = "";
		x = 1.2125; y = 0.640086;
		w = 0.325; h = 0.26;
		
		};
		
		class TextMsgButton : life_RscButtonMenu 
		{
			idc = 3015;
			text = "Message";
			colorBackground[] = {0,0.6,0.2,0.7};
			onButtonClick = "[] call TON_fnc_cell_textmsg";
			colorActive[] = {0,0,0,0};
			
			x = 1.2125;
			y = 0.94;
			w = 0.15;
			h = 0.05;
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 3004;
			
			x = 1.2125; y = 0.58;
			w = 0.2375; h = 0.04;
		};

		class TextCopButton : life_RscButtonMenu 
		{
			idc = 3016;
			text = "Police Secours";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_textcop";
			
			x = 1.375;
			y = 0.94;
			w = 0.15;
			h = 0.05;
		};
		
		class TextAdminButton : life_RscButtonMenu 
		{
			idc = 3017;
			text = "Aide";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_textadmin";
			
			x = 1.375;
			y = 1.02;
			w = 0.15;
			h = 0.05;
		};
		
		class AdminMsgButton : life_RscButtonMenu 
		{
			idc = 3020;
			text = "Msg Admin";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_adminmsg";
			
			x = 1.2125;
			y = 1.1;
			w = 0.15;
			h = 0.05;
		};
		
		class AdminMsgAllButton : life_RscButtonMenu 
		{
			idc = 3021;
			text = "Msg Global";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			
			x = 1.375;
			y = 1.1;
			w = 0.15;
			h = 0.05;
		};
		
		class EMSRequest : life_RscButtonMenu
		{
			idc = 3022;
			text = "SAMU";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_emsrequest";
			
			x = 1.2125;
			y = 1.02;
			w = 0.15;
			h = 0.05;
		};
		
		class CloseButtonKey : Life_RscButtonInvisibleByVoxid {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0,0,0,0};
			x = 1.36;
			y = 1.19;
			w = 0.065;
			h = 0.06;
		};
	};
};