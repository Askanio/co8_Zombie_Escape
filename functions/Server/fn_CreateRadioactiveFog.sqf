
// null = [this,30,0.02,"H_PilotHelmetFighter_B","MineDetector"] execvm "GAS\radioactive_object.sqf";

//private ["_obj_rad_obj","_rad_radius_obj","_rad_dam_obj","_rad_prot_mask_obj"];

private _obj_rad_obj = _this select 0;
/*
_rad_radius_obj 	= _this select 1;
_rad_dam_obj 		= _this select 2;
_rad_prot_mask_obj	= _this select 3; 
_rad_detector		= _this select 4;

//[[[_obj_rad_obj,_rad_radius_obj,_rad_dam_obj,_rad_prot_mask_obj,_rad_detector], "Scripts\AL_radiation\rad_emitter.sqf"], "BIS_fnc_execVM", true, true] spawn BIS_fnc_MP;
//[]execVM "GAS\al_ini_fnc.sqf";
//[_obj_rad_obj,_rad_radius_obj,_rad_dam_obj,_rad_prot_mask_obj,_rad_detector,false,10,true] remoteExec ["Scripts\AL_radiation\radioactive_object.sqf", 0, true];
//[]execVM "Scripts\AL_radiation\al_ini_fnc.sqf";
[_obj_rad_obj,_rad_radius_obj,_rad_dam_obj,_rad_prot_mask_obj,_rad_detector,false,10,true] execvm "Scripts\AL_radiation\radioactive_object.sqf";
*/

velocity_fog = [random 3,random 3,-0.2]; //move, height
color_fog = [0.6, 0.7, 0.2]; //colour
alpha_fog = 0.02+random 0.2; //transparency
    _pos = position _obj_rad_obj;
    _fog = "#particlesource" createVehicleLocal _pos;
	_fog setParticleParams [["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "","Billboard", 1, 10, [0, 0, -6], velocity_fog, 1, 1.275, 1, 0,[14,10], [color_fog + [0], color_fog + [alpha_fog], color_fog  + [0]], [1000], 1, 0, "", "", _obj_rad_obj];
	_fog setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
	_fog setParticleCircle [0.001, [0, 0, -0.12]];
    _fog setDropInterval 0.01;
	
//sleep 85;
//deleteVehicle _fog;//remove gas


/*	
(0.7, 0.5, 0.2)(0.6, 0.7, 0.2)(1.5, 1.7, 0.) orange
(0.5, 1.7, 0.2) green
(1.0, 0.7, 2.3)(0.2, 0.2, 1.3) fiolet
(2.2, 0.2, 1.3)rosa
*/
