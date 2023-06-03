private ["_centerPos", "_rotateDir", "_staticWeaponClasses", "_parkedVehicleClasses", "_index"];
private ["_pos", "_dir", "_posX", "_posY", "_sectionDir", "_gun", "_vehicle", "_powerGenerator","_static"];
private ["_obj"];


_centerPos = _this select 0;
_rotateDir = _this select 1;

if (count _this > 2) then { _staticWeaponClasses = _this select 2; } else { _staticWeaponClasses = []; };
if (count _this > 3) then { _parkedVehicleClasses = _this select 3; } else { _parkedVehicleClasses = []; };

[_centerPos,25] call zagor_fnc_cleanupTerrain;

/*
private _fnc_CreateVehicle = {
    private ["_className", "_relativePos", "_relativeDir", "_centerPos", "_rotateDir"];
    private ["_object", "_realPos", "_realDir"];
    
    _className = _this select 0;
    _relativePos = _this select 1;
    _relativeDir = _this select 2;
    _centerPos = _this select 3;
    _rotateDir = _this select 4;
    
    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1)], _rotateDir] call zagor_fnc_RotatePosition);
    _realDir = _relativeDir + _rotateDir;
    //_object = _className createVehicle _realpos;
    _object = createVehicle [_className, _realpos, [], 0, "NONE"];
    _object setDir _realDir;
    //_object lock true;
    _object
};
*/

private _objects = [];
private _vehicles = [];

/// Bagfence

/*
// (North western corner)
_pos = [-18, 16.5];
_dir = 90;
_obj = ["Land_fort_bagfence_corner", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
*/

//(North western wall)
_pos = [-18, 15.15];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

// (Western wall)
_posX = -19.2;
_sectionDir = 270;

_pos = [_posX, 14];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, -4];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, -1];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, 2];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, 5];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, 8];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, 11];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, -7];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, -10];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

// (Southern wall)
_posY = -11.2;

_pos = [-18, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [-15, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [-12, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [-9, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [-6, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [-3, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [0, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [3, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [6, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [9, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [12, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [15, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [18, _posY];
_dir = 0;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

// (Eastern wall)
_posX = 19.2;
_sectionDir = 90;

_pos = [_posX, -10];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, -7];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, -4];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, -1];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, 2];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, 5];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, 8];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, 11];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [_posX, 14];
_dir = _sectionDir;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

// (North eastern wall)
_pos = [18, 15.15];
_dir = 180;
_obj = ["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

// Barracks

_pos = [-13, -3];
_dir = 0;
_obj = ["Land_Cargo_Patrol_V1_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

//"Land_Cargo20_military_green_F"
// Power Generator
_pos = [4, -7];
_dir = 90;
_obj = ["Land_Communication_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;


// Antennas
_pos = [0, -9];
_dir = 180;
_obj = ["Box_East_Wps_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
//_obj setvariable ["Zagor_isTerminal",true,true];
_obj allowDamage false;
//[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;
_objects pushBack _obj;
clearWeaponCargoGlobal _obj;
clearMagazineCargoGlobal _obj;
clearItemCargoGlobal _obj;
clearBackpackCargoGlobal _obj;
_obj addItemCargoGlobal ["Laptop_closed", 1];

/*
_pos = [0, -9];
_dir = 180;
_obj = ["Land_DataTerminal_01_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
//[[_obj, "Hijack", "Scripts\Escape\Hijack.sqf"], "a3e_fnc_addHijackAction", nil, false] spawn BIS_fnc_MP;
_obj setvariable ["Zagor_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;
_objects pushBack _obj;
*/

_pos = [13, 1];
_dir = 90;
_obj = ["Land_Medevac_House_V1_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
//[[_obj, "Heal at medical building", "Scripts\Escape\HealAtMedicalBuilding.sqf"], "a3e_fnc_addHealAtMedicalBuildingAction", nil, false] spawn BIS_fnc_MP;
_objects pushBack _obj;

_pos = [10, -5];
_dir = 180;
_obj = ["Land_Cargo_House_V1_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

// Toilet

_pos = [-8, -9];
_dir = 180;
_obj = ["Land_ToiletBox_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [-6.7, -9];
_dir = 180;
_obj = ["Land_ToiletBox_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;


// Fuel Tank
_pos = [-14, 10];
_dir = 90;
_obj = ["Land_Tank_rust_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

// Camo Nets




// Flag
_pos = [0, 10];
_dir = 0;
_obj = ["FlagPole_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_obj forceFlagTexture Zagor_VAR_Flag_Opfor;
_objects pushBack _obj;

/**/
if (count _staticWeaponClasses > 0) then {
    // Statics
    _pos = [-17, 13.5];
    _dir = 0;
    
    _gun = selectRandom _staticWeaponClasses;
    _obj = [_gun, _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
	//[_obj,Zagor_VAR_Side_Opfor] spawn Zagor_fnc_AddStaticGunner; 
    _objects pushBack _obj;

    _pos = [17, -9.5];
    _dir = 135;
    
    _gun = selectRandom _staticWeaponClasses;
    _obj = [_gun, _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
	//[_obj,Zagor_VAR_Side_Opfor] spawn Zagor_fnc_AddStaticGunner;
	_objects pushBack _obj;

};


if (count _parkedVehicleClasses > 0) then {
    // Cars
    _pos = [11.5, 12];
    _dir = 270;
    
    _vehicle = selectRandom _parkedVehicleClasses;
    _obj = [_vehicle, _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteVehicle;
	_vehicles pushBack _obj;
	[_obj] call Zagor_fnc_AdjustVehicle;

    _pos = [11.5, 6.5];
    _dir = 270;
    
    _vehicle = selectRandom _parkedVehicleClasses;
    _obj = [_vehicle, _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
	_vehicles pushBack _obj;
	[_obj] call Zagor_fnc_AdjustVehicle;
};

private _id = Zagor_VAR_SitesPointGuid;
Zagor_VAR_SitesPointGuid = Zagor_VAR_SitesPointGuid + 1;
Zagor_VAR_SitesPointObjects set [_id, _objects];
[_id, _centerPos] call Zagor_fnc_CreateSiteTrigger;

_vehicles
