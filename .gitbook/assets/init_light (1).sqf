_Nombre_de_r=0;_i=1;while {(not(isNil ("light_r_" + str _i)))} do {_i=_i+1;};if (_i>1) then{_Nombre_de_r=_i-1;};
for "_i" from 1 to _Nombre_de_r do {
	_support=call compile ("light_r_" + str _i);
	_light="#lightpoint" createVehicle [0,0,0];
	_light setLightBrightness (1);
	_light setLightAmbient [1,0,0];
	_light setLightColor [1,0,0];
	_light lightAttachObject [_support, [0,0,1]];
};

_Nombre_de_v=0;_i=1;while {(not(isNil ("light_v_" + str _i)))} do {_i=_i+1;};if (_i>1) then{_Nombre_de_v=_i-1;};
for "_i" from 1 to _Nombre_de_v do {
	_support=call compile ("light_v_" + str _i);
	_light="#lightpoint" createVehicle [0,0,0];
	_light setLightBrightness (1);
	_light setLightAmbient [0,1,0];
	_light setLightColor [0,1,0];
	_light lightAttachObject [_support, [0,0,1]];
};

_Nombre_de_b=0;_i=1;while {(not(isNil ("light_b_" + str _i)))} do {_i=_i+1;};if (_i>1) then{_Nombre_de_b=_i-1;};
for "_i" from 1 to _Nombre_de_b do {
	_support=call compile ("light_b_" + str _i);
	_light="#lightpoint" createVehicle [0,0,0];
	_light setLightBrightness (1);
	_light setLightAmbient [0,0,1];
	_light setLightColor [0,0,1];
	_light lightAttachObject [_support, [0,0,1]];
};

_Nombre_de_l=0;_i=1;while {(not(isNil ("light_l_" + str _i)))} do {_i=_i+1;};if (_i>1) then{_Nombre_de_l=_i-1;};
for "_i" from 1 to _Nombre_de_l do {
	_support=call compile ("light_l_" + str _i);
	_light="#lightpoint" createVehicle [0,0,0];
	_light setLightBrightness (1);
	_light setLightAmbient [1,1,1];
	_light setLightColor [1,1,1];
	_light lightAttachObject [_support, [0,0,1]];
};