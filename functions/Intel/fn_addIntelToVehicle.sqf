params["_unit"];
private _intelItems = missionnamespace getvariable ["Zagor_IntelItems",["Files","FileTopSecret","FilesSecret","FlashDisk","DocumentsSecret","Wallet_ID","FileNetworkStructure","MobilePhone","SmartPhone"]];
private _chance = missionnamespace getvariable ["Zagor_Param_IntelChance",20];

if(_chance >= random 100) then {
	private _intAmount = selectRandom [1,1,1,1,2];
	private _item = selectRandom _intelItems;
	_unit addItemCargoGlobal [_item, _intAmount];
};



