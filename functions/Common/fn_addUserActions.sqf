at_fnc_repairHeli = {
	//params ["_target", "_caller", "_actionId", "_arguments"];
	private _return = false;
	private _target = cursorTarget;
	if(isNull _target) exitwith {false;};
	if((player distance _target)>3) exitwith {false;};
	if(typeof _target == "B_Heli_Light_01_F") then {
		//if ("Laptop_closed" in (items player + assignedItems player)) then {
		if ("Laptop_Closed" in (magazines player)) then {
			_return = true;
		};
	};
	_return;
};

Zagor_localvar_RepairHeli = player addAction [format ["<t color=""#cccc00"">%1</t>", localize "STR_Zagor_action_RepairHeli"], "_this call Zagor_fnc_repairHelicopter;", [], 9, false, true, "", "call at_fnc_repairHeli"];
