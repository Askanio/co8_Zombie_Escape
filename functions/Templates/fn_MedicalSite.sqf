if(!isserver) exitwith {};

private _centerPos = _this select 0;

if(isNil("Zagor_MedicalMarkerNumber")) then {
	Zagor_MedicalMarkerNumber = 0;
} else {
	Zagor_MedicalMarkerNumber = Zagor_MedicalMarkerNumber +1;
};
_number = Zagor_MedicalMarkerNumber;

private _rotateDir = floor(random 359);

private _objects = [];

private["_dir", "_pos", "_obj"];

_pos = [10.634289, -14.102120];
_dir = 0.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [3.638989, -14.103020];
_dir = 0.0000;
_obj = ["Land_Net_Fence_Gate_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [14.620589, -10.104020];
_dir = 270.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [14.631989, -2.103420];
_dir = 270.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [14.634989, 5.881580];
_dir = 270.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [10.634289, 17.858880];
_dir = 180.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [2.634289, 17.846580];
_dir = 180.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-13.347711, 17.853980];
_dir = 180.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-17.311511, 5.808080];
_dir = 90.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-17.299011, -2.209020];
_dir = 90.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-17.288011, -10.193420];
_dir = 90.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-13.269011, -14.170420];
_dir = 0.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-5.341311, 17.736580];
_dir = 180.0000;
_obj = ["Land_Net_FenceD_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-5.259311, -14.151420];
_dir = 0.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [14.632289, 13.878880];
_dir = 270.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-17.313011, 13.812580];
_dir = 90.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-3.373511, -10.133820];
_dir = 180.0000;
_obj = ["Land_Net_Fence_8m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;

_pos = [13.125489, 15.307080];
_dir = 0.0000;
_obj = ["Land_ToiletBox_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [0.661589, -12.104420];
_dir = 270.0000;
_obj = ["Land_Net_Fence_4m_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [11.622989, 15.337880];
_dir = 0.0000;
_obj = ["Land_ToiletBox_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-10.724011, 9.330080];
_dir = 0.0000;
_obj = ["Land_MedicalTent_01_digital_closed_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [1.718689, 10.749980];
_dir = 0.0000;
_obj = ["CamoNet_OPFOR_open_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [10.521989, -9.429420];
_dir = 90.0000;
_obj = ["Land_ConnectorTent_01_AAF_closed_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-13.577611, 0.724080];
_dir = 0.0000;
_obj = ["MedicalGarbage_01_3x3_v1_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-15.872011, -4.082420];
_dir = 38.1830;
_obj = ["Land_IntravenStand_01_2bags_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-5.044011, 5.665580];
_dir = 20.1900;
_obj = ["Land_BloodBag_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-12.301311, -11.423420];
_dir = 103.0677;
_obj = ["BloodTrail_01_Old_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-15.553711, -9.912120];
_dir = 30.5833;
_obj = ["MedicalGarbage_01_1x1_v3_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-3.063011, -6.995120];
_dir = 0.0000;
_obj = ["MedicalGarbage_01_Gloves_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-2.015011, 7.609580];
_dir = 0.0000;
_obj = ["Land_Stretcher_01_folded_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-7.519511, -5.760420];
_dir = 65.4117;
_obj = ["Land_Stretcher_01_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-15.296411, 0.685980];
_dir = 353.8759;
_obj = ["Land_Stretcher_01_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [10.436489, 15.202080];
_dir = 0.0000;
_obj = ["Land_Bucket_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [13.469989, -11.008420];
_dir = 0.0000;
_obj = ["Land_BarrelSand_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [12.549989, 7.985280];
_dir = 90.0000;
_obj = ["Land_WoodenCrate_01_stack_x5_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [12.474989, 6.149880];
_dir = 90.0000;
_obj = ["Land_WoodenCrate_01_stack_x3_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [8.909689, 14.815880];
_dir = 0.0000;
_obj = ["OmniDirectionalAntenna_01_olive_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [7.468989, 12.505380];
_dir = 248.4137;
_obj = ["Land_CarBattery_02_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-1.818411, -13.039120];
_dir = 90.0000;
_obj = ["Land_CampingTable_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-2.379411, -11.667020];
_dir = 0.0000;
_obj = ["Land_CampingTable_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-3.425311, -12.964420];
_dir = 237.6257;
_obj = ["Land_CampingChair_V2_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-0.039011, -3.817420];
_dir = 0.0000;
_obj = ["Oil_Spill_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [4.873489, -8.440920];
_dir = 48.1684;
_obj = ["Oil_Spill_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-5.656311, 2.261580];
_dir = 322.0664;
_obj = ["Land_PortableLight_double_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-0.817011, -6.894120];
_dir = 235.9646;
_obj = ["Land_PaperBox_01_open_empty_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-2.086411, 13.038080];
_dir = 0.0000;
_obj = ["Land_CampingTable_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-2.061011, 10.558580];
_dir = 0.0000;
_obj = ["Land_CampingTable_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [1.655989, 12.985580];
_dir = 0.0000;
_obj = ["Land_CampingTable_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [2.463389, 12.462580];
_dir = 268.9223;
_obj = ["Land_WaterBottle_01_pack_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [2.105989, 12.451580];
_dir = 268.9223;
_obj = ["Land_WaterBottle_01_pack_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-1.274411, -15.763720];
_dir = 90.0000;
_obj = ["TapeSign_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [0.687989, -15.955120];
_dir = 90.0000;
_obj = ["TapeSign_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-4.906711, -11.301820];
_dir = 0.0000;
_obj = ["TapeSign_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [5.866689, -11.725120];
_dir = 43.5048;
_obj = ["Land_PaperBox_01_small_destroyed_brown_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [4.026989, 7.866580];
_dir = 190.5776;
_obj = ["Land_PaperBox_01_small_destroyed_brown_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-15.691011, -12.292020];
_dir = 0.0000;
_obj = ["HazmatBag_01_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-14.945011, -12.654820];
_dir = 83.0203;
_obj = ["HazmatBag_01_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [-5.741011, -2.474420];
_dir = 25.4306;
_obj = ["MedicalGarbage_01_FirstAidKit_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [12.335389, -5.413420];
_dir = 0.0000;
_obj = ["Land_WaterTank_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;



/*
_pos = [3.906975, -2.676192];
_dir = deg 0.000000;
_obj = ["Land_V3S_wreck_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [10.846975, 3.086108];
_dir = deg 0.000000;
_obj = ["Box_IND_Ammo_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [12.885975, 2.018608];
_dir = deg 0.000000;
_obj = ["Box_IND_Ammo_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [9.565475, 0.688108];
_dir = deg 0.000000;
_obj = ["Box_IND_Ammo_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
_pos = [12.174375, -0.383192];
_dir = deg 0.000000;
_obj = ["Box_IND_Ammo_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
_objects pushBack _obj;
*/

private ["_weapons", "_weaponMagazines", "_box", "_weaponCount", "_car"];
    
	// Weapons
    
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
		_pos = [10.846975, 3.086108];
		_dir = deg 5.422030;
		_box = ["Box_East_Wps_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
		_objects pushBack _box;
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
	for "_i" from 0 to (count zagor_arr_Escape_Medical - 1) do {      
        private _weaponClassName = zagor_arr_Escape_Medical select _i;     
        _weaponCount = floor (5 + random 10);
        _weapons pushBack [_weaponClassName, _weaponCount];
    };
    
    if (count _weapons > 0) then {
		_pos = [12.885975, 2.018608];
		_dir = deg 4.944892;
		_box = ["Box_East_Wps_F", _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteObject;
		_objects pushBack _box;
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
		clearBackpackCargoGlobal _box;
        
        {
            _box addWeaponCargoGlobal _x;
        } foreach _weapons;
    };

    // Cars
    if (random 10 > 1 && count zagor_arr_Escape_AmmoDepot_ParkedVehicleClasses > 0) then {
        _car = selectRandom zagor_arr_Escape_AmmoDepot_ParkedVehicleClasses;
    }
    else {
        _car = "";
    };
    
    if (_car != "") then {
 /*       _randomNo = random 4;
        _pos = [(_middlePos select 0) + 8, (_middlePos select 1), 0];
        _angle = 45;
        if ((random 100) > 50) then {_angle = 0;} else {_angle = 180;};
        
        if (_randomNo > 2) then {
            _pos = [(_middlePos select 0) - 8, (_middlePos select 1), 0];
            if ((random 100) > 50) then {_angle = 0;} else {_angle = 180;};
        };
        if (_randomNo > 3) then {
            _pos = [(_middlePos select 0), (_middlePos select 1) + 8, 0];
            if ((random 100) > 50) then {_angle = 90;} else {_angle = 270;};
        };*/
        
		_pos = [3.906975, -2.676192];
		_dir = deg 0.000000;
		_obj = [_car, _pos, _dir, _centerPos, _rotateDir] call Zagor_fnc_CreateTempleteVehicle;
		_objects pushBack _obj;
		
		[_obj] call Zagor_fnc_AdjustVehicle;
		
        //_object = createVehicle [_car, _pos, [], 0, "NONE"];
        //_object setPos _pos;
        //_object setDir _angle;
		//[_object,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

private _id = Zagor_VAR_SitesPointGuid;
Zagor_VAR_SitesPointGuid = Zagor_VAR_SitesPointGuid + 1;
Zagor_VAR_SitesPointObjects set [_id, _objects];
[_id, _centerPos] call Zagor_fnc_CreateSiteTrigger;

["Zagor_MedicalSiteMapMarker" + str _number,_centerPos,"b_med"] call Zagor_fnc_createLocationMarker; // o_med
