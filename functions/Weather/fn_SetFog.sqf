params["_time","_weatherParamFog"];

switch _weatherParamFog do {
    //No Fog
    case 0: {
        _time setFog 0;
	};
    //10% Fog
    case 1: {
		_time setFog random [0.05,0.1,0.15];
	};
	//20% Fog
	case 2: {
		_time setFog random [0.15,0.2,0.25];
	};
	//30% Fog
	case 3: {
		_time setFog random [0.25,0.3,0.35];
	};
	//40% Fog
	case 4: {
		_time setFog random [0.35,0.4,0.45];
	};
	//50% Fog
	case 5: {
        _time setFog random [0.45,0.5,0.55];
    };
	//60% Fog
	case 6: {
        _time setFog random [0.55,0.6,0.65];
    };
	//70% Fog
	case 7: {
        _time setFog random [0.65,0.7,0.75];
    };
	//80% Fog
	case 8: {
        _time setFog random [0.75,0.8,0.85];
    };
	//90 % Fog
	case 9: {
        _time setFog random [0.85,0.90,0.95];
    };
	//100% Fog (I can't see a damn thing!)
	case 10: {
        _time setFog 1;
    };
};
