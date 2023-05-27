if(!isserver) exitwith {};

private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_pos", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk","_regionCount"];

_positions = [];
_i = 0;

_countNW = 0;
_countNE = 0;
_countSE = 0;
_countSW = 0;

if(isNil("Zagor_MedicalSiteCount")) then {
            Zagor_MedicalSiteCount = 8;
    };
_regionCount = ceil(Zagor_MedicalSiteCount/4);
while {count _positions < Zagor_MedicalSiteCount} do {
    _isOk = false;
    _j = 0;

    while {!_isOk} do {
        _pos = call Zagor_fnc_findFlatArea;
        _isOk = true;


        if (_pos select 0 <= ((getpos center) select 0) && _pos select 1 > ((getpos center)select 1)) then {
            if (_countNW <= _regionCount) then {
                _countNW = _countNW + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 > ((getpos center) select 1)) then {
            if (_countNE <= _regionCount) then {
                _countNE = _countNE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 <= ((getpos center) select 1)) then {
            if (_countSE <= _regionCount) then {
                _countSE = _countSE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 <= ((getpos center)select 0) && _pos select 1 <= ((getpos center) select 1)) then {
            if (_countSW <= _regionCount) then {
                _countSW = _countSW + 1;
            }
            else {
                _isOk = false;
            };
        };

        _j = _j + 1;
        if (_j > 100) then {
            _isOk = true;
        };
    };

    _tooCloseAnotherPos = false;

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

{
//[_x, zagor_arr_Escape_AmmoDepot_StaticWeaponClasses, zagor_arr_Escape_AmmoDepot_ParkedVehicleClasses] call
    [_x] call 
        selectRandom [
            Zagor_fnc_MedicalSite//,
            //A3E_fnc_AmmoDepot2,
            //A3E_fnc_AmmoDepot3,
            //A3E_fnc_AmmoDepot4,
            //A3E_fnc_AmmoDepot5
        ];
	Zagor_VAR_SitesPoint pushBack [2, _x, objNull];
} foreach _positions;

Zagor_VAR_Escape_MedicalSitePositions = _positions;
publicVariable "Zagor_VAR_Escape_MedicalSitePositions";
