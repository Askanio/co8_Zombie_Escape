if (!isServer) exitWith {};

params["_initVehicles"];

waitUntil {time > 0};
sleep 1;

private["_vehicleTypes", "_players", "_meters", "_vehicle", "_pos", "_maxSize", "_square"];
private["_countVillages","_divider"];
private _distShow = 1500;
private _distHide = 1700;
private _currentVillageId = 0;
private _activeVillages = [];

_vehicleTypes = zagor_arr_Escape_EnemyCivilianCarTypes;
//_backpack = ["B_AssaultPack_Base","B_Bergen_Base","B_FieldPack_Base","B_Carryall_Base"];
//_pistols = ["hgun_Pistol_heavy_01_F","hgun_P07_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F"];
//_magazin = ["11Rnd_45ACP_Mag","16Rnd_9x21_Mag","30Rnd_9x21_Mag","6Rnd_45ACP_Cylinder"];

//waitUntil { !isNil "BIS_fnc_init" };
private _vehicles = [];
_vehicles = _vehicles + _initVehicles;	

//waitUntil { ((count Zagor_VAR_Villages) - 1) <= 0 };
_countVillages = (count Zagor_VAR_Villages) - 1;
//if (_countVillages < 0) exitwith {};

for "_i" from 0 to _countVillages step 1 do
{
	_activeVillages set [_i, false];
};

//private _temp = 0;

while {true} do {

	_players = [] call Zagor_fnc_GetPlayers;
	
	if ((count _players) > 0) then {

		if ((count _vehicles) > 0) then {
			{
				_player = selectRandom _players;
				private _vehiclePos = getPos _x;
				//{
					private _playerPos = getPos _player;
					_meters = _playerPos distance2D _vehiclePos;
					if (_meters < _distShow) then {
						_x hideObject false;
						//_x enableSimulation true;
						//_x allowDamage true;
					} else {
						if (_meters > _distHide) then {
							_x hideObject true;
							//_x enableSimulation false;
							//_x allowDamage false;
						};
					};
							
				//} forEach _players;
			} forEach _vehicles;
		};
	
	
/*			
				// Test (remove befor release)
				
						if (_temp == 0) then {
							private _vehicleClass1 = selectRandom _vehicleTypes;
							private _pp = getPos _x;
							private _position1 = _pp findEmptyPosition [5, 25, _vehicleClass1];
							if (count _position1 > 0) then {
								private _rotation = random 360;
								//private _pos1 = [_spawnPos1,_spawnPos1 vectorAdd [0,0,0.5],_rotation] call A3E_fnc_rotatePosition;
								_vehicle = createVehicle [_vehicleClass1, _position1, [], 0, "NONE"];				
								//_obj setVectorDirAndUp [[1,-0.000440045,0],[0,0,1]];
								_vehicle setdir ((getdir _vehicle) + _rotation);
								//_obj setPos _position1;
								if ((random 10) < 3) then {
									_vehicle setFuel random 0.1;
								} else {
									_vehicle setFuel random 0;
								};
								_vehicle setDamage [random 0.3 + 0.2, false];
								_vehicle setVehicleAmmo 0;
								clearBackpackCargoGlobal _vehicle;
								clearItemCargoGlobal _vehicle;
								clearWeaponCargoGlobal _vehicle;
								clearMagazineCargoGlobal _vehicle;
								if ((random 100) < 5) then {
									_vehicle addItemCargoGlobal ["ItemMap", 1];							
								};
								if ((random 100) < 5) then {
									_vehicle addItemCargoGlobal ["ItemCompass", 1];							
								};
								if ((random 100) < 5) then {
									_vehicle addItemCargoGlobal ["ItemWatch", 1];							
								};
								if ((random 100) < 5) then {
									_vehicle addItemCargoGlobal ["ItemRadio", 1];							
								};							
								if ((random 100) < 5) then {
									_vehicle addItemCargoGlobal ["acc_flashlight", 1];							
								};	
								if ((random 10) < 3) then {
									_vehicle addItemCargoGlobal ["FirstAidKit", 1];							
								};							
								//diag_log format["Spawn vehicle TEST '%1', %2, %3", _vehicleClass1, _position1, _pp];
								_vehicles = _vehicles + [_vehicle];		
								if(Zagor_Param_UseIntel==1) then {
									[_vehicle] call Zagor_fnc_AddIntelToVehicle;
								};
							};
							_temp = 1;
						};
*/	
	
	
		
		for "_i" from 0 to 49 step 1 do 
		{
			_currentVillageId = _currentVillageId + 1;
			if (_currentVillageId > _countVillages) then { _currentVillageId = 0; };
			
			_village = (Zagor_VAR_Villages select _currentVillageId);
	
			if (!(_activeVillages select _currentVillageId)) then {
					
				_pos = _village select 0;
				_maxSize = _village select 2;
				_square = _village select 3;
		
				switch true do
				{
					case (_square < 2000): {_divider = 600;}; // Every 600 m^2 = 1 position
					case (_square < 5100): {_divider = 1200;}; // Every 1200 m^2 = 1 position
					case (_square < 8000): {_divider = 1700;}; // Every 1700 m^2 = 1 position
					case (_square < 20000):	{_divider = 2500;}; // Every 2500 m^2 = 1 position
					case (_square < 50000):	{_divider = 3500;}; // Every 3500 m^2 = 1 position
					case (_square < 100000): {_divider = 5000;}; // Every 5000 m^2 = 1 position
					default {_divider = 6000;}; // Every 6000 m^2 = 1 position
				};
				
				private _countPosition = round (_square/_divider);
								
				_player = selectRandom _players;
				_meters = _player distance2D _pos;
				if ((_meters + _maxSize) < _distShow) then
				{
					private _roadSegments = [_pos select 0, _pos select 1] nearRoads (_maxSize);
					if (count _roadSegments > 0) then {
						for "_ii" from 0 to (_countPosition - 1) step 1 do 
						{
							private _vehicleClass = selectRandom _vehicleTypes;
							private _roadSegment = selectRandom _roadSegments;
							
							private _distance = random 20;
							private _angle = random 360;
							private _offX = (sin _angle) * _distance;
							private _offY = (cos _angle) * _distance;
							private _roadSegmentPos = getPos _roadSegment;
							private _newPos = [(_roadSegmentPos select 0) + _offX, (_roadSegmentPos select 1) + _offY];
							
							private _position = _newPos findEmptyPosition [5, 30, _vehicleClass];
							if (count _position > 0) then {
								private _rotation = random 360;
								//private _pos = [_spawnPos1,_spawnPos1 vectorAdd [0,0,0.5],_rotation] call Zagor_fnc_rotatePosition;
								_vehicle = createVehicle [_vehicleClass, _position, [], 0, "NONE"];				
								//_vehicle setVectorDirAndUp [[1,-0.000440045,0],[0,0,1]];
								//_vehicle setPos _position;
								_vehicle setdir ((getdir _vehicle) + _rotation);
								_vehicle setFuel random 0.1;
								_vehicle setDamage [random 0.3 + 0.4, true];
								_vehicle setVehicleAmmo 0;
								clearBackpackCargoGlobal _vehicle;
								clearItemCargoGlobal _vehicle;
								if (random 100 < 5) then {_vehicle addItemCargoGlobal ["ItemMap", 1];};
								if (random 100 < 5) then {_vehicle addItemCargoGlobal ["ItemCompass", 1];};
								if (random 100 < 5) then {_vehicle addItemCargoGlobal ["ItemWatch", 1];};
								if (random 100 < 5) then {_vehicle addItemCargoGlobal ["ItemRadio", 1];};							
								if (random 100 < 5) then {_vehicle addItemCargoGlobal ["acc_flashlight", 1];};	
								if (random 10 < 3) then {_vehicle addItemCargoGlobal ["FirstAidKit", 1];};
								if (random 100 < 5) then {_vehicle addBackpackCargoGlobal [selectRandom zagor_arr_Escape_Backpack, 1];};								
								if(Zagor_Param_UseIntel == 1) then {
									[_vehicle] call Zagor_fnc_AddIntelToVehicle;
								};
								if (random 100 < 5) then {_vehicle addItemCargoGlobal ["Item_acc_flashlight_pistol", 1];};
								
								private _weapon = zagor_arr_PrisonBackpackWeapons select floor(random(count(zagor_arr_PrisonBackpackWeapons)));
								if (random 100 < 5) then {_vehicle addWeaponCargoGlobal [(_weapon select 0), 1];};
								if (random 10 < 3) then {_vehicle addMagazineCargoGlobal [(_weapon select 1), floor(random 2) + 1];};
								//_vehicle setHit ["motor", 1];
								_vehicle setHit ["motor", random 1];
								
								if (random 1 > 0.4) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitLFWheel" >> "name"),(random 0.2) + 0.8]};
								if (random 1 > 0.4) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitLBWheel" >> "name"),1]};
								if (random 1 > 0.4) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitRFWheel" >> "name"),(random 0.2) + 0.8]};
								if (random 1 > 0.2) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitRBWheel" >> "name"),1]};
								if (random 1 > 0.3) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass1" >> "name"),(random 0.6) + 0.3]};
								if (random 1 > 0.5) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass2" >> "name"),(random 0.6) + 0.3]};
								if (random 1 > 0.3) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass3" >> "name"),(random 0.6) + 0.3]};
								if (random 1 > 0.5) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass4" >> "name"),(random 0.6) + 0.3]};
								//_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "engine"),random 1]; // HitEngine
								_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitHull" >> "name"),(random 0.2) + 0.6];
								_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitBody" >> "name"),(random 0.2) + 0.6];
								_vehicles = _vehicles + [_vehicle];	

								//diag_log format["Spawn vehicle"];
							};
						};
					};
					_activeVillages set [_currentVillageId, true];
				};	

			};
						
		};

	};
	sleep 3;
};