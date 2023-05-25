if(!isserver) exitwith {};

if(isNil("Zagor_SmallMedicalMarkerNumber")) then {
	Zagor_SmallMedicalMarkerNumber = 0;
} else {
	Zagor_SmallMedicalMarkerNumber = Zagor_SmallMedicalMarkerNumber +1;
};
_number = Zagor_SmallMedicalMarkerNumber;

private _centerPos = _this select 0;
private _rotateDir = floor(random 359);

private _objects = [];

private["_dir", "_pos", "_obj"];

_pos = [1.090605, 5.882553];
_dir = 0.0000;
_obj = ["Land_MedicalTent_01_digital_closed_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-12.624395, 5.083553];
_dir = 0.0000;
_obj = ["Land_ConnectorTent_01_AAF_closed_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [13.034605, -6.530447];
_dir = 267.4903;
_obj = ["Land_MedicalTent_01_digital_closed_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-4.484395, -10.238447];
_dir = 198.3578;
_obj = ["Land_PaperBox_open_empty_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-5.753395, -7.798447];
_dir = 0.0000;
_obj = ["Land_PaperBox_open_empty_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-3.282395, -4.536447];
_dir = 268.7095;
_obj = ["Land_BloodBag_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [0.857605, -3.855447];
_dir = 188.2054;
_obj = ["Land_BloodBag_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-2.921395, -11.030447];
_dir = 262.1250;
_obj = ["Land_BloodBag_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-0.752395, -2.990447];
_dir = 0.0000;
_obj = ["BloodPool_01_Medium_New_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [6.343605, -5.769447];
_dir = 249.2922;
_obj = ["BloodPool_01_Medium_New_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [4.022105, 0.620553];
_dir = 0.0000;
_obj = ["Land_Bodybag_01_folded_blue_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-3.218395, -0.974447];
_dir = 229.6979;
_obj = ["Land_IntravenStand_01_1bag_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-0.983395, -0.502447];
_dir = 295.3821;
_obj = ["MedicalGarbage_01_Bandage_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-1.581395, -1.730447];
_dir = 137.0812;
_obj = ["MedicalGarbage_01_Bandage_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [3.882605, -11.493447];
_dir = 120.7796;
_obj = ["Land_Stretcher_01_sand_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-7.713395, -9.872447];
_dir = 0.0000;
_obj = ["MedicalGarbage_01_Packaging_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [5.297605, -9.519447];
_dir = 295.4260;
_obj = ["MedicalGarbage_01_Bandage_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [8.041605, 3.536553];
_dir = 287.6062;
_obj = ["Land_Stethoscope_01_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [9.733605, -14.801447];
_dir = 194.9892;
_obj = ["Land_FirstAidKit_01_open_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-5.960395, 2.771553];
_dir = 298.1766;
_obj = ["MedicalGarbage_01_1x1_v1_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [0.959605, -8.090447];
_dir = 272.4263;
_obj = ["MedicalGarbage_01_Bandage_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-8.203395, -0.008447];
_dir = 305.2840;
_obj = ["Land_PortableLight_double_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-12.111395, 15.367553];
_dir = 0.0000;
_obj = ["Land_GarbageBarrel_02_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-13.858395, 13.331553];
_dir = 305.4822;
_obj = ["Land_GarbageBarrel_02_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [8.939105, 17.564553];
_dir = 117.6515;
_obj = ["Land_PaperBox_01_small_destroyed_brown_IDAP_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [16.428605, 12.612553];
_dir = 56.4230;
_obj = ["Land_PaperBox_01_small_destroyed_brown_IDAP_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [9.374605, 15.427553];
_dir = 110.7349;
_obj = ["Land_PaperBox_01_small_ransacked_brown_IDAP_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-11.810395, -5.266447];
_dir = 119.3640;
_obj = ["Land_PaperBox_01_small_ransacked_white_IDAP_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [14.813605, -13.218447];
_dir = 0.0000;
_obj = ["OmniDirectionalAntenna_01_olive_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-8.311395, 0.439553];
_dir = 0.0000;
_obj = ["Land_BatteryPack_01_closed_olive_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-13.772395, 1.838553];
_dir = 0.0000;
_obj = ["Land_Garbage_square3_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-9.275395, 6.656553];
_dir = 0.0000;
_obj = ["Land_WaterBarrel_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-11.245395, 2.804553];
_dir = 0.0000;
_obj = ["Land_Bucket_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [13.265605, -12.721447];
_dir = 0.0000;
_obj = ["Land_CampingTable_small_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-2.395395, 12.152553];
_dir = 0.0000;
_obj = ["Land_BarrelWater_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [1.073605, 16.476553];
_dir = 0.0000;
_obj = ["Land_Can_Dented_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;


//_pos = [12.860263, -0.792895];
//_dir = deg 5.422030;
//_obj = ["Box_IND_Ammo_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
//_objects pushBack _obj;
//_pos = [7.948263, 6.599105];
//_dir = deg 4.944892;
//_obj = ["Box_IND_Wps_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
//_objects pushBack _obj;


    // Weapons
    
    private ["_weapons", "_weaponMagazines", "_box", "_weaponCount"];

    // Basic Weapon Box
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count zagor_arr_AmmoDepotBasicWeapons - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = zagor_arr_AmmoDepotBasicWeapons select _i;
        
        _weaponClassName = _handGunItem select 0;
        _probabilityOfPrecence = _handGunItem select 1;
        _minCount = _handGunItem select 2;
        _maxCount = _handGunItem select 3;
        _magazines = _handGunItem select 4;
        _magazinesPerWeapon = _handGunItem select 5;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _weaponCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons pushBack [_weaponClassName, _weaponCount];
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines pushBack [_magazines select _j, _weaponCount * _magazinesPerWeapon];
            };
        };
    };
    
    if (count _weapons > 0 || count _weaponMagazines > 0) then {
		_pos = [12.860263, -0.792895];
		_dir = deg 5.422030;
		_box = ["Box_East_Wps_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
		_objects pushBack _box;
        //_box = createVehicle ["Box_East_Wps_F", _pos, [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
		clearBackpackCargoGlobal _box;
        
        {
            _box addWeaponCargoGlobal _x;
        } foreach _weapons;
        
        {
            _box addMagazineCargoGlobal _x;
        } foreach _weaponMagazines;
    };

	// Med
	for "_i" from 0 to (count zagor_arr_Escape_SmallMedical - 1) do {      
        private _weaponClassName = zagor_arr_Escape_SmallMedical select _i;     
        _weaponCount = floor (5 + random 10);
        _weapons pushBack [_weaponClassName, _weaponCount];
    };
    
    if (count _weapons > 0) then {
		_pos = [7.948263, 6.599105];
		_dir = deg 4.944892;
		_box = ["Box_East_Wps_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
		_objects pushBack _box;
        //_box = createVehicle ["Box_East_Wps_F", _pos, [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
		clearBackpackCargoGlobal _box;
        
        {
            _box addWeaponCargoGlobal _x;
        } foreach _weapons;
    };


private _id = Zagor_VAR_SitesPointGuid;
Zagor_VAR_SitesPointGuid = Zagor_VAR_SitesPointGuid + 1;
Zagor_VAR_SitesPointObjects set [_id, _objects];
[_id, _centerPos] call Zagor_fnc_CreateSiteTrigger;

["Zagor_SmallMedicalSiteMapMarker" + str _number,_centerPos,"b_unknown"] call Zagor_fnc_createLocationMarker; // o_unknown



//_marker = createMarkerLocal ["Zagor_MortarSitePatrolMarker" + str _number, _position];
//_marker setMarkerShapeLocal "ELLIPSE";
//_marker setMarkerAlphaLocal 0;
//_marker setMarkerSizeLocal [50, 50];

