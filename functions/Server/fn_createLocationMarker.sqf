private["_marker","_trigger","_activation"];
params["_markerName","_markerPosition","_markerType",["_color","ColorBlue"],["_hidden",false]]; //ColorRed

_marker = createMarker [_markerName, _markerPosition];
_marker setMarkerShape "ICON";
_marker setMarkerColor _color;

if(isNil("Zagor_POIs")) then {
	Zagor_POIs = [];
};

//private _hidden = true;
private _unknown = true;
private _accuracy = 0;
if(Zagor_Param_RevealMarkers == 0) then {
		_marker setMarkerType _markerType;
};
if(Zagor_Param_RevealMarkers == 1 && !_hidden) then {
		_marker setMarkerType "hd_unknown";
		_trigger = createTrigger["EmptyDetector", _markerPosition, false];
		_trigger setTriggerInterval 5;
		_trigger setTriggerArea[200, 200, 0, false];
		_trigger setTriggerActivation[Zagor_VAR_Side_Blufor_Str, "PRESENT", false];
		_activation = format["[%1,true] spawn Zagor_fnc_UpdateLocationMarker;",str _marker];
		_trigger setTriggerStatements["this",_activation ,""];
	};
if(Zagor_Param_RevealMarkers == 2 || _hidden) then {
		_hidden = true; //true for all markers when reveal == 2 or hidden from param (wrecks)
		_marker setMarkerType "hd_unknown";
		_marker setMarkerAlpha 0;
		_trigger = createTrigger["EmptyDetector", _markerPosition, false];
		_trigger setTriggerInterval 5;
		_trigger setTriggerArea[200, 200, 0, false];
		_trigger setTriggerActivation["GROUP", "PRESENT", false];
		_trigger triggerAttachVehicle [([] call Zagor_FNC_getPlayers) select 0];
		_activation = format["[%1,true] spawn Zagor_fnc_UpdateLocationMarker;",str _marker];
		_trigger setTriggerStatements["this",_activation ,""];
	};
if(Zagor_Param_RevealMarkers == 3) then {
		_marker setMarkerType "Empty";
		_marker setMarkerAlpha 0;
	};
if(Zagor_Param_RevealMarkers>3) then {
	diag_log "Unknown type of Zagor_Param_RevealMarkers";
};

Zagor_POIs pushBack [_marker,_markerType,_color,_markerPosition,_hidden,_unknown,_accuracy];