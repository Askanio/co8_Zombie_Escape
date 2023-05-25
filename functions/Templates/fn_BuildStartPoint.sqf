// Object composition created and exported with Map Builder
// See www.map-builder.info - Map Builder by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"

private["_obj","_pos"];
params ["_center","_rotation","_startHeli"];

//Stuff that needs to be global. Normally this is the gate and the Loudspeaker
if(isserver) then {
	[_center,25] call Zagor_fnc_cleanupTerrain;
	
	_pos = [_center,_center vectorAdd [random 2.0 - 7, random 2.0 - 7,0],_rotation] call Zagor_fnc_rotatePosition;
	_startHeli setdir ((getdir _startHeli) + _rotation);
	_startHeli setPosATL _pos;

//_pos = [_center,_center vectorAdd [7,0,0],_rotation] call Zagor_fnc_rotatePosition;
//_obj = "B_Heli_Light_01_F" createVehicleLocal  _pos;
//_obj = "B_LSV_01_unarmed_F" createVehicle  _pos;
//_obj setdir ((getdir _obj) + _rotation);
//_obj setPosATL _pos;
//_obj setFuel (random 0.3 + 0.2);
//_obj setDamage [random 0.3 + 0.2, true];
//_obj setVehicleAmmo 0;
//clearBackpackCargoGlobal _obj;
//clearItemCargoGlobal _obj;
//_obj setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "engine"),1];
//_obj setHit ["motor", 1];

//	_pos = [_center,_center vectorAdd [-6.79578,8.24268,0],_rotation] call Zagor_fnc_rotatePosition;
	
//	_obj = "Land_Loudspeakers_F" createVehicle  _pos;
//	_obj setVectorDirAndUp [[1,-4.37114e-008,0],[0,-0,1]];
//	_obj setdir ((getdir _obj) + _rotation);
//	_obj setPosATL _pos;

//	A3E_PrisonLoudspeakerObject = _obj;
//	publicvariable "A3E_PrisonLoudspeakerObject";
	
//	_pos = [_center,_center vectorAdd [3.08691,7.09082,0],_rotation] call Zagor_fnc_rotatePosition;
//	_obj = "Land_City_Gate_F" createVehicle  _pos;
//	_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
//	_obj setdir ((getdir _obj) + _rotation);
//	_obj setPosATL _pos;

//	A3E_PrisonGateObject = _obj;

	
};

//Stuff that can be local and is created duplicated on each client. This reduces network traffic at start.


//_pos = [_center,_center vectorAdd [4,0,0],_rotation] call Zagor_fnc_rotatePosition;
//_obj = "Land_ClutterCutter_large_F" createVehicleLocal  _pos;
//_obj setdir ((getdir _obj) + _rotation);
//_obj setPosATL _pos;



