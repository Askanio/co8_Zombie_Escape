params["_time","_weatherParamRain"];

switch _weatherParamRain do {
    //Let's the engine decide
   // case 0: {};  leaving this commented out for testing purposes
    //No Rain
    case 1: {
		_time setrain 0;
		999999 setrain 0; //quirk of the engine, if "manual override" in the eden editor is not selected when overcast is high enough rain is all but certain.  setting immediate no rain and then a ridiculously long no rain ensures the engine won't override first immediate no rain command.  doing it this way allows the engine to take over on other settings where there can be rain
	};
    //10% Rain
    case 2: {
		_time setRain random [0.05,0.1,0.15];
	};
	//20% Rain
	case 3: {
		_time setRain random [0.15,0.2,0.25];
	};
	//30% Rain
	case 4: {
		_time setRain random [0.25,0.3,0.35];
	};
	//40% Rain
	case 5: {
		_time setRain random [0.35,0.4,0.45];
	};
	//50% Rain
	case 6: {
        _time setRain random [0.45,0.5,0.55];
    };
	//60% Rain
	case 7: {
        _time setRain random [0.55,0.6,0.65];
    };
	//70% Rain
	case 8: {
        _time setRain random [0.65,0.7,0.75];
    };
	//80% Rain
	case 9: {
        _time setRain random [0.75,0.8,0.85];
    };
	//90 % Rain
	case 10: {
        _time setRain random [0.85,0.90,0.95];
    };
	//100% Rain
	case 11: {
        _time setRain 1;
    };
};
