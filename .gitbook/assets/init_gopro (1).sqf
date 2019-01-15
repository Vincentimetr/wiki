_Nombre_de_camera=0;
_Nombre_de_policier=0;
_Nombre_de_ecran=0;

_i=1;while {(not(isNil ("camera_" + str _i)))} do {_i=_i+1;};
if (_i>1) then{_Nombre_de_camera=_i-1;};

_i=1;while {(not(isNil ("cop_" + str _i)))} do {_i=_i+1;};_Nombre_de_policier=_i;
if (_i>1) then{_Nombre_de_policier=_i-1;};

_i=1;while {(not(isNil ("monitor_" + str _i)))} do {_i=_i+1;};_Nombre_de_ecran=_i;
if (_i>1) then{_Nombre_de_ecran=_i-1;};

fn_Gopro ={
	_Nombre_de_camera=_this select 0;
	_Nombre_de_policier=_this select 1;
	_Nombre_de_ecran=_this select 2;
	
	_tableau_str_camera=[];
	_tableau_str_policier=[];

	_tableau_str_ecran=[];
	
	for "_i" from 1 to _Nombre_de_camera do {_tableau_str_camera=_tableau_str_camera + [("camera_"+ str _i)];};
	for "_i" from 1 to _Nombre_de_policier do {_tableau_str_policier=_tableau_str_policier + [("cop_"+ str _i)];};

	for "_i" from 1 to _Nombre_de_ecran do {_tableau_str_ecran=_tableau_str_ecran + [("monitor_"+ str _i)];};

	_tableau_ecran=[];

	{_tableau_ecran=_tableau_ecran+[call compile _x];} forEach _tableau_str_ecran;

	for "_i" from 1 to (_Nombre_de_ecran) do {
		null = [[((_tableau_ecran) select _i-1)], (_tableau_str_policier + _tableau_str_camera) ]execVM "Scripts\Gopro\Traitement_gopro.sqf";
	};
};

[_Nombre_de_camera,_Nombre_de_policier,_Nombre_de_ecran] call fn_Gopro;