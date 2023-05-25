// Build start position
private _fenceRotateDir = random 360;

//private _backPack = (selectRandom (missionNamespace getVariable ["Zagor_arr_PrisonBackpacks", ["B_AssaultPack_khk"]])) createvehicle Zagor_StartPos;

//private _template = selectRandom(["a3e_fnc_BuildPrison", "a3e_fnc_BuildPrison1", "a3e_fnc_BuildPrison2", "a3e_fnc_BuildPrison3", "a3e_fnc_BuildPrison4", "a3e_fnc_BuildPrison5"]);

private _startHeli = (selectRandom (missionNamespace getVariable ["Zagor_arr_StartHeli", ["B_Heli_Light_01_F"]])) createvehicle Zagor_StartPos; //"B_Heli_Light_01_F" "B_LSV_01_unarmed_F"

_startHeli setFuel (random 0.3 + 0.2);
_startHeli setVehicleAmmo 0;
clearWeaponCargoGlobal _startHeli;
clearBackpackCargoGlobal _startHeli;
clearItemCargoGlobal _startHeli;
clearMagazineCargoGlobal _startHeli;
_startHeli addBackpackCargoGlobal["B_AssaultPack_khk", floor(random 1) + 1];
for [{_i = 0}, {_i < (6)}, {_i = _i + 1}] do {
	private _weapon = zagor_arr_PrisonBackpackWeapons select floor(random(count(zagor_arr_PrisonBackpackWeapons)));
	_startHeli addWeaponCargoGlobal[(_weapon select 0),1];
	_startHeli addMagazineCargoGlobal[(_weapon select 1),3];
};
//_startHeli setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _startHeli) >> "HitPoints" >> "engine"),1];
//_startHeli setHit ["motor", 1];
_startHeli setHitPointDamage ["hitEngine", 0.9];
//_startHeli setDammage 0.7;

//if(isserver) then {
	[Zagor_StartPos,25] call Zagor_fnc_cleanupTerrain;
	
	_pos = [Zagor_StartPos,Zagor_StartPos vectorAdd [random 2.0 - 7, random 2.0 - 7,0],_fenceRotateDir] call Zagor_fnc_rotatePosition;
	_startHeli setdir ((getdir _startHeli) + _fenceRotateDir);
	_startHeli setPosATL _pos;
//};
//[Zagor_StartPos, _fenceRotateDir, _startHeli] remoteExec ["zagor_fnc_BuildStartPoint", 0, true];

Zagor_StartPointIsCreated = true;
publicVariable "Zagor_StartPointIsCreated";

_startHeli