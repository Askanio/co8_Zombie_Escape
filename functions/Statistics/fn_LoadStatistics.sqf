private _statisticsVersion = profileNamespace getVariable ["Zagor_Statistics_Version", -1]; 
private _statistics = profileNamespace getVariable ["Zagor_Statistics", []]; 


private _statisticText = [_statistics] call Zagor_fnc_parseStatistics;

_statisticText remoteExec ["Zagor_fnc_WriteStatisticsToBriefing", 0, true]; 