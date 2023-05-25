params["_endType"];
private _statisticsCollected = missionNamespace getvariable ["Zagor_EndStatisticsCollected",false];
if(!_statisticsCollected) then {
	missionNamespace setvariable ["Zagor_EndStatisticsCollected",true];
	private _island = getText (missionConfigFile >> "EscapeIsland");
	private _mod = getText (missionConfigFile >> "EscapeMod");
	private _version = getText (missionConfigFile >> "EscapeVersion");
	private _release = getText (missionConfigFile >> "EscapeRelease");
	private _statisticsVersion = profileNamespace getVariable ["Zagor_Statistics_Version", -1]; 
	private _statistics = profileNamespace getVariable ["Zagor_Statistics", []]; 

	_statistics pushBack [_version,_mod,_island,_endType, count (call BIS_fnc_listPlayers), time,Zagor_Task_Map_Complete,Zagor_Task_ComCenter_Complete,Zagor_Task_Exfil_Complete];

	profileNamespace setVariable ["Zagor_Statistics", _statistics]; 
	missionNamespace setvariable ["Zagor_EndStatistics",[_statistics] call Zagor_fnc_parseStatistics,true];
	saveProfileNamespace;

//	if(Zagor_Param_SendStatistics == 1) then {
//		"DummyLayer" cutRsc ["RscTitleDisplayEmpty", "PLAIN"];
//		private _emptyDisplay = uiNamespace getVariable "RscTitleDisplayEmpty";
//		private _html = _emptyDisplay ctrlCreate ["RscHTML", -1]; 
//		_html ctrlSetBackgroundColor [0,0,0,1]; 
//		_html ctrlSetPosition [0,0,0,0]; 
//		_html ctrlCommit 0; 
//		private _uri = "http://escape.anzp.de/track.php?event=endmission&map=" + _island + "&mod=" + _mod + "&version=" + _version + "&players="+str count(call A3E_fnc_GetPlayers)+"&end="+_endType+"&t1="+str A3E_Task_Prison_Complete+"&t2="+str A3E_Task_Map_Complete+"&t3="+str A3E_Task_ComCenter_Complete+"&t4="+str A3E_Task_Exfil_Complete+"&server="+serverName+"&time="+str round(time)+"&release="+ _release;
//		diag_log(_uri);
//		_html htmlLoad _uri;
//		_emptyDisplay closeDisplay 1;
//	};
};