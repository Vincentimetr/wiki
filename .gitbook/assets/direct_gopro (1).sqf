private ["_cameraCount","_debug","_monitor"];
_monitor = (_this select 0);
_units = (_this select 1);
removeAllActions _monitor;
_debug = false;
sleep 0.1;
_cameraCount = server getvariable "CAMCOUNT";	

if (isnil "_cameraCount") then {
	_cameraCount = 0;
	server setvariable ["CAMCOUNT",_cameraCount,true];
};

fnc_RENDER = {

	_monitor=(_this select 0);
	_name=(_this select 1);
	_cam=(_this select 2);
	_visionMode=(_this select 3);
	
	_cam camCommit 1;
	_cam cameraEffect ["INTERNAL", "BACK",_name];
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	if (_visionMode==0)then { //PAS DE VISION SATTELLITE
		server setVariable["cam",_cam,true]; //OBJECT CAMERA
		server setVariable["name",_name,true]; //ID DE LA CAMERA
		_CAM_LIST=server getVariable["CAM_LIST",[]];
		_NAME_LIST=server getVariable["NAME_LIST",[]];
		if not(_cam in _CAM_LIST) then {
			_CAM_LIST=_CAM_LIST + [_cam];
			_NAME_LIST=_NAME_LIST + [_name];
			server setVariable["CAM_LIST",_CAM_LIST,true];
			server setVariable["NAME_LIST",_NAME_LIST,true];
		};
	};
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	_name setPiPEffect [_visionMode, 1, 0.8, 1, 0.1, [0.3, 0.3, 0.3, -0.1], [1.0, 0.0, 1.0, 1.0], [0, 0, 0, 0]];
	_monitor setObjectTextureglobal [0,(format ["#(argb,256,256,1)r2t(%1,1.0)",_name])];
};

fnc_RESET = {
	private ["_conCurrentCams"];
	_cam=(_this select 0);
	_debug=(_this select 1);
	_conCurrentCams=server getvariable "CONCURRENTCAMS";
	if (isnil "_conCurrentCams") then {_conCurrentCams = [];server setvariable ["CONCURRENTCAMS",_conCurrentCams,true];};		
	_conCurrentCams=_conCurrentCams + [_cam];server setvariable ["CONCURRENTCAMS",_conCurrentCams,true];	
	if (_debug) then {
		_sidechatHint = format["Concurrent cam Count: %1",count _conCurrentCams];
		PAPABEAR sideChat _sidechatHint;
		GlobalSideChat = _sidechatHint; 
		publicVariable "GlobalSideChat";
	};				
	if (count _conCurrentCams > 4) then {
		{
			_x cameraEffect ["TERMINATE", "BACK"];
			camDestroy _x;
			_monitor setObjectTextureglobal [0,"Scripts\Gopro\standby.jpg"];
		}foreach _conCurrentCams;
		
		_conCurrentCams=[];server setvariable ["CONCURRENTCAMS",_conCurrentCams,true];
						
		if (_debug) then {
			_sidechatHint = format["Deleted CONCURRENTCAMS: %1",count _conCurrentCams];
			PAPABEAR sideChat _sidechatHint;
			GlobalSideChat = _sidechatHint; 
			publicVariable "GlobalSideChat";
		};
	};
};

fnc_PROCESS_LIVE = {
	private ["_name","_cam","_debug","_class","_newClass","_arguments"];
	_monitor=(_this select 0);
	_arguments=(_this select 3);
	_unit=_arguments select 0;
	_debug=_arguments select 1;
	_monitor setObjectTextureglobal [0,"Scripts\Gopro\standby.jpg"];
	_cam=_unit getVariable "LIVECAM";
	
	SLEEP 0.5; //TEMPS DE CHARGEMENT GOPRO
	
	if (isnil "_cam")then {
		_cam = "camera" camCreate getpos _unit;
		_unit setvariable ["LIVECAM",_cam,true];			
		0=[_cam,_debug] call fnc_RESET;
	}
	else{
		if (isnull _cam)then {
			_cam = "camera" camCreate getpos _unit;	
			_unit setvariable ["LIVECAM",_cam,true];			
			0=[_cam,_debug] call fnc_RESET;
		};
	};

	_class = typeOf (vehicle _unit);

	switch (_class) do {
		case "Land_HandyCam_F": {
			_cam attachto [_unit,[0,0,0], "neck"];
			switch (_unit) do {
				case camera_1: {_cam setDir (getDir Camera_1)-180;};
				case camera_2: {_cam setDir (getDir Camera_2)-180;};
				case camera_3: {_cam setDir (getDir Camera_3)-180;};
				case camera_4: {_cam setDir (getDir Camera_4)-180;};
				case camera_5: {_cam setDir (getDir Camera_5)-180;};
				case camera_6: {_cam setDir (getDir Camera_6)-180;};
				case camera_7: {_cam setDir (getDir Camera_7)-180;};
				case camera_8: {_cam setDir (getDir Camera_8)-180;};
				case camera_9: {_cam setDir (getDir Camera_9)-180;};
				case camera_10: {_cam setDir (getDir Camera_10)-180;};
				case camera_11: {_cam setDir (getDir Camera_11)-180;};
				case camera_12: {_cam setDir (getDir Camera_12)-180;};
				case camera_13: {_cam setDir (getDir Camera_13)-180;};
				case camera_14: {_cam setDir (getDir Camera_14)-180;};
				case camera_15: {_cam setDir (getDir Camera_15)-180;};
				case camera_16: {_cam setDir (getDir Camera_16)-180;};
				case camera_17: {_cam setDir (getDir Camera_17)-180;};
				case camera_18: {_cam setDir (getDir Camera_18)-180;};
				case camera_19: {_cam setDir (getDir Camera_19)-180;};
				case camera_20: {_cam setDir (getDir Camera_20)-180;};
				case camera_21: {_cam setDir (getDir Camera_21)-180;};
				case camera_22: {_cam setDir (getDir Camera_22)-180;};
				case camera_23: {_cam setDir (getDir Camera_23)-180;};
				case camera_24: {_cam setDir (getDir Camera_24)-180;};
				case camera_25: {_cam setDir (getDir Camera_25)-180;};
				case camera_26: {_cam setDir (getDir Camera_26)-180;};
				case camera_27: {_cam setDir (getDir Camera_27)-180;};
				case camera_28: {_cam setDir (getDir Camera_28)-180;};
				case camera_29: {_cam setDir (getDir Camera_29)-180;};
				case camera_30: {_cam setDir (getDir Camera_30)-180;};
				case camera_31: {_cam setDir (getDir Camera_31)-180;};
				case camera_32: {_cam setDir (getDir Camera_32)-180;};
				case camera_33: {_cam setDir (getDir Camera_33)-180;};
				case camera_34: {_cam setDir (getDir Camera_34)-180;};
				case camera_35: {_cam setDir (getDir Camera_35)-180;};
				case camera_36: {_cam setDir (getDir Camera_36)-180;};
				case camera_37: {_cam setDir (getDir Camera_37)-180;};
				case camera_38: {_cam setDir (getDir Camera_38)-180;};
				case camera_39: {_cam setDir (getDir Camera_39)-180;};
				case camera_40: {_cam setDir (getDir Camera_40)-180;};
			};
		};
		case "B_Heli_Transport_01_F": {_cam attachto [(vehicle _unit),[-0.3,5.5,-0.3], "neck"];};
		case "B_Heli_Transport_01_camo_F": {_cam attachto [(vehicle _unit),[-0.3,5.5,-0.3], "neck"];};
		case "B_Heli_Light_01_Armed_F": {_cam attachto [(vehicle _unit),[-0.3,1.7,0.5], "neck"];};
		case "B_Heli_Light_01_F": {_cam attachto [(vehicle _unit),[-0.3,1.7,0.5], "neck"];};
		case "B_Heli_Attack_01_F": {_cam attachto [(vehicle _unit),[-0.1,1.7,0.5], "neck"];};

		case "B_Truck_01_mover_F": {_cam attachto [(vehicle _unit),[-0.3,3.2,0.5], "neck"];};
		case "B_Truck_01_box_F": {_cam attachto [(vehicle _unit),[-0.3,3.2,0.5], "neck"];};
		case "B_Truck_01_transport_F": {_cam attachto [(vehicle _unit),[-0.3,3.2,0.5], "neck"];};
		case "B_Truck_01_covered_F": {_cam attachto [(vehicle _unit),[-0.3,3.8,0], "neck"];};

		case "B_MRAP_01_F": {_cam attachto [(vehicle _unit),[-0.4,-1.3,0.2], "neck"];};
		case "B_MRAP_01_gmg_F": {_cam attachto [(vehicle _unit),[-0.3,3.2,0.5], "neck"];};
		case "B_MRAP_01_hmg_F": {_cam attachto [(vehicle _unit),[-0.3,3.2,0.5], "neck"];};

		case "B_Quadbike_01_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};

		case "B_APC_Wheeled_01_cannon_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "B_APC_Tracked_01_AA_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "B_APC_Tracked_01_rcws_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "B_MBT_01_cannon_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "B_MBT_01_arty_F": {_cam attachto [(vehicle _unit),[0,0.15,-0.3], "neck"];};
		case "B_MBT_01_mlrs_F": {_cam attachto [(vehicle _unit),[0,0.15,0.4], "neck"];};
		case "B_Boat_Transport_01_F": {_cam attachto [(vehicle _unit),[0.3,0.15,0], "neck"];};
		case "B_Lifeboat": {_cam attachto [(vehicle _unit),[0,0.15,-0.3], "neck"];};
		case "B_Boat_Armed_01_minigun_F": {_cam attachto [(vehicle _unit),[-0.5,0.15,0.4], "neck"];};

		case "B_SDV_01_F": {_cam attachto [(vehicle _unit),[0.3,0.6,-0.8], "neck"];};

		case "B_APC_Tracked_01_CRV_F": {_cam attachto [(vehicle _unit),[0.3,0.6,-0.8], "neck"];};
		case "B_Truck_01_ammo_F": {_cam attachto [(vehicle _unit),[-0.3,3.2,0.5], "neck"];};
		case "B_Truck_01_fuel_F": {_cam attachto [(vehicle _unit),[-0.3,3.2,0.5], "neck"];};
		case "B_Truck_01_medical_F": {_cam attachto [(vehicle _unit),[-0.3,3.2,0.5], "neck"];};
		case "B_Truck_01_Repair_F": {_cam attachto [(vehicle _unit),[-0.3,3.2,0.5], "neck"];};

		case "I_Plane_Fighter_03_AA_F": {_cam attachto [(vehicle _unit),[0,2.7,-0.3], "neck"];};
		case "I_Plane_Fighter_03_CAS_F": {_cam attachto [(vehicle _unit),[0,2.7,-0.3], "neck"];};
		case "I_Heli_Transport_02_F": {_cam attachto [(vehicle _unit),[-0.5,6,-1], "neck"];};							
		case "I_Heli_light_03_F": {_cam attachto [(vehicle _unit),[-0.3,4,0.3], "neck"];};
		case "I_Heli_light_03_unarmed_F": {_cam attachto [(vehicle _unit),[-0.3,4,0.1], "neck"];};

		case "I_APC_Wheeled_03_cannon_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "I_APC_tracked_03_cannon_F": {_cam attachto [(vehicle _unit),[0,1,0], "neck"];};
		case "I_MBT_03_cannon_F": {_cam attachto [(vehicle _unit),[-0.7,0.15,0], "neck"];};	

		case "I_Quadbike_01_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "I_MRAP_03_F": {_cam attachto [(vehicle _unit),[0,1,0], "neck"];};
		case "I_MRAP_03_gmg_F": {_cam attachto [(vehicle _unit),[0,1,0], "neck"];};
		case "I_MRAP_03_hmg_F": {_cam attachto [(vehicle _unit),[0,1,0], "neck"];};
		case "I_Truck_02_transport_F": {_cam attachto [(vehicle _unit),[-0.5,3,0], "neck"];};
		case "I_Truck_02_covered_F": {_cam attachto [(vehicle _unit),[-0.5,3,0], "neck"];};

		case "I_Boat_Armed_01_minigun_F": {_cam attachto [(vehicle _unit),[-0.5,0.15,0.4], "neck"];};
		case "I_Boat_Transport_01_F": {_cam attachto [(vehicle _unit),[0,-0.4,0], "neck"];};

		case "I_SDV_01_F": {_cam attachto [(vehicle _unit),[0.3,0.6,-0.8], "neck"];};

		case "I_Truck_02_ammo_F": {_cam attachto [(vehicle _unit),[-0.5,3,0], "neck"];};
		case "I_Truck_02_fuel_F": {_cam attachto [(vehicle _unit),[-0.5,3,0], "neck"];};
		case "I_Truck_02_medical_F": {_cam attachto [(vehicle _unit),[-0.5,3,0], "neck"];};
		case "I_Truck_02_box_F": {_cam attachto [(vehicle _unit),[-0.5,3,0], "neck"];};

		case "O_Heli_Attack_02_F": {_cam attachto [(vehicle _unit),[0,3,0.5], "neck"];};							
		case "O_Heli_Attack_02_black_F": {_cam attachto [(vehicle _unit),[0,3,0.5], "neck"];};
		case "O_Heli_Light_02_F": {_cam attachto [(vehicle _unit),[-0.4,3.3,-0.2], "neck"];};
		case "O_Heli_Light_02_unarmed_F": {_cam attachto [(vehicle _unit),[-0.4,3.3,-0.2], "neck"];};

		case "O_MBT_02_arty_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "O_APC_Tracked_02_cannon_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "O_APC_Wheeled_02_rcws_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "O_MBT_02_cannon_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "O_APC_Tracked_02_AA_F": {_cam attachto [(vehicle _unit),[0,0.15,-0.3], "neck"];};

		case "O_MRAP_02_F": {_cam attachto [(vehicle _unit),[0,-0.5,0], "neck"];};
		case "O_MRAP_02_gmg_F": {_cam attachto [(vehicle _unit),[0,-0.5,-0.3], "neck"];};
		case "O_MRAP_02_hmg_F": {_cam attachto [(vehicle _unit),[0,-0.5,-0.3], "neck"];};
		case "O_Quadbike_01_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "O_Truck_02_transport_F": {_cam attachto [(vehicle _unit),[-0.5,3,0], "neck"];};
		case "O_Truck_02_covered_F": {_cam attachto [(vehicle _unit),[-0.5,3,0], "neck"];};

		case "O_Boat_Transport_01_F": {_cam attachto [(vehicle _unit),[0.3,0.15,0], "neck"];};
		case "O_Lifeboat": {_cam attachto [(vehicle _unit),[0,0.15,-0.3], "neck"];};
		case "O_Boat_Armed_01_minigun_F": {_cam attachto [(vehicle _unit),[-0.5,0.15,0.4], "neck"];};

		case "O_SDV_01_F": {_cam attachto [(vehicle _unit),[0.3,0.6,-0.8], "neck"];};

		case "O_Truck_02_Ammo_F": {_cam attachto [(vehicle _unit),[-0.5,1.7,0], "neck"];};
		case "O_Truck_02_fuel_F": {_cam attachto [(vehicle _unit),[-0.5,1.7,0], "neck"];};
		case "O_Truck_02_medical_F": {_cam attachto [(vehicle _unit),[-0.5,3,0], "neck"];};
		case "O_Truck_02_box_F": {_cam attachto [(vehicle _unit),[-0.5,1.7,0], "neck"];};

		case "C_Hatchback_01_F": {_cam attachto [(vehicle _unit),[-0.3,0.15,0], "neck"];};
		case "C_Hatchback_01_sport_F": {_cam attachto [(vehicle _unit),[-0.3,0.15,0], "neck"];};
		case "C_Offroad_01_F": {_cam attachto [(vehicle _unit),[-0.3,0.3,0.2], "neck"];};
		case "C_Quadbike_01_F": {_cam attachto [(vehicle _unit),[0,0.15,0], "neck"];};
		case "C_SUV_01_F": {_cam attachto [(vehicle _unit),[-0.3,0.15,0.2], "neck"];};
		case "C_Van_01_transport_F": {_cam attachto [(vehicle _unit),[-0.4,0.4,0.3], "neck"];};
		case "C_Van_01_box_F": {_cam attachto [(vehicle _unit),[-0.4,0.4,0.3], "neck"];};

		case "C_Boat_Civil_01_F": {_cam attachto [(vehicle _unit),[0.3,0,0.3], "neck"];};
		case "C_Boat_Civil_01_police_F": {_cam attachto [(vehicle _unit),[0.3,0,0.3], "neck"];};
		case "C_Boat_Civil_01_rescue_F": {_cam attachto [(vehicle _unit),[0.3,0,0.3], "neck"];};
		case "C_Rubberboat": {_cam attachto [(vehicle _unit),[0.3,0,0.3], "neck"];};

		case "C_Van_01_fuel_F": {_cam attachto [(vehicle _unit),[-0.4,0.4,0.3], "neck"];};

		default{_cam attachto [_unit,[0,0.15,0], "neck"];};
	};
								
	_cam camSetFov 0.8; 				
	_id = _unit getvariable "LIVEid";
	_name=format ["rendertarget%1",_id];					
	0=[_monitor,_name,_cam,0] call fnc_RENDER;		
	_class = typeOf (vehicle _unit);

	while {true} do {
		sleep 2;
		_NeWclass = typeOf (vehicle _unit);
		if (!(_NeWclass == _class)) exitwith {0= [_monitor,0,0,_arguments] call fnc_PROCESS_LIVE;};
	};
};

fnc_PROCESS_SATT = {

	private ["_name","_cam","_debug"];
	_monitor=(_this select 0);
	_arguments=(_this select 3);
	_unit=_arguments select 0;
	_debug=_arguments select 1;	
	_monitor setObjectTextureglobal [0,"Scripts\Gopro\standby_sat.jpg"];
	
	SLEEP 1;//TEMPS DE CHARGEMENT SATTELLITE
	
	_cam=_unit getVariable "SATTCAM";
	
	if (isnil "_cam")then {
		_cam = "camera" camCreate [(getpos _unit select 0), (getpos _unit select 1), (getpos _unit select 2) + 200];	
		_unit setvariable ["SATTCAM",_cam,true];
		0=[_cam,_debug] call fnc_RESET;
	}
	else{
		if (isnull _cam) then {
			_cam = "camera" camCreate [(getpos _unit select 0), (getpos _unit select 1), (getpos _unit select 2) + 200];	
			_unit setvariable ["SATTCAM",_cam,true];
			0=[_cam,_debug] call fnc_RESET;
		};
	};
	[_cam,_unit] spawn {
		private ["_cam","_unit"];
		_cam = (_this select 0);
		_unit =(_this select 1);

		while {!(isnull _cam) || alive _unit} do {
				_cam setpos [(getpos _unit select 0), (getpos _unit select 1), (getpos _unit select 2) + 200];			
				sleep 0.1;
		};
	};
	_cam camSetFov 0.2; 
	_cam setVectorDirAndUp [[0,0,-1],[0,1,0]];
	_id = _unit getvariable "LIVEid";
	_name=format ["rendertargetsat%1",_id];		
	0=[_monitor,_name,_cam,2] call fnc_RENDER;
};

{
	if not(isnil "_x") then {
		if not(isNull _x) then {
			_cameraCount=_cameraCount+1;
			server setvariable ["CAMCOUNT",_cameraCount,true];
			if (name _x == "Error: No unit" ) then {
				_uniqueName=format ["<t color=""#ff0000"">" + ("SURVEILLANCE : %1") + "</t>",_x];
				_monitor addAction [_uniqueName, "call fnc_PROCESS_LIVE",[_x,_debug],0,false,true,"","(side _this == west)"];
			}
			else{
			_uniqueName=format ["<t color=""#00ffff"">" + ("GOPRO : %1") + "</t>",name _x];
			_monitor addAction [_uniqueName, "call fnc_PROCESS_LIVE",[_x,_debug],0,false,true,"","(side _this == west)"];		
			_uniqueName=format ["<t color=""#00ff00"">" + ("SATELLITE : %1") + "</t>",name _x];
			_monitor addAction [_uniqueName, "call fnc_PROCESS_SATT",[_x,_debug],0,false,true,"","(side _this == west)"];
			};
			_x setvariable ["LIVEid",_cameraCount,true];
		};
	};
}foreach _units;

if (_debug) then {
	_sidechatHint = format["Total Cam count: %1", _cameraCount];
	PAPABEAR sideChat _sidechatHint;
	GlobalSideChat = _sidechatHint; 
	publicVariable "GlobalSideChat";
};
