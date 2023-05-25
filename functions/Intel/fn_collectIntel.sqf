params ["_unit", "_container"];
private _intelItems = missionnamespace getvariable ["Zagor_IntelItems",["Files","FileTopSecret","FilesSecret","FlashDisk","DocumentsSecret","Wallet_ID","FileNetworkStructure","MobilePhone","SmartPhone"]];
if(Zagor_Param_UseIntel==1) then {
	private _intels = magazines _unit select {_x in _intelItems};

	[count _intels] remoteExec ["Zagor_fnc_RevealPOI", 2];
	{
		_unit removeMagazine _x;
	} foreach _intels;
};