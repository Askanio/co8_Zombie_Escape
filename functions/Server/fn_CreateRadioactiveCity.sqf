

private _bigVillages = Zagor_VAR_Villages select { (_x select 2) >= 400 };

private _currentRadioactiveCityCount = 0;
private _ok = false;
private _count = 0;
while { _ok == false && _count < 10 } do {
	_count = _count + 1;
	private _city = selectRandom _bigVillages;
	private _pos = _city select 0;
	private _distance = Zagor_StartPos distance2D _pos;
	//diag_log format["Radioactive city 1: '%1'", _distance];
	if (_distance > 500) then {
		_currentRadioactiveCityCount = _currentRadioactiveCityCount + 1;
		
		[_pos, 400, 4561, []] call BIS_fnc_destroyCity;
		
		private _vehicle = createVehicle ["Land_MetalBarrel_F", _pos, [], 0, "CAN_COLLIDE"];
		//[_vehicle, 400, ((random 0.01) + 0.01), zagor_var_Escape_rad_protect_mask, zagor_var_Escape_rad_detector] call Zagor_fnc_CreateRadioactiveObject;
		[_vehicle, 400, ((random 0.01) + 0.01), zagor_var_Escape_rad_protect_mask, zagor_var_Escape_rad_detector,false,10,true] execvm "Scripts\AL_radiation\radioactive_object.sqf";
	
		[format ["drn_RadioactiveCity%1", _currentRadioactiveCityCount], _pos, "KIA", "ColorRed", true] call Zagor_fnc_createLocationMarker;
		
		[position _vehicle] remoteExec ["Zagor_fnc_CreateRadioactiveFog", 0, true];
		
		if (_currentRadioactiveCityCount == Zagor_RadioactiveCityCount) then { _ok = true; };
		
		diag_log format["Radioactive city point: '%1'", _pos];
		
		// TODO: add bonuses
	}; 

};


