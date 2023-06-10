//waituntil{!isNil("BIS_fnc_init")};
if(!isServer) exitwith {};
["Server started."] spawn Zagor_fnc_debugmsg;
if(isNil("Zagor_var_commonLibInitialized")) then {
	call compile preprocessFileLineNumbers "Scripts\DRN\CommonLib\CommonLib.sqf";
};

// saving disabled, does not autosave
enableSaving [false, false];

//Parse the parameters
call Zagor_fnc_parameterInit;

call compile preprocessFileLineNumbers "Scripts\Escape\Functions.sqf";
//call compile preprocessFileLineNumbers "Scripts\Escape\AIskills.sqf";

if(!isNil("Zagor_Param_Debug")) then {
	if((Zagor_Param_Debug)==0 && !(missionNamespace getVariable ["Zagor_Debug_overwrite",false])) then {
		Zagor_Debug = false;
	} else {
		Zagor_Debug = true;
		["Debug mode active!."] spawn Zagor_fnc_debugmsg;
	};
} else {
	Zagor_Debug = true;
	["Warning! Debug was set to true because of missing param!."] spawn Zagor_fnc_debugmsg;
};
publicVariable "Zagor_Debug";


//ACE Revive
/*
AT_Revive_Camera = Zagor_Param_ReviveView; //Needs to be stored on server now
*/
ACE_MedicalServer = false;
if (isClass(configFile >> "CfgPatches" >> "ACE_Medical")) then {
	ACE_MedicalServer = true;
	["ace_unconscious", {params["_unit", "_isDown"]; [_unit,_isDown] spawn ACE_fnc_HandleUnconscious;}] call CBA_fnc_addEventHandler;
};
publicVariable "ACE_MedicalServer";



//Load Statistics
[] spawn Zagor_fnc_LoadStatistics;



// Add crashsite here
//##############



//private ["_villagePatrolSpawnArea","_EnemyCount","_enemyMinSkill", "_enemyMaxSkill", "_searchChopperSearchTimeMin", "_searchChopperRefuelTimeMin", "_enemySpawnDistance", "_playerGroup", "_enemyFrequency", "_scriptHandle"];

//_enemyFrequency = (Zagor_Param_EnemyFrequency);
//_enemySpawnDistance = (Zagor_Param_EnemySpawnDistance);

[0] call compile preprocessFileLineNumbers "Units\UnitClasses.sqf";

// prison is created locally, clients need flag texture path
publicVariable "Zagor_VAR_Flag_Ind";

// Developer Variables
//diag_log format["Zagor_VAR_Side_Blufor: '%1'", Zagor_VAR_Side_Blufor_Str];
//diag_log format["Zagor_VAR_Side_Opfor: '%1'", Zagor_VAR_Side_Opfor_Str];

createCenter Zagor_VAR_Side_Opfor;
createCenter Zagor_VAR_Side_Ind;

//if(isNil("Zagor_Param_War_Torn")) then {
//	Zagor_Param_War_Torn = 0;
//};
Zagor_VAR_Side_Blufor setFriend [Zagor_VAR_Side_Ind, 0];
Zagor_VAR_Side_Ind setFriend [Zagor_VAR_Side_Blufor, 0];

Zagor_VAR_Side_Blufor setFriend [Zagor_VAR_Side_Opfor, 0];
Zagor_VAR_Side_Opfor setFriend [Zagor_VAR_Side_Blufor, 0];
	
//if(Zagor_Param_War_Torn == 0) then {
//	Zagor_VAR_Side_Opfor Setfriend [Zagor_VAR_Side_Ind, 1];
//	Zagor_VAR_Side_Ind setFriend [Zagor_VAR_Side_Opfor, 1];
//} else {
	Zagor_VAR_Side_Opfor Setfriend [Zagor_VAR_Side_Ind, 0];
	Zagor_VAR_Side_Ind setFriend [Zagor_VAR_Side_Opfor, 0];
//};



[true] spawn Zagor_fnc_weather;

private ["_hour","_date"];
_hour = Zagor_Param_TimeOfDay;
switch (Zagor_Param_TimeOfDay) do {
    case 24: { 
		_hour = round(random(24));
	};
    case 25: {
		_hour = 6+round(random(10));  //Between 0600 and 1600
	};
	case 26: { 
		_hour = 17 + round(random(11)); //Between 1700 and 0400
		_hour = _hour % 24;
	};
    default { _hour = Zagor_Param_TimeOfDay };
};
_date = date;
_date set [3,_hour];
_date set [4,0];

Zagor_VAR_Escape_hoursSkipped = _hour - (date select 3);
publicVariable "Zagor_VAR_Escape_hoursSkipped";
		
[_date] call bis_fnc_setDate;


setTimeMultiplier Zagor_Param_TimeMultiplier;
call compile preprocessFileLineNumbers ("Island\CommunicationCenterMarkers.sqf");


// Game Control Variables, do not edit!

Zagor_VAR_Escape_AllPlayersDead = false;
Zagor_VAR_Escape_MissionComplete = false;
publicVariable "Zagor_VAR_Escape_AllPlayersDead";
publicVariable "Zagor_VAR_Escape_MissionComplete";

Zagor_VAR_GrpNumber = 0;

if(isNil("Zagor_Param_EnemySkill")) then {
	Zagor_Param_EnemySkill = 1;
};

_enemyMinSkill = 0.40;
_enemyMaxSkill = 0.60;

//Kudos to Semiconductor

switch (Zagor_Param_EnemySkill) do { 
    // Convert value from params.hpp into acceptable range 
    case 0: { _enemyMinSkill = 0.10; _enemyMaxSkill = 0.30; }; 
    case 1: { _enemyMinSkill = 0.30; _enemyMaxSkill = 0.50; }; 
    case 2: { _enemyMinSkill = 0.40; _enemyMaxSkill = 0.60; }; 
    case 3: { _enemyMinSkill = 0.60; _enemyMaxSkill = 0.80; }; 
    case 4: { _enemyMinSkill = 0.80; _enemyMaxSkill = 0.95; }; 
    default { _enemyMinSkill = 0.40; _enemyMaxSkill = 0.60; }; 
}; 

Zagor_VAR_Escape_enemyMinSkill = _enemyMinSkill; 
Zagor_VAR_Escape_enemyMaxSkill = _enemyMaxSkill; 
Zagor_VAR_Escape_enemyMinSkill = _enemyMinSkill;
Zagor_VAR_Escape_enemyMaxSkill = _enemyMaxSkill;

//_searchChopperSearchTimeMin = (5 + random 10);
//_searchChopperRefuelTimeMin = (5 + random 10);


//_villagePatrolSpawnArea = (Zagor_Param_VillageSpawnCount);

drn_searchAreaMarkerName = "drn_searchAreaMarker";

//Getting exclusion zones
if(isNil("Zagor_ExclusionZones")) then {
  Zagor_ExclusionZones = [];
  {
    if("Zagor_ExclusionZone" in _x && _x != "Zagor_ExclusionZone_") then {
      Zagor_ExclusionZones pushback _x;
	  if(!Zagor_Debug) then {_x setMarkerAlpha 0;};
    };
  } foreach allMapMarkers;
};

// Choose a start position
if(isNil("Zagor_ClearedPositionDistance")) then {
	Zagor_ClearedPositionDistance = 500;
};

Zagor_StartPos = [] call zagor_fnc_findFlatArea;
while {{Zagor_StartPos inArea _x} count Zagor_ExclusionZones > 0} do {
	Zagor_StartPos = [] call zagor_fnc_findFlatArea;
};
publicVariable "Zagor_StartPos";


private	_center = createCenter sideLogic;    
//Zagor_VAR_VillageZombieModuleGroup = createGroup _center;
Zagor_VAR_AdminZombieModuleGroup = createGroup _center;
Zagor_VAR_Villages = []; // [x,y], size
//Zagor_VAR_ActiveZombieModule = []; // [villageId]
Zagor_VAR_SitesPoint = []; // [type, point, group] type: 1 - small medical, 2 - medical, 3 - , 4 - comCenter
Zagor_VAR_SitesPointObjects = []; // [[objects]]
Zagor_VAR_SitesPointGuid = 0; // Global GUID for all sites

Zagor_VAR_ClearedPositions = [];
Zagor_VAR_ClearedPositions pushBack Zagor_StartPos;
Zagor_VAR_ClearedPositions pushBack (getMarkerPos "drn_insurgentAirfieldMarker");

private _startHeli = [] call Zagor_fnc_createStartpos;

//### The following is a mission function now

[true] call drn_fnc_InitVillageMarkers;
[true] call drn_fnc_DisableFuelStations;
//[] call Zagor_fnc_AddAdminZombieModules;
[] spawn Zagor_fnc_UpdateZombie;
//[] spawn Zagor_fnc_UpdateZombieModule;
//[true] call drn_fnc_InitAquaticPatrolMarkers; 


//Wait for players to actually arrive ingame. This may be a long time if server is set to persistent
waituntil{uisleep 1; count([] call Zagor_FNC_GetPlayers)>0};

// TEST
/*
_startHeli setFuel (random 0.3 + 0.2);
_startHeli setVehicleAmmo 0;
clearWeaponCargoGlobal _startHeli;
clearBackpackCargoGlobal _startHeli;
clearItemCargoGlobal _startHeli;
clearMagazineCargoGlobal _startHeli;
_startHeli addBackpackCargoGlobal["B_AssaultPack_khk", floor(random 1) + 1];
for [{_i = 0}, {_i < (6)}, {_i = _i + 1}] do {
	private _weapon = zagor_arr_PrisonBackpackWeapons select floor(random(count(zagor_arr_PrisonBackpackWeapons)));
	_startHeli addWeaponCargoGlobal[(_weapon select 0),1];
	_startHeli addMagazineCargoGlobal[(_weapon select 1),3];
};

_startHeli setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _startHeli) >> "HitPoints" >> "engine"),1]; // HitEngine
_startHeli setHit ["motor", 1];
_startHeli setHitPointDamage ["hitEngine", 1.0];
*/


// TEST
/*
private _pph = getpos _startHeli;
private _pp = [(_pph select 0) - 4, (_pph select 1) - 4];
private _obj = createVehicle ["Box_East_Wps_F", _pp, [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _obj;
        clearMagazineCargoGlobal _obj;
        clearItemCargoGlobal _obj;
		clearBackpackCargoGlobal _obj;
_obj addItemCargoGlobal ["Laptop_closed", 1];
*/


_playerGroup = [] call Zagor_fnc_GetPlayerGroup;


// TODO without _enemyFrequency: [_enemyMinSkill, _enemyMaxSkill, _enemyFrequency, Zagor_Debug] execVM "Scripts\Escape\EscapeSurprises.sqf";


Zagor_VAR_MedicalSitesCreated = false;
Zagor_VAR_SmallMedicalSitesCreated = false;

private _vehicles = [];
private _initVehicles = [];

// Initialize communication centers
_initVehicles = [] call Zagor_fnc_createComCenters;
_vehicles = _vehicles + _initVehicles;

//Spawn Small Medical Sites
//[] spawn {

	// Initialize Medical Sites
	private _bannedPositions = + Zagor_VAR_Escape_communicationCenterPositions + [Zagor_StartPos, getMarkerPos "drn_insurgentAirfieldMarker"];
	Zagor_VAR_Escape_MedicalSitePositions = _bannedPositions call drn_fnc_Escape_MedicalSitePositions;
	_initVehicles = [] call Zagor_fnc_createMedicalSites;
	_vehicles = _vehicles + _initVehicles;
	Zagor_VAR_MedicalSitesCreated = true;
	publicVariable "Zagor_VAR_MedicalSitesCreated";


	//Spawn crashsites
	private _crashSiteCount = ceil(random(missionNamespace getvariable["CrashSiteCountMax",3]));
	for "_i" from 1 to _crashSiteCount step 1 do {
		private _pos = [] call Zagor_fnc_findFlatArea;
		[_pos] call Zagor_fnc_crashSite;
	};
	
	// Initialize Small Medical Sites
	[] call Zagor_fnc_createSmallMedicalSite;
	Zagor_VAR_SmallMedicalSitesCreated = true;
	publicVariable "Zagor_VAR_SmallMedicalSitesCreated";
//};

[_vehicles] spawn Zagor_fnc_CreateVehicles;

//Start local and remote statistic tracking
[] spawn {
	sleep 1;
	[] call Zagor_fnc_startStatistics;
};

[] spawn Zagor_fnc_UpdateSitesZombie;
[] spawn Zagor_fnc_UpdateCloseZombie;
[] spawn Zagor_fnc_CreateRadioactiveAccident;
[] spawn Zagor_fnc_CreateRadioactiveCity;

private _startHeli2 = [] call Zagor_fnc_CreateSaveHeli2;
private _startHeli3 = [] call Zagor_fnc_CreateSaveHeli3;

[_startHeli, _startHeli2, _startHeli3] spawn Zagor_fnc_CheckEscape;


// TEST
/*
private _posXY = Zagor_StartPos vectoradd [100, 100];
[_posXY,25] call Zagor_fnc_cleanupTerrain;
private _box = createVehicle ["B_T_Truck_01_fuel_F", _posXY, [], 0, "CAN_COLLIDE"];
//[_box,30,0.1,"H_PilotHelmetFighter_B","MineDetector"] call Zagor_fnc_CreateRadioactiveObject;
//[_box] call Zagor_fnc_CreateRadioactiveFog;
[position _box] remoteExec ["Zagor_fnc_CreateRadioactiveFog", 0, true];

private _posXY = Zagor_StartPos vectoradd [100, 0];
[_posXY,25] call Zagor_fnc_cleanupTerrain;
[_posXY] call Zagor_fnc_MedicalSite;
private _posXY = Zagor_StartPos vectoradd [0, 100];
[_posXY,25] call Zagor_fnc_cleanupTerrain;
[_posXY, 0, zagor_arr_ComCenStaticWeapons, zagor_arr_ComCenParkedVehicles] call zagor_fnc_BuildComCenter;
*/


// Start thread that waits for escape to start
[] spawn {
	sleep 5;
	
	while {isNil("Zagor_EscapeHasStarted")} do {
		sleep 1;
		// If any member of the group is to far away from fence, then escape has started
		{
			if(_x getvariable ["Zagor_PlayerInitializedServer",false]) then {
				if ((_x distance Zagor_StartPos) > 15 && (_x distance Zagor_StartPos) < 100) exitWith {
					Zagor_EscapeHasStarted = true;
					publicVariable "Zagor_EscapeHasStarted";
				};
				// If any player have picked up a weapon, escape has started
				if (count weapons _x > 0) exitWith {
					Zagor_EscapeHasStarted = true;
					publicVariable "Zagor_EscapeHasStarted";
				};
			};
		} foreach call Zagor_FNC_GetPlayers;
	};
	
	// ESCAPE HAS STARTED
	//{
	//	[[[_x], {(_this select 0) setCaptive false;}], "BIS_fnc_spawn", _x, false] call BIS_fnc_MP;
	//} foreach call Zagor_FNC_GetPlayers;
   diag_log "Server: Escape has started.";
};


// TODO

/*
_EnemyCount = [3] call A3E_fnc_GetEnemyCount;

[_playerGroup, "drn_CommunicationCenterPatrolMarker", Zagor_VAR_Side_Opfor, "INS", 4, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance] call drn_fnc_InitGuardedLocations;
[_playerGroup, Zagor_VAR_Escape_communicationCenterPositions, _enemySpawnDistance, _enemyFrequency] call drn_fnc_Escape_InitializeComCenArmor;


// Initialize Motor Pools
[] call A3E_fnc_createMotorPools;


// Initialize ammo depots

[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _playerGroup, _enemyFrequency] spawn {
	params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_playerGroup", "_enemyFrequency"];
	private ["_playerGroup", "_minEnemies", "_maxEnemies", "_bannedPositions", "_scriptHandle"];

	private _EnemyCount = [2] call A3E_fnc_GetEnemyCount;
	_EnemyCount params ["_minEnemies", "_maxEnemies"];
	
	_bannedPositions = + Zagor_VAR_Escape_communicationCenterPositions + [Zagor_StartPos, getMarkerPos "drn_insurgentAirfieldMarker"];
	Zagor_VAR_Escape_ammoDepotPositions = _bannedPositions call drn_fnc_Escape_FindAmmoDepotPositions;
	
	[] call A3E_fnc_createAmmoDepots;
	
	[_playerGroup, "drn_AmmoDepotPatrolMarker", Zagor_VAR_Side_Opfor , "INS", 3, _minEnemies, _maxEnemies, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, Zagor_Debug] spawn drn_fnc_InitGuardedLocations;
};


// Initialize search leader
//[] call A3E_fnc_SearchleaderInit;

//Start the player detection script
[] call A3E_fnc_PlayerDetection;

// Start garbage collector
[_playerGroup, 750, Zagor_Debug] spawn drn_fnc_CL_RunGarbageCollector;


// Run initialization for scripts that need the players to be gathered at the start position
[] spawn A3E_fnc_initVillages;

[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _enemyFrequency] spawn {
	params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_enemyFrequency"];

    private ["_fnc_OnSpawnAmbientInfantryGroup", "_fnc_OnSpawnAmbientInfantryUnit", "_scriptHandle"];
    private ["_playerGroup", "_minEnemiesPerGroup", "_maxEnemiesPerGroup", "_fnc_OnSpawnGroup"];
    
    _playerGroup = [] call A3E_fnc_GetPlayerGroup;

        switch (_enemyFrequency) do
        {
            case 1: // 1-2 players
            {
                _minEnemiesPerGroup = 2;
                _maxEnemiesPerGroup = 4;
            };
            case 2: // 3-5 players
            {
                _minEnemiesPerGroup = 3;
                _maxEnemiesPerGroup = 6;
            };
            default // 6-8 players
            {
                _minEnemiesPerGroup = 4;
                _maxEnemiesPerGroup = 8;
            };
        };
        
        _fnc_OnSpawnGroup = {
            {
                _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
            } foreach units _this;
        };
        
        [(units _playerGroup) select 0, Zagor_VAR_Side_Opfor, a3e_arr_Escape_InfantryTypes, _minEnemiesPerGroup, _maxEnemiesPerGroup, 500000, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance + 250, _fnc_OnSpawnGroup, Zagor_Debug] call drn_fnc_InitAquaticPatrols;


    
   

    // Initialize ambient infantry groups

	_fnc_OnSpawnAmbientInfantryUnit = {
		_this call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
	};
	
	_fnc_OnSpawnAmbientInfantryGroup = {
		private ["_unit", "_enemyUnit"];
		private ["_scriptHandle"];
		
		_unit = units _this select 0;
		
		while {!(isNull _unit)} do {
			_enemyUnit = _unit findNearestEnemy (getPos _unit);
			if (!(isNull _enemyUnit)) exitWith {
				
				private _i = 0;
				for [{_i = (count waypoints _this) - 1}, {_i >= 0}, {_i = _i - 1}] do {
					deleteWaypoint [_this, _i];
				};
				
				_scriptHandle = [_this, drn_searchAreaMarkerName, (getPos _enemyUnit), Zagor_Debug] spawn drn_fnc_searchGroup;
				_this setVariable ["drn_scriptHandle", _scriptHandle];
			};
			
			sleep 5;
		};
	};
	
	private ["_infantryGroupsCount", "_radius", "_groupsPerSqkm"];

	switch (_enemyFrequency) do
	{
		case 1: // 1-2 players
		{
			_minEnemiesPerGroup = 2;
			_maxEnemiesPerGroup = 4;
			_groupsPerSqkm = 1;
		};
		case 2: // 3-5 players
		{
			_minEnemiesPerGroup = 2;
			_maxEnemiesPerGroup = 8;
			_groupsPerSqkm = 1.2;
		};
		default // 6-8 players
		{
			_minEnemiesPerGroup = 2;
			_maxEnemiesPerGroup = 12;
			_groupsPerSqkm = 1.4;
		};
	};

	_radius = (_enemySpawnDistance + 500) / 1000;
	_infantryGroupsCount = round (_groupsPerSqkm * _radius * _radius * 3.141592);
	
	[_playerGroup, Zagor_VAR_Side_Opfor, a3e_arr_Escape_InfantryTypes, _infantryGroupsCount, _enemySpawnDistance + 200, _enemySpawnDistance + 500, _minEnemiesPerGroup, _maxEnemiesPerGroup, _enemyMinSkill, _enemyMaxSkill, 750, _fnc_OnSpawnAmbientInfantryUnit, _fnc_OnSpawnAmbientInfantryGroup, Zagor_Debug] spawn drn_fnc_AmbientInfantry;

    
    // Initialize the Escape military and civilian traffic
	private ["_vehiclesPerSqkm", "_radius", "_vehiclesCount", "_fnc_onSpawnCivilian"];
	
	// Civilian traffic
	
	switch (_enemyFrequency) do
	{
		case 1: // 1-3 players
		{
			_vehiclesPerSqkm = 1.6;
		};
		case 2: // 4-6 players
		{
			_vehiclesPerSqkm = 1.4;
		};
		default // 7-8 players
		{
			_vehiclesPerSqkm = 1.2;
		};
	};
	
	_radius = _enemySpawnDistance + 500;
	_vehiclesCount = round (_vehiclesPerSqkm * (_radius / 1000) * (_radius / 1000) * 3.141592);
	
	_fnc_onSpawnCivilian = {
		private ["_vehicle", "_crew"];
		_vehicle = _this select 0;
		_crew = _this select 1;
		//_vehiclesGroup = _result select 2;
		
		{
			{
				_x removeWeapon "ItemMap";
			} foreach _crew; // foreach crew
			
			_x addeventhandler ["killed",{
				if ((_this select 1) in (call Zagor_FNC_GetPlayers)) then {
					if((isNil("Zagor_VAR_Escape_SearchLeader_civilianReporting"))||!Zagor_VAR_Escape_SearchLeader_civilianReporting) then {
						Zagor_VAR_Escape_SearchLeader_civilianReporting = true;
						publicVariable "Zagor_VAR_Escape_SearchLeader_civilianReporting";
						(_this select 1) addScore -5;
					} else {
						(_this select 1) addScore -1;
					};
					(_this select 1) addRating 1000; //Even out the minus score by killing civilians
					[name (_this select 1) + " has killed a civilian."] call drn_fnc_CL_ShowCommandTextAllClients;
				};
				if (isClass(configFile >> "CfgPatches" >> "ACE_Medical")) then {
					_killer = (_this select 0) getVariable ["ace_medical_lastDamageSource", objNull];
					if (_killer in (call Zagor_FNC_GetPlayers)) then {
						if((isNil("Zagor_VAR_Escape_SearchLeader_civilianReporting"))||!Zagor_VAR_Escape_SearchLeader_civilianReporting) then {
								Zagor_VAR_Escape_SearchLeader_civilianReporting = true;
								publicVariable "Zagor_VAR_Escape_SearchLeader_civilianReporting";
								(_killer) addScore -5;
							} else {
								(_killer) addScore -1;
							};
							(_killer) addRating 1000; //Even out the minus score by killing civilians
							[name (_killer) + " has killed a civilian."] call drn_fnc_CL_ShowCommandTextAllClients;
					};
				};
			}];
		} foreach _crew;
		
		clearitemcargoglobal _vehicle;
        clearWeaponCargoGlobal _vehicle;
        clearMagazineCargoGlobal _vehicle;			
		
		if (random 100 < 20) then {
			private ["_weaponItem"];
			
			_weaponItem = selectRandom a3e_arr_CivilianCarWeapons;
			
			_vehicle addWeaponCargoGlobal [_weaponItem select 0, 1];
			_vehicle addMagazineCargoGlobal [_weaponItem select 1, _weaponItem select 2];
		};	
		if (random 100 < 80) then {
           _vehicle addItemCargoglobal ["firstaidkit", 3];	
		};
		if (random 100 < 80) then {
           _vehicle addMagazineCargoglobal ["smokeshellRed", 2];	
		};
		if (random 100 < 80) then {
           _vehicle addMagazineCargoglobal ["Chemlight_green", 5];	
		};
	};
	
	[civilian, [], _vehiclesCount, _enemySpawnDistance, _radius, 0.5, 0.5, _fnc_onSpawnCivilian, Zagor_Debug] spawn drn_fnc_MilitaryTraffic;

	
	// Enemy military traffic
	
	switch (_enemyFrequency) do
	{
		case 1: // 1-3 players
		{
			_vehiclesPerSqkm = 0.6;
		};
		case 2: // 4-6 players
		{
			_vehiclesPerSqkm = 0.8;
		};
		default // 7-8 players
		{
			_vehiclesPerSqkm = 1;
		};
	};
	
	_radius = _enemySpawnDistance + 500;
	_vehiclesCount = round (_vehiclesPerSqkm * (_radius / 1000) * (_radius / 1000) * 3.141592);
	[_vehiclesCount,_enemySpawnDistance,_radius,_enemyMinSkill, _enemyMaxSkill] spawn {
		params["_vehiclesCount","_enemySpawnDistance","_radius","_enemyMinSkill", "_enemyMaxSkill"];
		sleep 60*15; //Wait 15 Minutes before heavy vehicles may arrive 
		[Zagor_VAR_Side_Opfor, [], _vehiclesCount/2, _enemySpawnDistance, _radius, _enemyMinSkill, _enemyMaxSkill, drn_fnc_Escape_TrafficSearch, Zagor_Debug] spawn drn_fnc_MilitaryTraffic;
		[Zagor_VAR_Side_Ind, [], _vehiclesCount/2, _enemySpawnDistance, _radius, _enemyMinSkill, _enemyMaxSkill, drn_fnc_Escape_TrafficSearch, Zagor_Debug] spawn drn_fnc_MilitaryTraffic;
    };

	private ["_areaPerRoadBlock", "_maxEnemySpawnDistanceKm", "_roadBlockCount"];
	private ["_fnc_OnSpawnInfantryGroup", "_fnc_OnSpawnMannedVehicle"];
	
	_fnc_OnSpawnInfantryGroup = {{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach units _this;};
	_fnc_OnSpawnMannedVehicle = {{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_this select 1);};
	
	switch (_enemyFrequency) do {
		case 1: {
			_areaPerRoadBlock = 4.19;
		};
		case 2: {
			_areaPerRoadBlock = 3.14;
		};
		default {
			_areaPerRoadBlock = 2.5;
		};
	};
	
	_maxEnemySpawnDistanceKm = (_enemySpawnDistance + 500) / 1000;
	_roadBlockCount = round ((_maxEnemySpawnDistanceKm * _maxEnemySpawnDistanceKm * 3.141592) / _areaPerRoadBlock);
	
	if (_roadBlockCount < 1) then {
		_roadBlockCount = 1;
	};
	//Zagor_VAR_Side_Ind
	[a3e_arr_Escape_InfantryTypes, a3e_arr_Escape_RoadBlock_MannedVehicleTypes, _fnc_OnSpawnInfantryGroup, _fnc_OnSpawnMannedVehicle, Zagor_Debug] spawn A3E_fnc_RoadBlocks;

	//Spawn crashsites

	private _crashSiteCount = ceil(random(missionNamespace getvariable["CrashSiteCountMax",3]));
	for "_i" from 1 to _crashSiteCount step 1 do {
		private _pos = [] call A3E_fnc_findFlatArea;
		[_pos] call A3E_fnc_crashSite;
	};


	//Spawn mortar sites
	[] call A3E_fnc_createMortarSites;
};

//Start local and remote statistic tracking
[] spawn {
	sleep 1;
	[] call A3E_fnc_startStatistics;
};


// Create search chopper

//private ["_scriptHandle"];
//_scriptHandle = [getMarkerPos "drn_searchChopperStartPosMarker", Zagor_VAR_Side_Opfor, drn_searchAreaMarkerName, _searchChopperSearchTimeMin, _searchChopperRefuelTimeMin, _enemyMinSkill, _enemyMaxSkill, [], Zagor_Debug] execVM "Scripts\Escape\CreateSearchChopper.sqf";
//waitUntil {scriptDone _scriptHandle};


// Spawn creation of start position settings
[Zagor_StartPos, _backPack, _enemyFrequency] spawn {
	params ["_startPos", "_backPack", "_enemyFrequency"];
    private ["_guardGroup", "_marker", "_guardCount", "_guardGroups", "_unit", "_createNewGroup"];
    
	 
    // Spawn guard
	_guardCount = [-1,-1,3,8] call a3e_fnc_getDynamicSquadSize;
	private _i = 0;	
	for [{_i = 0}, {_i < (_guardCount)}, {_i = _i + 1}] do {
		private _weapon = a3e_arr_PrisonBackpackWeapons select floor(random(count(zagor_arr_PrisonBackpackWeapons)));
		_backpack addWeaponCargoGlobal[(_weapon select 0),1];
		_backpack addMagazineCargoGlobal[(_weapon select 1),3];
	};
	
    // Spawn more guards
    _marker = createMarkerLocal ["drn_guardAreaMarker", _startPos];
    _marker setMarkerAlphaLocal 0;
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerSizeLocal [50, 50];
    
    //_guardCount = (2 + (_enemyFrequency)) + floor (random 2);

    _guardGroups = [];
    _createNewGroup = true;
    
    for [{_i = 0}, {_i < _guardCount}, {_i = _i + 1}] do {
        private ["_pos"];
        
        _pos = [_marker] call drn_fnc_CL_GetRandomMarkerPos;
        while {_pos distance _startPos < 10} do {
            _pos = [_marker] call drn_fnc_CL_GetRandomMarkerPos;
        };
        
        if (_createNewGroup) then {
            _guardGroup = createGroup Zagor_VAR_Side_Ind;
            _guardGroups set [count _guardGroups, _guardGroup];
            _createNewGroup = false;
        };
        
        //(a3e_arr_Escape_StartPositionGuardTypes select floor (random count a3e_arr_Escape_StartPositionGuardTypes)) createUnit [_pos, _guardGroup, "", (0.5), "CAPTAIN"];
        _guardGroup createUnit [(a3e_arr_Escape_StartPositionGuardTypes select floor (random count a3e_arr_Escape_StartPositionGuardTypes)), _pos, [], 0, "FORM"];
        
        if (count units _guardGroup >= 2) then {
            _createNewGroup = true;
        };
    };
    
    {
        _guardGroup = _x;
        
        _guardGroup setFormDir floor (random 360);
        
        {
            _unit = _x; //(units _guardGroup) select 0;
            _unit setUnitRank "CAPTAIN";
			_unit unlinkItem "ItemMap";
            _unit unlinkItem "ItemCompass";
            _unit unlinkItem "ItemGPS";
			if (ACE_MedicalServer) then {_unit addItem "ACE_epinephrine"};//Add Epinephrine for each unit
			removeBackpackGlobal _unit;
			
			if(random 100 < 80) then {
				removeAllPrimaryWeaponItems _unit;
				
			};

			private _hmd = hmd _unit;
			if (_hmd isEqualTo "") then {
				private _cfgWeapons = configFile >> "CfgWeapons";
				{
					if (616 == getNumber (_cfgWeapons >> _x >> "ItemInfo" >> "type")) exitWith {
						_hmd = _x;
					};
				} forEach items _unit;
			};
			if (!(_hmd isEqualTo "") && {random 100 > 20 || {Zagor_Param_NoNightvision == 1}}) then {
				_unit unlinkItem _hmd;
				_unit removeItem _hmd;
			};
	
            //_unit setSkill Zagor_VAR_Escape_enemyMinSkill;
			//[_unit, Zagor_VAR_Escape_enemyMinSkill] call EGG_EVO_skill;
			
			//This should remove all types of handgrenades (for example RHS)
            _unit removeMagazines "Handgrenade";
            
            _unit setVehicleAmmo 0.3 + random 0.7;

        } foreach units _guardGroup;
        
        [_guardGroup, _marker] spawn A3E_fnc_Patrol;
        
    } foreach _guardGroups;
        
	//Add an alert trigger to the prison
	A3E_fnc_revealPlayers = {
		private _guardGroup = _this;
		{
			_guardGroup reveal [_x,1.5];
		} foreach call Zagor_FNC_GetPlayers;
	};
	A3E_fnc_soundAlarm = {
		params ["_guardGroups"];
		if(isNil("A3E_SoundPrisonAlarm")) then {
			A3E_SoundPrisonAlarm = true;
			publicvariable "A3E_SoundPrisonAlarm";
			{
				_x spawn A3E_fnc_revealPlayers;
			} foreach _guardGroups;
			sleep 30;
			A3E_SoundPrisonAlarm = false;
			publicvariable "A3E_SoundPrisonAlarm";
		};
	};
    // Start thread that waits for escape to start
    [_guardGroups] spawn {
        params ["_guardGroups"];
        
        sleep 5;
        
        while {isNil("Zagor_EscapeHasStarted")} do {
			sleep 1;
            // If any member of the group is to far away from fence, then escape has started
            {
				if(_x getvariable ["Zagor_PlayerInitializedServer",false]) then {
					if ((_x distance Zagor_StartPos) > 15 && (_x distance Zagor_StartPos) < 100) exitWith {
						Zagor_EscapeHasStarted = true;
						publicVariable "Zagor_EscapeHasStarted";
					};
					// If any player have picked up a weapon, escape has started
					if (count weapons _x > 0) exitWith {
						Zagor_EscapeHasStarted = true;
						publicVariable "Zagor_EscapeHasStarted";
					};
				};
            } foreach call Zagor_FNC_GetPlayers;
        };
        
        // ESCAPE HAS STARTED
        //{
		//	[[[_x], {(_this select 0) setCaptive false;}], "BIS_fnc_spawn", _x, false] call BIS_fnc_MP;
		//} foreach call Zagor_FNC_GetPlayers;
	   diag_log "Server: Escape has started.";
    };
	//Spawn alarm watchdog
	[_guardGroups] spawn {
		params ["_guardGroups"];
		while{isNil("A3E_SoundPrisonAlarm")} do {
			if(!isNil("Zagor_EscapeHasStarted")) then {
				{
					private ["_guardGroup"];					
					_guardGroup = _x;
					{
						if((_guardGroup knowsAbout _x)>2.5) exitwith {
							[_guardGroups] call A3E_fnc_soundAlarm;
						};
					} foreach call Zagor_FNC_GetPlayers;
				} foreach _guardGroups;
			};
			if(!isNil("A3E_PrisonGateObject")) then {
				if((A3E_PrisonGateObject animationPhase "Door_1_rot") > 0.5 ||
				(A3E_PrisonGateObject animationPhase "Door_2_rot") > 0.5) then {
					if(isNil("Zagor_EscapeHasStarted")) then {
						Zagor_EscapeHasStarted = true;
						publicVariable "Zagor_EscapeHasStarted";
					};
					[_guardGroups] call A3E_fnc_soundAlarm;
				};
			};
			sleep 0.5;
		};
	};
	
};
*/