call compile preprocessFileLineNumbers ("Island\VillageMarkers.sqf");

if (isServer) then {

	if(isNil "zagor_villageMarkers") exitwith {
		["Village markers not found!"] call BIS_fnc_error;
	};

	private ["_showMarkers"];
	private ["_markerName", "_villageIndex", "_size1", "_size2", "_maxSize", "_square"];
//	private ["_villageZombieModuleGroup", "_center"];

//	_center = createCenter sideLogic;    
//	_villageZombieModuleGroup = createGroup _center;

	_showMarkers = Zagor_Debug;
	_villageIndex = 0;

	{
		private ["_marker", "_pos", "_shape", "_dir", "_size"];

		_markerName = "drn_villageMarker" + str _villageIndex;

		_pos = _x select 0;
		_dir = _x select 1;
        _shape = _x select 2;
		_size = _x select 3;

		_marker = createMarkerLocal [_markerName, _pos];
		
		if (!_showMarkers) then {
			_marker setMarkerAlphaLocal 0;
		};

		_marker setMarkerShapeLocal _shape;
		_marker setMarkerDirLocal _dir;
		_marker setMarkerSizeLocal _size;
		
		//[[_pos select 0, _pos select 1], _villageZombieModuleGroup] call Zagor_fnc_AddVillageZombieModule;

		_size1 = (_size select 0);
		_size2 = (_size select 1);
		
		if (_size1 > _size2) then
		{
			_maxSize = _size1;
		} else {
			_maxSize = _size2;	
		};
		
		_square = _size1 * _size2;
		
		Zagor_VAR_Villages set [_villageIndex, [[_pos select 0, _pos select 1], ((_size1 + _size2) / 2), _maxSize, _square]];

		_villageIndex = _villageIndex + 1;
	} foreach zagor_villageMarkers;
	
	zagor_var_villageMarkersInitialized = true;
	
	diag_log format["VillageMarkers initialized!"];
};
