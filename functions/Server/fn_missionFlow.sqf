private ["_trigger"];

zagor_var_Escape_AllPlayersDead = false;
zagor_var_Escape_SearchLeader_civilianReporting = false;
zagor_var_Escape_MissionComplete = false;
zagor_var_Escape_MissionFailed_LeftBehind = false;
	
if(isServer) then {


	//Win mission server
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [3, 3, 3, true];
	_trigger setTriggerStatements["zagor_var_Escape_MissionComplete && !zagor_var_Escape_SearchLeader_civilianReporting && !zagor_var_Escape_AllPlayersDead", """end2"" call Zagor_fnc_endMissionServer;", ""];
	
	
	//Mission win (but failed by killing civilians)
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [3, 3, 3, true];
	_trigger setTriggerStatements["zagor_var_Escape_MissionComplete && zagor_var_Escape_SearchLeader_civilianReporting && !zagor_var_Escape_AllPlayersDead", """end4"" call Zagor_fnc_endMissionServer;", ""];
	
	//Mission failed by MIA
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [3, 3, 3, true];
	_trigger setTriggerStatements["zagor_var_Escape_MissionFailed_LeftBehind && !zagor_var_Escape_AllPlayersDead", """end3"" call Zagor_fnc_endMissionServer;", ""];

	//Mission failed
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [2, 2, 2, true];
	_trigger setTriggerStatements["zagor_var_Escape_AllPlayersDead", """end1"" call Zagor_fnc_endMissionServer;", ""];
	
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [0, 0, 0, false];
	Zagor_fnc_InlineEverybodyUnconscious = {
		private _return = 	(
								((([] call Zagor_fnc_GetPlayers) findIf {!(_x getVariable ["AT_Revive_isUnconscious",false]);}) == -1) 
							OR 	((([] call Zagor_fnc_GetPlayers) findIf {!(_x getVariable ["ACE_Revive_isUnconscious",false]);}) == -1)
							);
		_return;
	
	};
	_trigger setTriggerStatements["Zagor_EscapeHasStarted && ([] call Zagor_fnc_InlineEverybodyUnconscious)", "missionNamespace setvariable [""zagor_var_Escape_AllPlayersDead"",true,true];[] spawn Zagor_FNC_FailTasks;", ""];
	
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [0, 0, 0, false];
	_trigger setTriggerStatements["Zagor_EscapeHasStarted && ({""ItemMap"" in (assignedItems _x)} count playableunits)>0", "Zagor_Task_Map_Complete = true; publicvariable ""Zagor_Task_Map_Complete"";", ""];
};
