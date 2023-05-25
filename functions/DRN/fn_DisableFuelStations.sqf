call compile preprocessFileLineNumbers ("Island\FuelStations.sqf");

if (isServer) then {

	if(isNil "zagor_fuelPump_locations") exitwith {
		["Fuelstation pumps not found!"] call BIS_fnc_error;
	};
	
	{
		_trg=createTrigger["EmptyDetector",_x];
		_trg setTriggerArea[10,10,0,false];
		_trg setTriggerActivation["NONE","PRESENT",false];
		_trg setTriggerStatements["true", "{
				if (_x isKindOf 'Land_fs_feed_F' 
				|| _x isKindOf 'Land_fuelstation'
				|| _x isKindOf 'Land_FuelStation_Feed_F'
				|| _x isKindOf 'Land_FuelStation_01_pump_F'
				|| _x isKindOf 'Land_FuelStation_02_pump_F'
				|| _x isKindOf 'Land_FuelStation_03_pump_F') then {
				_x enableSimulation false; _x allowDamage false}
			} forEach nearestObjects [thisTrigger,[],10]", ""]; 
		/*
		_mrk = createMarker [format["%1_fuelpump", floor (random 100000)], _trg];
		_mrk setMarkerShape "ICON";
		_mrk setMarkerType "hd_dot";
		_mrk setMarkerColor "ColorRed";	
		*/
	} foreach zagor_fuelPump_locations;
	
};