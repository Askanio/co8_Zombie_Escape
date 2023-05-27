diag_log format["initClient run for %1 (%2)", name player, str _this];

if(!hasInterface) exitwith {};

waituntil {!isnull player};

call Zagor_FNC_Briefing;

sleep 0.5;

[player] remoteExec ["Zagor_fnc_initPlayer", 2];

[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call zagor_fnc_KeyDown"];
};

/*
AT_Revive_StaticRespawns = [];
AT_Revive_enableRespawn = false;
AT_Revive_clearedDistance = 0;
AT_Revive_Camera = 1;
*/

[] call Zagor_fnc_addUserActions;

removeAllAssignedItems player;
removeAllWeapons player;
removeAllItems player;
removeBackpack player;
removeVest player;
removeHeadgear player;
removeGoggles player;
if(hmd player != "") then {
	private _hmd = hmd player;
	player unlinkItem _hmd;
};

player addeventhandler["HandleRating","_this call Zagor_FNC_handleRating;"];

player addeventhandler["InventoryClosed","_this call Zagor_FNC_collectIntel;"];


drn_fnc_Escape_DisableLeaderSetWaypoints = {
	if (!visibleMap) exitwith {};
	
	{
		player groupSelectUnit [_x, false]; 
	} foreach units group player;
};

// If multiplayer, then disable the cheating "move to" waypoint feature.
if (isMultiplayer) then {
	[] spawn {
		waitUntil {!isNull(findDisplay 46)}; 
		// (findDisplay 46) displayAddEventHandler ["KeyDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
		(findDisplay 46) displayAddEventHandler ["MouseButtonDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
	};
};

waituntil{sleep 0.1;!isNil("Zagor_ParamsParsed")};
/*
AT_Revive_Camera = Zagor_Param_ReviveView;

//If no ACE use ATR revive

if (isClass(configFile >> "CfgPatches" >> "ACE_Medical")) then {
	player setVariable ["ACE_Revive_isUnconscious", false, true];
} else {
	call ATR_FNC_ReviveInit;
};
*/

setTerrainGrid Zagor_Param_Grass;

if (Zagor_Param_Magrepack == 1) then {
	[] execVM "Scripts\outlw_magRepack\MagRepack_init_sv.sqf";
};


[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call zagor_fnc_KeyDown"];
};
player setvariable["Zagor_PlayerInitializedLocal",true,true];


waituntil{sleep 0.1;(player getvariable["Zagor_PlayerInitializedServer",false])};

diag_log format["Escape debug: %1 is now ready (clientside).", name player];

/*
[] spawn {
	waituntil{sleep 0.5;!isNil("Zagor_EscapeHasStarted")};

	//Message delayed to make sure ACE_MedicalServer is broadcasted
	if ((isClass(configFile >> "CfgPatches" >> "ACE_Medical")) && !(ACE_MedicalServer)) then {systemChat "Player is running ACE on unsupported server! Please deactivate or gameplay could be servilely affected.";};
	if (!(isClass(configFile >> "CfgPatches" >> "ACE_Medical")) && (ACE_MedicalServer)) then {systemChat "Server is running ACE! Please install the compatible version and reconnect to prevent gamebreaking issues.";};
};
*/


//[] spawn {
//	waituntil{sleep 0.5;Zagor_Task_Prison_Complete};
	[localize "STR_Zagor_initLocalPlayer_somewhereOn", Zagor_WorldName , str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0) + " " + str (date select 3) + ":00"] spawn BIS_fnc_infoText;
//};

if(!isNil("CBA_fnc_addKeybind")) then {
	[] spawn {
		disableSerialization;
		["Zagor Earplugs", "toggle_earplugs_key", localize "STR_Zagor_initLocalPlayer_toggleEarplugs", {_this call Zagor_fnc_toggleEarplugs}, ""] call CBA_fnc_addKeybind;
	};
};

/*
switch (playerSide) do
{
	case west: { hint "You are BLUFOR"; };
	case east: { hint "You are OPFOR"; };
};
*/