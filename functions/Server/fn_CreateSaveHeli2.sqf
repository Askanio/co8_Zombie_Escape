
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
	//_pos = [(Zagor_StartPos select 0) + 30, (Zagor_StartPos select 1) + 30]; // for test
		
	_startHeli = createVehicle ["I_Heli_light_03_unarmed_F", _pos, [], 0, "CAN_COLLIDE"];
	_startHeli setFuel (random 0.3 + 0.2);
	_startHeli setVehicleAmmo 0;
	_startHeli setHitPointDamage ["hitEngine", 0.2];
	_startHeli setHitPointDamage ["HitHull", 0.3];
	clearWeaponCargoGlobal _startHeli;
	clearBackpackCargoGlobal _startHeli;
	clearItemCargoGlobal _startHeli;
	clearMagazineCargoGlobal _startHeli;
	
	private _npos = [(_pos select 0) + 8, (_pos select 1) + 8];
	private _vehicle = createVehicle ["Land_MetalBarrel_F", _npos, [], 0, "CAN_COLLIDE"];
	_npos = [(_pos select 0) + 8, (_pos select 1) + 9.5];
	_vehicle = createVehicle ["Land_MetalBarrel_F", _npos, [], 0, "CAN_COLLIDE"];
	_vehicle setVectorDir [1, 1, 0];
	_npos = [(_pos select 0) + 7, (_pos select 1) - 7.5];
	_vehicle = createVehicle ["Land_MetalBarrel_F", _npos, [], 0, "CAN_COLLIDE"];
	_vehicle setVectorDir [1, 0, 1];

	[_vehicle,((random 30) + 50), ((random 0.02) + 0.02), zagor_var_Escape_rad_protect_mask, zagor_var_Escape_rad_detector,false,10,true] execvm "Scripts\AL_radiation\radioactive_object.sqf";
	[_vehicle] remoteExec ["Zagor_fnc_CreateRadioactiveFog", 0, true];
	["drn_AccidentHeliRadioactiveMarker1", _pos, "KIA", "ColorRed", true] call Zagor_fnc_createLocationMarker;
	Zagor_VAR_SitesPoint pushBack [5, _pos, objNull];
};

_startHeli