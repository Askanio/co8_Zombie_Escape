diag_log "Escape: Bootstrapping mission...";

call compile preprocessFileLineNumbers "config.sqf";
call compile preprocessFileLineNumbers "Island\WorldConfig.sqf";

if(isServer) then {
	[] spawn zagor_fnc_missionFlow;
	[] spawn zagor_fnc_initServer;
	
};
if(hasInterface) then {
	[] spawn {
		titleText [localize "STR_Zagor_initLocalPlayer_Loading", "BLACK",0.1];
		[] call zagor_fnc_initLocalPlayer;
		sleep 2;
		titleFadeOut 2.0;
	};
};