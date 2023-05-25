params [["_msg","Empty message"]];
waituntil{time>2};
if(Zagor_Debug) then {
    [[_msg],"Zagor_fnc_systemChat",true] call BIS_fnc_MP;
	 [[_msg],"Zagor_fnc_rptLog",true] call BIS_fnc_MP;
};