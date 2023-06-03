params["_time","_weatherParamOvercast"];

switch _weatherParamOvercast do {
    //Cloudless
    case 0: {
        _time setovercast 0;
	};
    //10% Overcast
    case 1: {
		_time setovercast random [0.05,0.1,0.15];
	};
	//20% Overcast
	case 2: {
		_time setovercast random [0.15,0.2,0.25];
	};
	//30% Overcast
	case 3: {
		_time setovercast random [0.25,0.3,0.35];
	};
	//40% Overcast
	case 4: {
		_time setovercast random [0.35,0.4,0.45];
	};
	//50% Overcast (Mimimum needed for rain to appear)
	case 5: {
        _time setovercast random [0.5,0.525,0.55];
    };
	//60% Overcast
	case 6: {
        _time setovercast random [0.55,0.6,0.65];
    };
	//70% Overcast
	case 7: {
        _time setovercast random [0.65,0.7,0.75];
    };
	//80% Overcast
	case 8: {
        _time setovercast random [0.75,0.8,0.85];
    };
	//90 % Overcast
	case 9: {
        _time setovercast random [0.85,0.90,0.95];
    };
	//100% Overcast
	case 10: {
        _time setovercast 1;
    };
};
