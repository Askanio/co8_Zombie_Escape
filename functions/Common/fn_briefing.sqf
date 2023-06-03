//General mission flow triggerActivated
private "_trigger";

//waituntil{sleep 0.1;!isNil("A3E_PrisonLoudspeakerObject")};
//_trigger = createTrigger["EmptyDetector", [0,0,0]];
//_trigger setTriggerInterval 2;
//_trigger setTriggerArea[25, 25, 0, false];
//_trigger setTriggerActivation["NONE", "PRESENT", true];
//_trigger setTriggerStatements["A3E_SoundPrisonAlarm", "thisTrigger setposASL ((getposASL A3E_PrisonLoudspeakerObject) vectorAdd [0,0,4]);", ""];
//_trigger setSoundEffect ["$NONE$", "", "", "AlarmSfx"];
	
	//All players are unconscious

//Exit HSC cam because missions is ending
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["!isDedicated && zagor_var_Escape_AllPlayersDead || zagor_var_Escape_MissionComplete", "[] spawn ATHSC_fnc_exit;", ""];

	//Skip date so the played hours match		
	//expCond="zagor_var_Escape_AllPlayersDead || zagor_var_Escape_MissionComplete;";
	//expActiv="setDate [date select 0, date select 1, date select 2, (date select 3) - zagor_var_Escape_hoursSkipped, date select 4];";


// Task find Map
Zagor_Task_Map= player createSimpleTask ["Find a map"];
Zagor_Task_Map setSimpleTaskDescription [
   "Find a map of the enemy territory. You can find a map in the inventory of some of the enemy patrols. Not every enemy carries a map. On the map you may find information about enemy ammodepots, comcenters and more.",
   "Find a map",
   "Find a map"
];
Zagor_Task_Map setTaskState "CREATED";


if(isNil("Zagor_Task_Map_Complete")) then {
	missionnamespace setvariable ["Zagor_Task_Map_Complete",false, true];
};
if(isNil("Zagor_Task_Map_Failed")) then {
	missionnamespace setvariable ["Zagor_Task_Map_Failed",false, true];
};

_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["Zagor_Task_Map_Complete", "Zagor_Task_Map setTaskState ""Succeeded"";", ""];
	
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["Zagor_Task_Map_Failed", "Zagor_Task_Map setTaskState ""Failed"";", ""];


// Locate  comcenter
private _text =  "Locate an enemy communication center. You may need to gather information from enemy patrols or check points of interest on the map to reveal the location of a comcenter.";

Zagor_Task_LocateComcenter= player createSimpleTask ["Locate enemy communication center"];
Zagor_Task_LocateComcenter setSimpleTaskDescription [
   _text,
   "Locate enemy communication center",
   "Locate enemy communication center"
];
Zagor_Task_LocateComcenter setTaskState "CREATED";


if(isNil("Zagor_Task_LocateComcenter_Complete")) then {
	missionnamespace setvariable ["Zagor_Task_LocateComcenter_Complete",false, true];
};
if(isNil("Zagor_Task_LocateComcenter_Failed")) then {

	missionnamespace setvariable ["Zagor_Task_LocateComcenter_Failed",false, true];
};

_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["Zagor_Task_LocateComcenter_Complete", "Zagor_Task_LocateComcenter setTaskState ""Succeeded"";", ""];
	
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["Zagor_Task_LocateComcenter_Failed", "Zagor_Task_LocateComcenter setTaskState ""Failed"";", ""];

// Task Hack Commcenter
Zagor_Task_ComCenter = player createSimpleTask ["Hack Communication Center"];
Zagor_Task_ComCenter setSimpleTaskDescription [
   "Infiltrate an enemy communication center, hack the com-terminal (box in the middle of the comcenter) and request extraction from our HQ.",
   "Hack Communication Center",
   "Hack Communication Center"
];
Zagor_Task_ComCenter setTaskState "CREATED";


if(isNil("Zagor_Task_ComCenter_Complete")) then {
	missionnamespace setvariable ["Zagor_Task_ComCenter_Complete",false, true];
};
if(isNil("Zagor_Task_ComCenter_Failed")) then {
	missionnamespace setvariable ["Zagor_Task_ComCenter_Failed",false, true];
};

_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["Zagor_Task_ComCenter_Complete", "Zagor_Task_ComCenter setTaskState ""Succeeded"";", ""];
	
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["Zagor_Task_ComCenter_Failed", "Zagor_Task_ComCenter setTaskState ""Failed"";", ""];



// Task Exfiltrate
Zagor_Task_Exfil = player createSimpleTask ["Exfiltrate"];
Zagor_Task_Exfil setSimpleTaskDescription [
   "After you managed to contact our HQ reach the position marked on the map. When you have secured the landing zone, throw a smoke grenade or shoot a flare and wait for the helicopters to arrive. Board the choppers when landed and escape the enemy territory.",
   "Exfiltrate",
   "Exfiltrate"
];
Zagor_Task_Exfil setTaskState "CREATED";

if(isNil("Zagor_Task_Exfil_Complete")) then {
	missionnamespace setvariable ["Zagor_Task_Exfil_Complete",false, true];
};
if(isNil("Zagor_Task_Exfil_Failed")) then {
	missionnamespace setvariable ["Zagor_Task_Exfil_Failed",false, true];
};

_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["Zagor_Task_Exfil_Complete", "Zagor_Task_Exfil setTaskState ""Succeeded"";", ""];
	
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["Zagor_Task_Exfil_Failed", "Zagor_Task_Exfil setTaskState ""Failed"";", ""];


Zagor_FNC_FailTasks = {
	if(!Zagor_Task_Map_Complete) then {
		Zagor_Task_Map_Failed = true;
	};
	if(!Zagor_Task_ComCenter_Complete) then {
		Zagor_Task_ComCenter_Failed = true;
	};
	if(!Zagor_Task_Exfil_Complete) then {
		Zagor_Task_Exfil_Failed = true;
	};

};

if(isNil("Zagor_WorldName")) then {
	Zagor_WorldName = worldName;
};

player createDiaryRecord ["Diary", ["Help and Feedback", "Help us improve this mission by reporting bugs. Visit our Github bugtracker at https://github.com/Askanio/co8_Zombie_Escape. There you can also download the latest, unreleased development versions of co8 Zombie Escape.<br />"]]; 
//player createDiaryRecord ["Diary", ["Credits", ""]]; 
player createDiaryRecord ["Diary", ["Hints (with spoilers)", "Your helicopter was caught in a thunderstorm and was damaged. Due to electronic damage, he lost his course and landed in an infected zone.<br /><br />
It is necessary to find spare parts and repair the helicopter. It will not be possible to get out on the ground, because. perimeter is mined.<br /><br />
Electronic components can be found at the epidemic control headquarters. If your helicopter gets badly damaged or you can't find spare parts, you can try to look for another way to get out of the infected zone, but other ways can be more difficult. Collect different intel to find headquarters.<br /><br />"]];
player createDiaryRecord ["Diary", ["Mission *important*", "<br /><br />"]];
player createDiaryRecord ["Diary", ["Situation", "Your helicopter was caught in a thunderstorm and was damaged. Due to electronic damage, he lost his course and landed in an infected zone."]];
player createDiaryRecord ["Diary", ["Intelligence Revealed", ""]];
player createDiaryRecord ["Diary", ["Background", "Electronic components can be found at the epidemic control headquarters. If your helicopter gets badly damaged or you can't find spare parts, you can try to look for another way to get out of the infected zone, but other ways can be more difficult."]];
player createDiaryRecord ["Diary", ["Global Background", ""]];
        

