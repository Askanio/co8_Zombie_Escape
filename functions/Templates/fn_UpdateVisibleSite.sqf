private _id = _this select 0;
private _hide = _this select 1;

private _objects = Zagor_VAR_SitesPointObjects select _id;
{
	_x hideObject _hide;
} forEach _objects;	
