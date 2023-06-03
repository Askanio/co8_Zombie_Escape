params["_weatherParamWind"];

switch _weatherParamWind do {
    //Let's the engine decide
    //case 0: {}; leaving this commented out for testing purposes
    //No Wind
    case 1: {
		setwind [0,0,true];
	};
	//Lv 1 Wind
	case 2: {
		setwind selectrandom 
		[[random [0,1,2], random 2, true],
		[random 2, random [0,1,2], true],
		
		[random [0,-1,-2], random -2, true],
		[random -2, random [0,-1,-2], true],
		
		[random [0,1,2], random -2, true],
		[random -2, random [0,1,2], true],
		
		[random [0,-1,-2], random 2, true],
		[random 2, random [0,-1,-2], true]];
	};
	//Lvl 2 Wind
	case 3: {
		setwind selectrandom 
		[[random [1,2,3], random 3, true],
		[random 3, random [1,2,3], true],
		
		[random [-1,-2,-3], random -3, true],
		[random -3, random [-1,-2,-3], true],
		
		[random [1,2,3], random -3, true],
		[random -3, random [1,2,3], true],
		
		[random [-1,-2,-3], random 3, true],
		[random 3, random [-1,-2,-3], true]];
	};
	//Lvl 3 Wind (Start to see the effects on smoke around here)
	case 4: {
		setwind selectrandom 
		[[random [2,3,4], random 4, true],
		[random 4, random [2,3,4], true],
		
		[random [-2,-3,-4], random -4, true],
		[random -4, random [-2,-3,-4], true],
		
		[random [2,3,4], random -4, true],
		[random -4, random [2,3,4], true],
		
		[random [-2,-3,-4], random 4, true],
		[random 4, random [-2,-3,-4], true]];
	};	
	//Lvl 4 Wind 
	case 5: {
		setwind selectrandom 
		[[random [3,4,5], random 5, true],
		[random 5, random [3,4,5], true],
		
		[random [-3,-4,-5], random -5, true],
		[random -5, random [-3,-4,-5], true],
		
		[random [3,4,5], random -5, true],
		[random -5, random [3,4,5], true],
		
		[random [-3,-4,-5], random 5, true],
		[random 5, random [-3,-4,-5], true]];
	};
	//Lvl 5 Wind (Smoke grenades are less effective)
	case 6: {
		setwind selectrandom 
		[[random [4,5,6], random 6, true],
		[random 6, random [4,5,6], true],
		
		[random [-4,-5,-6], random -6, true],
		[random -6, random [-4,-5,-6], true],
		
		[random [4,5,6], random -6, true],
		[random -6, random [4,5,6], true],
		
		[random [-4,-5,-6], random 6, true],
		[random 6, random [-4,-5,-6], true]];
	};
	//Lvl 6 Wind
	case 7: {
		setwind selectrandom 
		[[random [5,6,7], random 7, true],
		[random 7, random [5,6,7], true],
		
		[random [-5,-6,-7], random -7, true],
		[random -7, random [-5,-6,-7], true],
		
		[random [5,6,7], random -7, true],
		[random -7, random [5,6,7], true],
		
		[random [-5,-6,-7], random 7, true],
		[random 7, random [-5,-6,-7], true]];
	};
	//Lvl 7 Wind (Smoke Grenades are useless at this point)
	case 8: {
		setwind selectrandom 
		[[random [6,7,8], random 8, true],
		[random 8, random [6,7,8], true],
		
		[random [-6,-7,-8], random -8, true],
		[random -8, random [-6,-7,-8], true],
		
		[random [6,7,8], random -8, true],
		[random -8, random [6,7,8], true],
		
		[random [-6,-7,-8], random 8, true],
		[random 8, random [-6,-7,-8], true]];
	};
	//Lvl 8 Wind
	case 9: {
		setwind selectrandom 
		[[random [7,8,9], random 9, true],
		[random 9, random [7,8,9], true],
		
		[random [-7,-8,-9], random -9, true],
		[random -9, random [-7,-8,-9], true],
		
		[random [7,8,9], random -9, true],
		[random -9, random [7,8,9], true],
		
		[random [-7,-8,-9], random 9, true],
		[random 9, random [-7,-8,-9], true]];
	};
	//Lvl 9 Wind 
	case 10: {
		setwind selectrandom 
		[[random [8,9,10], random 10, true],
		[random 10, random [8,9,10], true],
		
		[random [-8,-9,-10], random -10, true],
		[random -10, random [-8,-9,-10], true],
		
		[random [8,9,10], random -10, true],
		[random -10, random [8,9,10], true],
		
		[random [-8,-9,-10], random 10, true],
		[random 10, random [-8,-9,-10], true]];
	};
	//Lvl 10 Wind (Game wasn't designed for wind at this point.  Doesn't affect performance, but does affect fun)
	case 11: {
		setwind selectrandom 
		[[random [10,15,20], random 20, true],
		[random 20, random [10,15,20], true],
		
		[random [-10,-15,-20], random -20, true],
		[random -20, random [-10,-15,-20], true],
		
		[random [10,15,20], random -20, true],
		[random -20, random [10,15,20], true],
		
		[random [-10,-15,-20], random 20, true],
		[random 20, random [-10,-15,-20], true]];
	}; 
	//Lvl 11 Wind
	case 12: {
		setwind selectrandom 
		[[random [20,40,60], random 60, true],
		[random 60, random [20,40,60], true],
		
		[random [-20,-40,-60], random -60, true],
		[random -60, random [-20,-40,-60], true],
		
		[random [20,40,60], random -60, true],
		[random -60, random [20,40,60], true],
		
		[random [-20,-40,-60], random 60, true],
		[random 60, random [-20,-40,-60], true]];
	}; 
	//Lvl 1337 Wind
	case 13: {
		setwind selectrandom 
		[[random [60,80,100], random 100, true],
		[random 100, random [60,80,100], true],
		
		[random [-60,-80,-100], random -100, true],
		[random -100, random [-60,-80,-100], true],
		
		[random [60,80,100], random -100, true],
		[random -100, random [60,80,100], true],
		
		[random [-60,-80,-100], random 100, true],
		[random 100, random [-60,-80,-100], true]];
	}; 
	//Lvl 9001 Wind (Doesn't get any higher than this)
	case 14: {
		setwind selectrandom 
		[[100, random 100, true],
		[random 100, 100, true],
		
		[-100, random -100, true],
		[random -100, -100, true],
		
		[100, random -100, true],
		[random -100, 100, true],
		
		[-100, random 100, true],
		[random 100, -100, true]];
	}; 
};