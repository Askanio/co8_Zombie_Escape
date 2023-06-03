params ["_vehicle"];

_vehicle setFuel (random 0.1) + 0.02;
_vehicle setDamage [random 0.3 + 0.4, true];
_vehicle setVehicleAmmo 0;
clearBackpackCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
_vehicle setVehicleAmmo random 0.2;
//_sarmor setdamage random [0.25, 0.5, 0.9];
if (random 100 < 5) then {_vehicle addItemCargoGlobal ["ItemMap", 1];};
if (random 100 < 5) then {_vehicle addItemCargoGlobal ["ItemCompass", 1];};
if (random 100 < 5) then {_vehicle addItemCargoGlobal ["ItemWatch", 1];};
if (random 100 < 5) then {_vehicle addItemCargoGlobal ["ItemRadio", 1];};							
if (random 100 < 5) then {_vehicle addItemCargoGlobal ["acc_flashlight", 1];};	
if (random 10 < 3) then {_vehicle addItemCargoGlobal ["FirstAidKit", 1];};
if (random 100 < 5) then {_vehicle addBackpackCargoGlobal [selectRandom zagor_arr_Escape_Backpack, 1];};								
if(Zagor_Param_UseIntel == 1) then {
	[_vehicle] call Zagor_fnc_AddIntelToVehicle;
};
if (random 100 < 5) then {_vehicle addItemCargoGlobal ["Item_acc_flashlight_pistol", 1];};

private _weapon = zagor_arr_PrisonBackpackWeapons select floor(random(count(zagor_arr_PrisonBackpackWeapons)));
if (random 100 < 5) then {_vehicle addWeaponCargoGlobal [(_weapon select 0), 1];};
if (random 10 < 3) then {_vehicle addMagazineCargoGlobal [(_weapon select 1), floor(random 2) + 1];};

if (random 1 > 0.4) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitLFWheel" >> "name"),(random 0.2) + 0.7]};
if (random 1 > 0.4) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitLBWheel" >> "name"),(random 0.2) + 0.7]};
if (random 1 > 0.4) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitRFWheel" >> "name"),(random 0.2) + 0.7]};
if (random 1 > 0.2) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitRBWheel" >> "name"),(random 0.2) + 0.7]};
if (random 1 > 0.3) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass1" >> "name"),(random 0.6) + 0.3]};
if (random 1 > 0.5) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass2" >> "name"),(random 0.6) + 0.3]};
if (random 1 > 0.3) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass3" >> "name"),(random 0.6) + 0.3]};
if (random 1 > 0.5) then {_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass4" >> "name"),(random 0.6) + 0.3]};
_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "engine"),random 0.8]; // HitEngine
_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitHull" >> "name"),(random 0.2) + 0.6];
_vehicle setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitBody" >> "name"),(random 0.2) + 0.6];
