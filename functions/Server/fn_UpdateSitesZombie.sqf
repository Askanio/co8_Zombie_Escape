if (!isServer) exitWith {};

waitUntil {time > 0 && Zagor_VAR_SmallMedicalSitesCreated && Zagor_VAR_MedicalSitesCreated};
sleep 5;

private _distShow = 500;
private _distHide = 600;

private _zombies = []; // id, [zombieRef, alive, siteId]
private _countSites = (count Zagor_VAR_SitesPoint) - 1;
diag_log format["Sites: '%1'", _countSites];

private _zombiesCoefficient = switch Zagor_Param_ZombiesQuantity do
{
	case 1: { 0.5 };
	case 2: { 1 };
	case 3: { 1.5 };
	case 4: { 2 };
	default { 1 };
};

// Init groups
{
	private _group = createGroup [Zagor_VAR_Side_Opfor, false];
	_x set [2, _group];
} forEach Zagor_VAR_SitesPoint;


while {true} do {

	private _players = [] call Zagor_fnc_GetPlayers;
	private _playerCount = count _players;
	if (_playerCount > 0) then {

		private _defaultIncreaseZombie = 3 * _playerCount;		
		
		private["_group", "_count"];
		
		private _blacklistPositions = [];
		{ _blacklistPositions pushback [getPos _x, 30];	} forEach _players;	
		
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
			for "_i" from 0 to _countSites step 1 do {
				private _site = (Zagor_VAR_SitesPoint select _i);
				private _siteType = _site select 0;
				private _pos = _site select 1;
				private _group = _site select 2;
				private _meters = _x distance2D _pos;
				//diag_log format["Sites Pos: '%1'", _pos];
				//diag_log format["Sites Meters: '%1'", _meters];
				if (_meters < _distShow) then {
					private _additionalZombies = 0;
					private _maxCountZombie = 0;
					private _maxSize = 0;
					private _zombieTypes = [];
					switch _siteType do
					{
						case 1: { _maxCountZombie = 10; _additionalZombies = 2; _maxSize = 100; _zombieTypes = ["Opfor","mediumOpfor","slowOpfor","walkerOpfor"] };
						case 2: { _maxCountZombie = 20; _additionalZombies = 3; _maxSize = 100; _zombieTypes = ["Opfor","mediumOpfor","mediumOpfor","slowOpfor","walkerOpfor"] };
						case 2: { _maxCountZombie = 30; _additionalZombies = 4; _maxSize = 150; _zombieTypes = ["Opfor","Opfor","mediumOpfor","walkerOpfor"] };
						default { _maxCountZombie = 50; _additionalZombies = 5; _maxSize = 150; _zombieTypes = ["Opfor","Opfor","mediumOpfor"] };
					};
				
					_maxCountZombie = floor(_maxCountZombie * _zombiesCoefficient +  _additionalZombies * _playerCount);
					//diag_log format["MaxCountZombie: %1, ZombiesCoefficient: %2, AdditionalZombies: %3, PlayerCount: %4", _maxCountZombie, _zombiesCoefficient, _additionalZombies, _playerCount];					
				
					private _zombieInSite = _zombies select { (_x select 2) == _i };
					private _countZombie = count _zombieInSite;
					//diag_log format["ZombieInSite: '%1'", _countZombie];
					
					if (_countZombie < _maxCountZombie) then { // TODO: dynamic count!
						private _needGenerateZombie = 0;
						if (_countZombie == 0) then {
							_needGenerateZombie = floor(_maxCountZombie / 2); // for init cteate 50% zombies
						} else {
							_needGenerateZombie = _maxCountZombie - _countZombie;
						};
						if (_needGenerateZombie > _defaultIncreaseZombie) then {
							_needGenerateZombie = _defaultIncreaseZombie;
						};
						for "_ii" from 0 to _needGenerateZombie - 1 step 1 do {
							private["_newZombie"];
							private _blah = floor(random 2);//returns 0 or 1
							if (_blah == 0) then {
								_newZombie = "RyanZombie" + str (floor(random 17) + 15) + selectRandom _zombieTypes;
							};
							if (_blah == 1) then {
								_newZombie = selectRandom zagor_arr_Escape_Zombie_Soldier;
							};

							private _position = [_pos , 0, _maxSize, 2, 0, 0.3, 0, _blacklistPositions] call BIS_fnc_findSafePos;
									
							private _unit = _group createUnit [_newZombie, _position, [], 0, "FORM"]; //FORM NONE
							[_unit] join _group;
							_unit switchmove 'AmovPercMstpSnonWnonDnon_SaluteOut';
							_zombies = _zombies + [[_unit,true,_i]];
						};
					};
				};
			};
			

		} forEach _players;	
		

	};
	diag_log format["Sites Zombies: '%1'", count _zombies];

	sleep 19;
};