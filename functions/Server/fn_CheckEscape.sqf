if (!isServer) exitWith {};

params["_heli1","_heli2","_heli3"];

waitUntil {time > 0 && Zagor_VAR_SmallMedicalSitesCreated && Zagor_VAR_MedicalSitesCreated};

while {true} do {

	private _pos1 = getPos _heli1;
	private _pos2 = getPos _heli2;
	private _pos3 = getPos _heli3;
	//diag_log format["Heli pos X: '%1' Y: '%2', WorldSize: '%3'", _pos1 select 0, _pos1 select 1, worldSize];
	if (
		(_pos1 select 0) < 0 || (_pos1 select 0) > worldSize || (_pos1 select 1) < 0 || (_pos1 select 1) > worldSize
		||
		(_pos2 select 0) < 0 || (_pos2 select 0) > worldSize || (_pos2 select 1) < 0 || (_pos2 select 1) > worldSize
		||
		(_pos3 select 0) < 0 || (_pos3 select 0) > worldSize || (_pos3 select 1) < 0 || (_pos3 select 1) > worldSize
	) then {

	if({vehicle _x == _heli1 || vehicle _x == _heli2 || vehicle _x == _heli3} count (call Zagor_fnc_GetPlayers) == count (call Zagor_fnc_GetPlayers)) then {
		zagor_var_Escape_MissionComplete = true;
		publicVariable "zagor_var_Escape_MissionComplete";
	} else {
		zagor_var_Escape_MissionFailed_LeftBehind = true;
		publicVariable "zagor_var_Escape_MissionFailed_LeftBehind";
	};

	};

sleep 30;

};