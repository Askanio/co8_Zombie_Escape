params ["_target", "_caller", "_actionId", "_arguments"];

{
	if (_x isKindOf 'B_Heli_Light_01_F') then {
		_x setHitPointDamage ["hitEngine", 0.2];;}
} forEach nearestObjects [_caller,[],5];

//_target setDammage 0;
//_target setHitPointDamage ["hitEngine", 0];

_caller playActionNow "medicstartup";
sleep 3;
_caller playActionNow "medicstop";
//execVM "Repair.sqf"
//_target setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _target) >> "HitPoints" >> "engine"),0.5];