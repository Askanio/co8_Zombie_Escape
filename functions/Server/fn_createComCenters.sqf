if(!isserver) exitwith {};

if (isNil "Zagor_MinComCenterDistance") then {
	Zagor_MinComCenterDistance = 4000;
};

if (isNil "zagor_communicationCenterMarkers") then {
    zagor_communicationCenterMarkers = [];
	diag_log "Warning: Comcenter Templatearray was empty!";
};

private _comCenterMarkers = [] + zagor_communicationCenterMarkers;

if (isNil "Zagor_ComCenterCount") then {
	Zagor_ComCenterCount = 4;
};

//Shuffle comcenters
private _shuffledComCenterMarkers = [];
while {(count _comCenterMarkers) > 0} do {
	_shuffledComCenterMarkers pushBack (_comCenterMarkers deleteAt floor(random(count(_comCenterMarkers))));
};

// iterate over the set of all potential commcenter markers and make commCenters at no more than Zagor_ComCenterCount of them.
//
// This ensures that the Comm Centres are never any less than Zagor_MinComCenterDistance from each other or the starting point.
private _vehicles = [];
private _createdCount = 0;
private _comCenPositions = [];
private _instanceNo = 0;
{
	_x params ["_pos", "_dir"];
	private _ok = true;
	{
		if ((_pos distance _x) < Zagor_MinComCenterDistance) then {
			_ok = false;
		};
	} foreach _comCenPositions;

	if ((_pos distance Zagor_StartPos) < Zagor_MinComCenterDistance) then {
			_ok = false;
	};

	if _ok then {
		// pick one of the BuildComCenter methods at random
		private _initVehicles = [_pos, _dir, zagor_arr_ComCenStaticWeapons, zagor_arr_ComCenParkedVehicles] call 
			selectRandom [
				zagor_fnc_BuildComCenter// TODO, 
				//zagor_fnc_BuildComCenter2,
				//zagor_fnc_BuildComCenter3,
				//zagor_fnc_BuildComCenter4,
				//zagor_fnc_BuildComCenter5
			];

		_vehicles = _vehicles + _initVehicles;
		Zagor_Var_ClearedPositions pushBack _pos;
		[format ["drn_CommunicationCenterMapMarker%1", _instanceNo], _pos, "b_hq"] call Zagor_fnc_createLocationMarker; // o_hq

/*
		private _marker = createMarkerLocal [format ["drn_CommunicationCenterPatrolMarker%1", _instanceNo], _pos];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerAlphaLocal 0;
		_marker setMarkerSizeLocal [75, 75];
*/
		_instanceNo = _instanceNo + 1;
		_createdCount = _createdCount + 1;
		_comCenPositions pushBack _pos;
		
		Zagor_VAR_SitesPoint pushBack [4, _pos, objNull];
	};
	if (_createdCount >= Zagor_ComCenterCount) exitWith {};
} forEach _shuffledComCenterMarkers;

zagor_var_Escape_communicationCenterPositions = _comCenPositions;
publicVariable "zagor_var_Escape_communicationCenterPositions";

_vehicles