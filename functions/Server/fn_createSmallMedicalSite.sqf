if(!isserver) exitwith {};

private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_pos", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk","_regionCount"];

_positions = [];
_i = 0;

_countNW = 0;
_countNE = 0;
_countSE = 0;
_countSW = 0;

if(isNil("Zagor_SmallMedicalSiteCountMax")) then {
	Zagor_SmallMedicalSiteCountMax = 6;
};
if(isNil("Zagor_SmallMedicalSiteCountMin")) then {
	Zagor_SmallMedicalSiteCountMin = 4;
};
private _smallMedicalSiteCount = Zagor_SmallMedicalSiteCountMin + random (Zagor_SmallMedicalSiteCountMax-Zagor_SmallMedicalSiteCountMin);

_regionCount = ceil(_smallMedicalSiteCount/4);
while {count _positions < _smallMedicalSiteCount} do {
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
// only 1 type
[_x] call Zagor_fnc_SmallMedicalSite;
//	private _blah = floor(random 2);//returns 0 or 1
//	if (_blah == 0) then {
//	[_x] call A3E_fnc_MortarSite;
//	};
//	if (_blah == 1) then {
//	[_x] call A3E_fnc_MortarSite2;
//	};
Zagor_VAR_SitesPoint = Zagor_VAR_SitesPoint + [[1, _x, objNull]];
} foreach _positions;