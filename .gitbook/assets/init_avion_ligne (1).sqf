[] spawn {
_periode_apparition=180;
while {true} do {[] spawn {
			_liste_avion=[
				"O_T_VTOL_02_vehicle_F",
				"B_Plane_CAS_01_dynamicLoadout_F",
				"C_Plane_Civil_01_F"];
			_taille_map=30000;
			_type_de_fumee="test_EmptyObjectForSmoke";
			_altitude_apparition=1000;
			_bool=round(random 1); 
			_avion_str=_liste_avion select (random (count (_liste_avion)-1));
			_avion = createVehicle [_avion_str, [0,0,500], [], 0, "FLY"]; 
			if (_bool==0) then {_avion setPos [random _taille_map,0,_altitude_apparition]}; 
			if (_bool==1) then {_avion setPos [0,random _taille_map,_altitude_apparition]}; 
			_pilote= createAgent ["I_G_Survivor_F", [0,0,0], [], 0, "NONE"]; 
			_pilote moveInDriver _avion;
			sleep 0.5;
			_avion setDir (random 90);
			_dir = direction _avion;
			_speed = 100;
			_avion setVelocity [(sin _dir * _speed), (cos _dir * _speed),0];
			[_avion,_pilote,_dir,_taille_map,_type_de_fumee] spawn {_avion=_this select 0;_pilote=_this select 1;_dir=_this select 2;_taille_map=_this select 3;_type_de_fumee=_this select 4;
				_time=time;
				while {alive _pilote && ((time-_time)<300)} do {
					if ((((getpos _avion)  select 0)>_taille_map) || (((getpos _avion) select 1)>_taille_map)) then {
						deletevehicle _avion;
						_pilote setDamage 1;
					};
					
					_smoke=_type_de_fumee;
					
					_smoke_d_1=_smoke createvehicle [0,0,0];
					_smoke_g_1=_smoke createvehicle [0,0,0];
					_smoke_d_2=_smoke createvehicle [0,0,0];
					_smoke_g_2=_smoke createvehicle [0,0,0];
					_smoke_d_3=_smoke createvehicle [0,0,0];
					_smoke_g_3=_smoke createvehicle [0,0,0];
					
					_envergure=20;
					_smoke_d_1 attachTo [_avion,[_envergure * (sin _dir), -_envergure * (cos _dir),0]];
					_smoke_g_1 attachTo [_avion,[-_envergure * (sin _dir), -_envergure * (cos _dir),0]];
					_smoke_d_2 attachTo [_avion,[_envergure * (sin _dir), -_envergure * (cos _dir),0]];
					_smoke_g_2 attachTo [_avion,[-_envergure * (sin _dir), -_envergure * (cos _dir),0]];
					_smoke_d_3 attachTo [_avion,[_envergure * (sin _dir), -_envergure * (cos _dir),0]];
					_smoke_g_3 attachTo [_avion,[-_envergure * (sin _dir), -_envergure * (cos _dir),0]];
					
					sleep 60;
					
					if not(isNil("_smoke_d_1")) then {deletevehicle _smoke_d_1;};
					if not(isNil("_smoke_g_1")) then {deletevehicle _smoke_g_1;};
					if not(isNil("_smoke_d_2")) then {deletevehicle _smoke_d_2;};
					if not(isNil("_smoke_g_2")) then {deletevehicle _smoke_g_2;};
					if not(isNil("_smoke_d_3")) then {deletevehicle _smoke_d_3;};
					if not(isNil("_smoke_g_3")) then {deletevehicle _smoke_g_3;};
				};
				if ((time-_time)>300 || !alive _pilote) then {
					if not(isNil("_smoke_d_1")) then {deletevehicle _smoke_d_1;};
					if not(isNil("_smoke_g_1")) then {deletevehicle _smoke_g_1;};
					if not(isNil("_smoke_d_2")) then {deletevehicle _smoke_d_2;};
					if not(isNil("_smoke_g_2")) then {deletevehicle _smoke_g_2;};
					if not(isNil("_smoke_d_3")) then {deletevehicle _smoke_d_3;};
					if not(isNil("_smoke_g_3")) then {deletevehicle _smoke_g_3;};
				};
			};
		}; 
		sleep _periode_apparition; 
	};
};