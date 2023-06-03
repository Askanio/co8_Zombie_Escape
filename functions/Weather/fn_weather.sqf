params[["_initial",true]];


//Rain
private _weatherParamRain = if (_initial == false || Zagor_Param_WeatherRain isEqualTo -1) then {
    selectrandomweighted [1,10000,2,500,3,500,4,500,5,500,6,500,7,500,8,500,9,500,10,500,11,500]; //[1,40000,2,500,3,500,4,500,5,500,6,500,7,500,8,500,9,500,10,500,11,500];

} else {
    Zagor_Param_WeatherRain
};

//Clouds
private _weatherParamOvercast = if (_initial == false || Zagor_Param_WeatherOvercast isEqualTo -1) then {
	if (_weatherParamRain > 5) then {
		selectrandomweighted [0,0,1,0,2,0,3,0,4,0,5,100,6,200,7,300,8,500,9,800,10,1000]; // for Rain
	} else {
		selectrandomweighted [0,100,1,400,2,800,3,1000,4,1000,5,700,6,600,7,400,8,300,9,200,10,100];
	};
} else {
    Zagor_Param_WeatherOvercast
};

//Fog
private _weatherParamFog = if (_initial == false || Zagor_Param_WeatherFog isEqualTo -1) then {
    selectrandomweighted [0,3000,1,500,2,400,3,300,4,200,5,100,6,90,7,80,8,70,9,60,10,50]; //[0,10000,1,500,2,400,3,300,4,200,5,100,6,90,7,80,8,70,9,60,10,50];

} else {
    Zagor_Param_WeatherFog
};

//Wind
private _weatherParamWind = if (_initial == false || Zagor_Param_WeatherWind isEqualTo -1) then {
    selectrandomweighted [1,100,2,4000,3,2000,4,1000,5,500,6,400,7,300,8,200,9,100,10,50];

} else {
    Zagor_Param_WeatherWind
};


//forceWeatherChange;

if(isNil("Zagor_Param_DynamicWeather")) then {
	Zagor_Param_DynamicWeather = 1;
};
if(isNil("Param_TimeMultiplier")) then {
	Param_TimeMultiplier = 1;
};

private _weatherTransitionTime = 1800;
private _weatherWaitTime = 600;
private _rainDelay = 120; //Delay rainchange
if(_initial) then {
	_weatherTransitionTime = 0;
};
if(Zagor_Param_DynamicWeather == 0) then {
	_weatherWaitTime = 60*60*24*Param_TimeMultiplier;
};

//Transition in _weatherTransitionTime ingame seconds
[_weatherTransitionTime, _weatherParamOvercast] call Zagor_fnc_SetOvercast;
if(abs(rain-((_weatherParamRain-1)/10))<0.2 || _initial) then {
	[_weatherTransitionTime,_weatherParamRain] call Zagor_fnc_SetRain;
} else {
	//Delay rain a bit of rainchange is to heavy. Otherwise rain will start before clouds appear or vice versa
	[_weatherParamRain,_rainDelay/Param_TimeMultiplier,_weatherTransitionTime-(_rainDelay/Param_TimeMultiplier)] spawn {
		systemchat ("Delaying rain by "+str _time + " seconds");
		params["_rain","_time","_change"];
		sleep _time;
		[_change, _rain] call Zagor_fnc_SetRain;
	};
};
[_weatherTransitionTime,_weatherParamFog] call Zagor_fnc_SetFog;
[_weatherParamWind] call Zagor_fnc_SetWind;
//_weatherTransitionTime setlightnings (_currentTemplate select 3);

//systemchat str _currentTemplate;

if(_initial) then {
	skiptime -24;
	skiptime 24;
	forceWeatherChange;
};
//Sleep _weatherTransitionTime ingame seconds
systemchat ("Weatherchange in "+str (_weatherTransitionTime/Param_TimeMultiplier) + " seconds");
sleep (_weatherTransitionTime/Param_TimeMultiplier);

//Keep the weather 10 realtime minutes
[_weatherWaitTime*Param_TimeMultiplier, _weatherParamOvercast] call Zagor_fnc_SetOvercast;
[_weatherWaitTime*Param_TimeMultiplier, _weatherParamRain] call Zagor_fnc_SetRain;
[_weatherWaitTime*Param_TimeMultiplier, _weatherParamFog] call Zagor_fnc_SetFog;
[_weatherParamWind] call Zagor_fnc_SetWind;
//_weatherWaitTime*Param_TimeMultiplier setlightnings (_currentTemplate select 3);

//Keep the weather 10 minutes
systemchat ("Keeping weather for "+str (_weatherWaitTime) + " seconds");
sleep _weatherWaitTime;

if(Zagor_Param_DynamicWeather == 1) then {
	systemchat "Restarting weather script";
	[false] spawn Zagor_fnc_Weather;
} else {
	systemchat "Keeping weather constant";
};





















