private _id = _this select 0;
private _position = _this select 1;

private _distDetect = 1000;

// Hide if site far away
private _meters = _position distance2D Zagor_StartPos;
if (_meters > _distDetect) then {
	[_id,true] spawn Zagor_fnc_UpdateVisibleSite;
};	

// Set trigger for show/hide site
private _trigger = createTrigger["EmptyDetector", _position, false];
		_trigger setTriggerInterval 5;
		_trigger setTriggerArea[_distDetect, _distDetect, 0, false];
		_trigger setTriggerActivation[Zagor_VAR_Side_Blufor_Str, "PRESENT", false];
private _activation = format["[%1,false] spawn Zagor_fnc_UpdateVisibleSite;",str _id];
private _disactivation = format["[%1,true] spawn Zagor_fnc_UpdateVisibleSite;",str _id];
		_trigger setTriggerStatements["this",_activation ,_disactivation];