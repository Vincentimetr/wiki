/*
	File:  fn_whiteList.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1.STRING (UID)
	2.OBJECT (player)

	RETURNS:
	NONE

	CALL:
	[STRING,OBJECT] call DB_fnc_whiteList
*/
private _uid = param[0,"",[""]];
private _unit = param[1,objNull,[objNull]];

if(_uid == "" || isNull _unit)exitWith{};
private _query = ["SELECT uid FROM whitelist;",2,true] call DB_fnc_asyncCall;
private _id = _query find [_uid];
diag_log format["%1 %2",_query,_id];
if(_id == -1)then{
	[false] remoteExecCall ["life_fnc_whitelistRes",_unit];
}else{
	[true] remoteExecCall ["life_fnc_whitelistRes",_unit];
};