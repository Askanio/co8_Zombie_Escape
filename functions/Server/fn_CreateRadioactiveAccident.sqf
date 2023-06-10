

private _centerposition = [worldSize / 2, worldsize / 2, 0];//for debug! Zagor_StartPos

//[_box,50,0.02,"H_PilotHelmetFighter_B","MineDetector"] call Zagor_fnc_CreateRadioactiveZone;


private _fnc_GetRandomVector = {

	private _x = random 5000;//for debug! 100;
	private _y = random 5000;//for debug! 100;
	
	private _blah = floor(random 2);//returns 0 or 1
	if (_blah == 0) then { _x = _x * -1; };
	_blah = floor(random 2);//returns 0 or 1
	if (_blah == 0) then { _y = _y * -1; };
	
	_vector = [_x, _y];
	
    _vector
};

private _vehicleClass = "B_T_Truck_01_transport_F";
private _pos = [];
private _ok = false;
private _count = 0;
while { _ok == false && _count < 7 } do
{
	_count = _count + 1;
	private _vector = call _fnc_GetRandomVector;
	private _posXY = Zagor_StartPos vectoradd _vector;
	private _roadSegments = [_posXY select 0, _posXY select 1] nearRoads (200);
	//diag_log format["Radioactive point 1: '%1', %2", _posXY, _roadSegments];
	if (count _roadSegments > 0) then {
		private _roadSegment = selectRandom _roadSegments;
		private _newPos = getPos _roadSegment;
		_pos = _newPos findEmptyPosition [5, 30, _vehicleClass];
		//diag_log format["Radioactive point 2: '%1'", _pos];
		if (count _pos > 0) then {
			private _distance = Zagor_StartPos distance2D _pos;
			//diag_log format["Radioactive point 3: '%1'", _distance];
			if (_distance > 150) then { _ok = true; }; //for debug!10
		};
	};
};

if (_ok == true) then {

	[_pos,15] call Zagor_fnc_cleanupTerrain;
	
	private _npos = [(_pos select 0), (_pos select 1) + 10];
	private _vehicle = createVehicle ["B_T_Truck_01_ammo_F", _npos, [], 0, "CAN_COLLIDE"];
	[_vehicle] call Zagor_fnc_AdjustVehicle;
	_vehicle setdir 150;
	_vehicle setAmmoCargo ((random 0.1) + 0.1);
	_vehicle setFuel 0;
	_vehicle setHit ["motor", 1];
	
	_npos = [(_pos select 0) + 3, (_pos select 1) + 3];
	_vehicle = createVehicle ["Land_MetalBarrel_F", _npos, [], 0, "CAN_COLLIDE"];
	_npos = [(_pos select 0) + 2, (_pos select 1) + 3.5];
	_vehicle = createVehicle ["Land_MetalBarrel_F", _npos, [], 0, "CAN_COLLIDE"];
	_vehicle setVectorDir [1, 1, 0];
	
	_vehicle = createVehicle [_vehicleClass, _pos, [], 0, "CAN_COLLIDE"];
	[_vehicle] call Zagor_fnc_AdjustVehicle;
	_vehicle setFuel 0;
	_vehicle setHit ["motor", 1];
	
	[_vehicle,((random 40) + 30), ((random 0.02) + 0.02), zagor_var_Escape_rad_protect_mask, zagor_var_Escape_rad_detector,false,10,true] execvm "Scripts\AL_radiation\radioactive_object.sqf";
	
	[format ["drn_AccidentRadioactiveMarker%1", 1], _pos, "KIA", "ColorRed", true] call Zagor_fnc_createLocationMarker;
	
	[_vehicle] remoteExec ["Zagor_fnc_CreateRadioactiveFog", 0, true];
	
	diag_log format["Radioactive accident point: '%1'", _pos];
} else {
	diag_log "Radioactive accident point: Unable to find spawn road for Radioactive point";
};
	