
if(!isserver) exitwith {};

private ["_pos", "_startHeli"];

private _positions = [];
private _i = 0;

while {count _positions < 1} do {

    _pos = call Zagor_fnc_findFlatArea;

    private _tooCloseAnotherPos = false;

	//Check if too close to another depot, comcenter or start
	{
        if (_pos distance _x < Zagor_ClearedPositionDistance) then {
            _tooCloseAnotherPos = true;
        };
    } foreach Zagor_Var_ClearedPositions;


    if (!_tooCloseAnotherPos) then {
        _positions pushBack  _pos;
		Zagor_Var_ClearedPositions pushBack _pos;
    };

    _i = _i + 1;
    if (_i > 100) exitWith {
        _positions
    };
};


if (count _positions > 0) then {

	_pos = _positions select 0;
	//_pos = [(Zagor_StartPos select 0) + 50, (Zagor_StartPos select 1) + 50]; // for test
	//diag_log format["Save heli point 3: '%1'", _pos];

	_startHeli = createVehicle ["I_Heli_Transport_02_F", _pos, [], 0, "CAN_COLLIDE"];
	_startHeli setdir (random 360);
	_startHeli setFuel (random 0.3 + 0.2);
	_startHeli setVehicleAmmo 0;
	//[_startHeli, "hitEngine", 0.2] remoteExec ["setHitPointDamage", _startHeli];
	_startHeli setHitPointDamage ["hitEngine", 0.2];
	_startHeli setHitPointDamage ["HitHull", 0.4];
	clearWeaponCargoGlobal _startHeli;
	clearBackpackCargoGlobal _startHeli;
	clearItemCargoGlobal _startHeli;
	clearMagazineCargoGlobal _startHeli;
	
	private _npos = [(_pos select 0) + (random 5) + 18, (_pos select 1) + (random 5) + 22];
	private _vehicle = createVehicle ["I_Heli_Transport_02_F", _npos, [], 0, "CAN_COLLIDE"];
	_vehicle setdir (random 360);
	_vehicle setFuel 0;
	_vehicle setVehicleAmmo 0;
	_vehicle setHitPointDamage ["hitEngine", 1];
	_vehicle setHitPointDamage ["HitHull", 0.5];
	clearWeaponCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	
	_npos = [(_pos select 0) - (random 6) - 20, (_pos select 1) + (random 6) + 21];
	_vehicle = createVehicle ["I_Heli_Transport_02_F", _npos, [], 0, "CAN_COLLIDE"];
	_vehicle setdir (random 360);
	_vehicle setFuel 0;
	_vehicle setVehicleAmmo 0;
	_vehicle setHitPointDamage ["hitEngine", 0.2];
	_vehicle setHitPointDamage ["HitHull", 0.7];
	clearWeaponCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;

	["drn_EvacuationZone1", _pos, "hd_pickup", "ColorBlue", true] call Zagor_fnc_createLocationMarker;
	Zagor_VAR_SitesPoint pushBack [6, _pos, objNull];
};

_startHeli