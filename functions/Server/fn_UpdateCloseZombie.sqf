if (!isServer) exitWith {};

waitUntil {time > 0 && Zagor_VAR_SmallMedicalSitesCreated && Zagor_VAR_MedicalSitesCreated};
sleep 30;

private _distShow = 500;
private _distHide = 600;
private _maxSpawnPlaceSize = 180;
private _maxCountZombieInit = 3;
private _additionalZombies = 2; // + zombies per player
private _zombieTypes = ["Opfor","mediumOpfor","slowOpfor","walkerOpfor"];

private _zombies = []; // id, [zombieRef, alive]

private _zombiesCoefficient = switch Zagor_Param_ZombiesQuantity do
{
	case 1: { 0.5 };
	case 2: { 1 };
	case 3: { 1.5 };
	case 4: { 2 };
	default { 1 };
};

// Init groups
private _group = createGroup [Zagor_VAR_Side_Opfor, false];


while {true} do {

	private _players = [] call Zagor_fnc_GetPlayers;
	private _playerCount = count _players;
	if (_playerCount > 0) then {

		private _defaultIncreaseZombie = 3 * _playerCount;		
		
		private["_count"];
		
		private _blacklistPositions = [];
		{ _blacklistPositions pushback [getPos _x, 50];	} forEach _players;	
		
		// Delete far away zombie
		_count = (count _zombies) - 1;
		if (_count > 0) then {	
			for "_i" from 0 to _count step 1 do {
				private _allowDelete = true;
				private _zombie = (_zombies select _i);				
				if (_zombie select 1) then {
					private _zombieObj = _zombie select 0;
					{
						private _meters = _x distance2D _zombieObj;
						if (_meters < _distHide) then {
							_allowDelete = false;
						};	
					} forEach _players;
				};
				if (_allowDelete) then {
					private _zombieObj = _zombie select 0;
					deleteVehicle _zombieObj;
					_zombies set [_i, objNull];
				}
			};
		};
		
		_zombies = _zombies - [objNull];		
		
		// Check dead zombie
		_count = (count _zombies) - 1;
		if (_count > 0) then {
			for "_i" from 0 to _count step 1 do {
				private _zombie = (_zombies select _i);	
				if (!(alive (_zombie select 0))) then {
				_zombie set [1, false];
				};
			};
		};
		
		// Create new zombie
		{
			private _maxCountZombie = floor(_maxCountZombieInit * _zombiesCoefficient +  _additionalZombies * _playerCount);

			private _countZombie = count _zombies;
			//diag_log format["ZombieInSite: '%1'", _countZombie];
			
			if (_countZombie < _maxCountZombie) then {
				private _newZombie = "RyanZombie" + str (floor(random 17) + 15) + selectRandom _zombieTypes;

				private _position = [getPos _x , 50, _maxSpawnPlaceSize, 2, 0, 0.3, 0, _blacklistPositions] call BIS_fnc_findSafePos;
						
				private _unit = _group createUnit [_newZombie, _position, [], 0, "FORM"]; //FORM NONE
				[_unit] join _group;
				_unit switchmove 'AmovPercMstpSnonWnonDnon_SaluteOut';
				_zombies = _zombies + [[_unit,true]];
			};
			
		} forEach _players;	
		

	};
	diag_log format["Close Zombies: '%1'", count _zombies];

	sleep 20;
};