if (!isServer) exitWith {};

waitUntil {time > 0};
sleep 10;

private _distShow = 100;
private _distHide = 600; // _distShow (100) + maxVillagePoint (400) + 100


private _groups = []; // id, [bool exist, groupObj group]
private _zombies = []; // id, [zombieRef, alive, villageId]
private _countVillages = (count Zagor_VAR_Villages) - 1;

private _zombiesCoefficient = switch Zagor_Param_ZombiesQuantity do
{
	case 1: { 0.5 };
	case 2: { 1 };
	case 3: { 1.5 };
	case 4: { 2 };
	default { 1 };
};


// Init groups
for "_i" from 0 to _countVillages step 1 do
{
	_groups set [_i, [false,objNull]];
};

while {true} do {

	private _players = [] call Zagor_fnc_GetPlayers;
	private _playerCount = count _players;
	if (_playerCount > 0) then {
	
		private _defaultIncreaseZombie = 2 * _playerCount;		
		
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
		
		// CheckEmptyGroups	
		for "_i" from 0 to ((count _groups) - 1) step 1 do {
			private _groupStruct = (_groups select _i);	
			if ((_groupStruct select 0)) then {
				_group = _groupStruct select 1; // grpNull
				private _zombieInGroup = units _group;
				if (count _zombieInGroup == 0) then {
					deleteGroup _group;
					_groups set [_i, [false,objNull]];
				};
			};
		};
		
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
			for "_i" from 0 to _countVillages step 1 do {
				private _village = (Zagor_VAR_Villages select _i);
				private _pos = _village select 0;
				private _maxSize = (_village select 2) / 2;
				private _square = _village select 3;
				private _meters = _x distance2D _pos;
				if (_meters < (_maxSize + _distShow)) then {
					private _additionalZombies = 0;
					private _maxCountZombie = 0;
					switch true do
					{
						case (_square < 2000): { _maxCountZombie = 5; _additionalZombies = 1; }; // 5
						case (_square < 5100): { _maxCountZombie = 10; _additionalZombies = 2; }; // 10
						case (_square < 8000): { _maxCountZombie = 15; _additionalZombies = 2; }; // 15
						case (_square < 20000):	{ _maxCountZombie = 20; _additionalZombies = 3; }; // 20
						case (_square < 50000):	{ _maxCountZombie = 30; _additionalZombies = 4; }; // 30
						case (_square < 100000): { _maxCountZombie = 40; _additionalZombies = 5; }; // 50
						default { _maxCountZombie = 50; _additionalZombies = 5; }; // 60
					};
				
					_maxCountZombie = floor(_maxCountZombie * _zombiesCoefficient +  _additionalZombies * _playerCount);
					//diag_log format["MaxCountZombie: %1, ZombiesCoefficient: %2, AdditionalZombies: %3, PlayerCount: %4", _maxCountZombie, _zombiesCoefficient, _additionalZombies, _playerCount];					
				
					private _zombieInVillage = _zombies select { (_x select 2) == _i };
					private _countZombie = count _zombieInVillage;
					//diag_log format["ZombieInVillage: '%1'", _countZombie];
					
					if (_countZombie < _maxCountZombie) then { // TODO: dynamic count!
						private _groupStruct = (_groups select _i);	
						if ((_groupStruct select 0) == false) then {
							_group = createGroup [Zagor_VAR_Side_Opfor, false];
							_groups set [_i, [true,_group]];
						} else {
							_group = (_groupStruct select 1);
						};				
					
						private _needGenerateZombie = _maxCountZombie - _countZombie;
						if (_needGenerateZombie > _defaultIncreaseZombie) then {
							_needGenerateZombie = _defaultIncreaseZombie;
						};
						for "_ii" from 0 to _needGenerateZombie - 1 step 1 do {
							private _newZombie = "RyanZombie" + str (floor(random 17) + 15) + selectRandom ["Opfor","mediumOpfor","slowOpfor","slowOpfor","slowOpfor","slowOpfor","walkerOpfor","walkerOpfor","walkerOpfor"];
							//private _position = selectRandom _randPos; //_pos findEmptyPosition [10, _maxSize + 50, _newZombie];
							//if (count _randPos > 0) then {
								private _position = [_pos , 0, _maxSize + 60, 2, 0, 0.3, 0, _blacklistPositions] call BIS_fnc_findSafePos; //selectRandom _randPos;
								//if (_position > 0) then {
									//private _rotation = random 360;
									//_newZombie = "O_Soldier_A_F";
									
									private _unit = _group createUnit [_newZombie, _position, [], 0, "FORM"]; //FORM NONE
									[_unit] join _group;
									_unit switchmove 'AmovPercMstpSnonWnonDnon_SaluteOut';

									//_newZombie createunit [_position _logic, _group, "this switchmove 'AmovPercMstpSnonWnonDnon_SaluteOut'; _unit = this;"];

									_zombies = _zombies + [[_unit,true,_i]];
									//_unit setPos _position;
									//_unit setVariable ["TotalAmount", 50.0];
								//};
							//};
						};
					};
				};
			};
			

		} forEach _players;
	};

	diag_log format["Zombies: '%1', Groups: %2", count _zombies, count (_groups select { (_x select 0) == true })];

	sleep 20;
};
