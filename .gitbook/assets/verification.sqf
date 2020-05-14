//#include "..\..\script_macros.hpp"
_trigger = _this;
if not(getpos player inarea  _trigger) exitwith{};
_nameTrigger = str(_trigger);
_sliptNameTrigger = [_nameTrigger, "_"] call BIS_fnc_splitString;
_nbCircuit = call compile (_sliptNameTrigger select 1);
_nbTrigger = call compile (_sliptNameTrigger select 2);


player SetVariable["nb_trigger",
	call {
		_i = 0;
		while {not isNil ('trigger_'+str(_nbCircuit)+'_'+str(_i))} do {
			_i = _i + 1;
		};
		_i;
	}
];

hint str(player getVariable "nb_trigger");

_trigger_precedant=(player getVariable[("Trigger_precedant_" + str (player GetVariable["Circuit",0])),-1]);
_trigger_actuel=(call compile ((str (_this)) select [(count str (_this))-1,(count str (_this))]));
_spam_du_trigger=(_trigger_precedant==_trigger_actuel);
if _spam_du_trigger exitwith {};

_non_increment_trigger=(_trigger_precedant+1!=_trigger_actuel);
_trigger_de_arrivee=(_trigger_actuel==0);
if (_non_increment_trigger && !_trigger_de_arrivee) exitwith {};


_vien_du_dernier_trigger=(_trigger_precedant==((player GetVariable["nb_trigger",0])-1));
if (_trigger_de_arrivee && !_vien_du_dernier_trigger && _trigger_precedant!=-1) exitwith {};

_trigger_precedant=(player getVariable[("Trigger_precedant_" + str((player GetVariable["Circuit",0]))),-1]);
_trigger_actuel=(call compile ((str (_this)) select [(count str _this)-1,(count str _this)]));


_temps_tour=player getVariable["Temps_tour",-1];
_temps_porte=(time-(player getVariable[("Temps_porte_" + str ((player GetVariable["Circuit",0])) + "_" + str 0),time]));
_temps_record_porte=SERVER getVariable[("Temps_porte_" + str (player GetVariable["Circuit",0]) + "_" + str _trigger_actuel),-1];
_record_joueur=player getVariable["Record_"+str (player GetVariable["Circuit",0]),-1];
_record_SERVER=SERVER getVariable["Record_"+str (player GetVariable["Circuit",0]),-1];
_recordMan=SERVER getVariable["RecordMan_"+str (player GetVariable["Circuit",0]),"AUCUN"];
_tableau_records=SERVER getVariable[("Tableau_record_"+str (player GetVariable["Circuit",0])),[["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0]]];
if (_trigger_actuel==0 && _trigger_precedant==-1) then {
	player setVariable[("Temps_porte_" + str (player GetVariable["Circuit",0]) + "_" + str 0),time,true]
};

//CHANGEMENT DES VARIABLES
player setVariable[("Trigger_precedant_" + str ((player GetVariable["Circuit",0]))),_trigger_actuel,true];
player setVariable[("Temps_porte_" + str ((player GetVariable["Circuit",0])) + "_" + str (_trigger_actuel)),_temps_porte,true];
if (_trigger_actuel==0) then {
	player setVariable["Temps_tour",_temps_porte,true];
	player setVariable[("Temps_porte_" + str ((player GetVariable["Circuit",0])) + "_" + str 0),time,true];
};

//REAFFECTATION DES VARIABLES
_temps_tour=player getVariable["Temps_tour",-1];
_temps_porte=0 max (time-(player getVariable[("Temps_porte_" + str ((player GetVariable["Circuit",0])) + "_" + str 0),-1]));
_diff_porte=_temps_record_porte-_temps_porte;
if (_diff_porte<0) then {player setVariable["diff_porte_" + str ((player GetVariable["Circuit",0])) + "_" + str (_trigger_actuel),"<t underline='true'>" + "<t color='#ff0000'>" + "+ " + (str (abs(_diff_porte)) select [0,5]) + "</t>" + "</t>",true];};
if (_diff_porte>=0) then {player setVariable["diff_porte_" + str ((player GetVariable["Circuit",0])) + "_" + str (_trigger_actuel),"<t underline='true'>" + "<t color='#32a000'>" + "- " + (str (abs(_diff_porte)) select [0,5]) + "</t>" + "</t>",true];};
if (_temps_record_porte==-1) then {player setVariable["diff_porte_" + str (player GetVariable["Circuit",0]) + "_" + str _trigger_actuel,"",true];};

//RECORD JOUEUR
if ((_trigger_actuel==0) &&  (_temps_tour >0.1) && (_record_joueur<0 || _record_joueur>_temps_tour)) then {
	player setVariable["Record_"+str (player GetVariable["Circuit",0]),_temps_tour,true];
	_record_joueur=player getVariable["Record_"+str (player GetVariable["Circuit",0]),-1];
//RECORD SERVEUR
	if ((_record_SERVER<0) || (_record_SERVER>_record_joueur)) then { 
		SERVER setVariable["Record_"+str (player GetVariable["Circuit",0]),_record_joueur,true];
		SERVER setVariable["RecordMan_"+str (player GetVariable["Circuit",0]),(name player),true];
		_record_SERVER=SERVER getVariable["Record_"+str (player GetVariable["Circuit",0]),-1];
		for "_i" from 1 to ((player GetVariable["nb_trigger",0])-1) do {
			SERVER setVariable[("Temps_porte_" + str (player GetVariable["Circuit",0]) + "_" + str _i),player getVariable[("Temps_porte_" + str (player GetVariable["Circuit",0]) + "_" + str _i),-1],true];
		};
	};
};
//TABLEAU RECORD
_rang_record=-1;
if (((_temps_tour<((_tableau_records select 9) select 1))|| ((_tableau_records select 9) select 1)==0)&& (_temps_tour>0)) then {
	_liste_temps=[];
	for "_i" from 0 to 9 do{
		_liste_temps=_liste_temps+[((_tableau_records select _i) select 1)];
	};
	
	_bool=0;
	for "_i" from 0 to 9 do{
		if ((((_liste_temps select _i)>_temps_tour)||((_liste_temps select _i)==0) )&& (_bool==0)) then {
			_rang_record=_i;
			_bool=1;
		};
	};
	_new_tableau_record=_tableau_records;
	hint str(_rang_record);
	if (_rang_record==0) then {_new_tableau_record=[[name player,_temps_tour]]+_new_tableau_record};
	if (_rang_record==1) then {_new_tableau_record=((_new_tableau_record select [0,1]) + [[name player,_temps_tour]] + (_new_tableau_record select [1,9]))};
	if (_rang_record==2) then {_new_tableau_record=((_new_tableau_record select [0,2]) + [[name player,_temps_tour]] + (_new_tableau_record select [2,9]))};
	if (_rang_record==3) then {_new_tableau_record=((_new_tableau_record select [0,3]) + [[name player,_temps_tour]] + (_new_tableau_record select [3,9]))};
	if (_rang_record==4) then {_new_tableau_record=((_new_tableau_record select [0,4]) + [[name player,_temps_tour]] + (_new_tableau_record select [4,9]))};
	if (_rang_record==5) then {_new_tableau_record=((_new_tableau_record select [0,5]) + [[name player,_temps_tour]] + (_new_tableau_record select [5,9]))};
	if (_rang_record==6) then {_new_tableau_record=((_new_tableau_record select [0,6]) + [[name player,_temps_tour]] + (_new_tableau_record select [6,9]))};
	if (_rang_record==7) then {_new_tableau_record=((_new_tableau_record select [0,7]) + [[name player,_temps_tour]] + (_new_tableau_record select [7,9]))};
	if (_rang_record==8) then {_new_tableau_record=((_new_tableau_record select [0,8]) + [[name player,_temps_tour]] + (_new_tableau_record select [8,9]))};
	if (_rang_record==9) then {_new_tableau_record=_new_tableau_record+[[name player,_temps_tour]]};
	_new_tableau_record=_new_tableau_record select [0,10];
	// SERVER setVariable[("Tableau_record_"+str (player GetVariable["Circuit",0])),_new_tableau_record,true];
	// CASH = CASH + 1000*(10-_rang_record);
	// [0] call SOCK_fnc_updatePartial;
	
	// [0,"STR_NOTF_RecordCircuit",true,[player getVariable ["realname", name player], (_rang_record+1),(player GetVariable["Circuit",0]),(1000*(10-_rang_record))]] remoteExecCall ["life_fnc_broadcast",civilian];
	// [0,"STR_NOTF_RecordCircuit",true,[player getVariable ["realname", name player], (_rang_record+1),(player GetVariable["Circuit",0]),(1000*(10-_rang_record))]] remoteExecCall ["life_fnc_broadcast",west];
};


//REAFFECTATION DE VARIABLES
_recordMan=SERVER getVariable["RecordMan_"+str (player GetVariable["Circuit",0]),"AUCUN"];
_tableau_records=SERVER getVariable[("Tableau_record_"+str (player GetVariable["Circuit",0])),[["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0]]];

//AFFICHAGE DES SCORES
_txt="";
_txt=composeText [_txt,parseText("<t shadow='2'>" + "<t color='#8c8c8c'>" + "<t size='2'>" + "<t underline='true'>" + "Circuit " + "</t>" + str (player GetVariable["Circuit",0]) + "</t>" + "</t>" + "</t>")];//GRAS GROS SOULIGNE GRIS
_txt=composeText [_txt,parseText ("<t size='2'>" + "<br /> " + "</t>")];
_txt=composeText [_txt,parseText("<t align='left'>" + "<t shadow='2'>" + "<t color='#e5d664'>" + "<t size='1.1'>" + "<t underline='true'>" + "Nom du Record:   " + "</t>" + "<t color='#ff6932'>" + _recordMan  + "</t>" + "</t>" + "</t>" + "</t>" + "</t>")];//ITALIQUE SOULIGNE JAUNE
_txt=composeText [_txt,parseText ("<t size='1.1'>" + "<br /> " + "</t>")];

if (_record_SERVER!=-1) then {
	_txt=composeText [_txt,parseText("<t size='1.1'>" + "<t color='#e5d664'>" + "<t align='left'>" + "<t underline='true'>" + "Temps  Record:   " + "</t>" + "<t color='#ff6932'>" + str _record_SERVER + "</t>" + "<t underline='true'>" + "   secondes" + "</t>" + "</t>" + "</t>" + "</t>")];//ITALIQUE SOULIGNE JAUNE
	_txt=composeText [_txt,parseText ("<t size='1.1'>" + "<br /> " + "</t>")];
}; 

_txt=composeText [_txt,parseText ("<br /> ")];

if (_trigger_actuel!=0) then {
	for "_i" from 1 to _trigger_actuel do {
		_txt=composeText [_txt,parseText("<t align='left'>" + "<t underline='true'>" + "<t color='#ff00fa'>" + "Porte " + "</t>" + "<t color='#ff0004'>" + str _i + "</t>" + "<t color='#ff00fa'>" + " :   " + "</t>" + "</t>" + "<t color='#ef931a'>"+ "<t size='1.3'>" +((str (player getVariable[("Temps_porte_" + str (player GetVariable["Circuit",0]) + "_" + str _i),time])) select [0,4]) + "</t>" + "</t>" + "<t color='#ff00fa'>" + "<t underline='true'>" + "  secondes    " + "</t>" + "</t>" + "</t>" +"<t size='1.1'>" + "   ( " + str(player getVariable["diff_porte_" + str (player GetVariable["Circuit",0]) + "_" + str (_i),0]) + " )"+ "</t>")];// ORANGE GRAS ITALIQUE
		_txt=composeText [_txt,parseText ("<br /> ")];
	};
	if (_record_SERVER>0) then {
		_txt=composeText [_txt,parseText ("<br /> ")];
		if (_diff_porte<0) then {
			_txt=composeText [_txt,parseText("<t shadow='2'>" + "<t size='1.5'>" +"<t color='#ff0000'>" + "+   " + "<t underline='true'>" + (str (abs(_diff_porte)) select [0,5]) + "</t>" + "   secondes" + "</t>" + "</t>" + "</t>")];// ROUGE GROS GRAS
			_txt=composeText [_txt,parseText ("<br /> ")];
		};
		if (_diff_porte>0) then {
			_txt=composeText [_txt,parseText("<t shadow='2'>" + "<t size='1.5'>" +"<t color='#32a000'>" + "-   " + "<t underline='true'>" + (str (abs(_diff_porte)) select [0,5]) + "</t>" + "   secondes" + "</t>" + "</t>" + "</t>")]; //VERT GROS GRAS
			_txt=composeText [_txt,parseText ("<br /> ")];
		};
	};
};

if (_trigger_actuel==0) then {
	if (_record_SERVER>0) then {
		for "_i" from 1 to ((player GetVariable["nb_trigger",0])-1) do {
			_txt=composeText [_txt,parseText ("<t align='left'>" + "<t underline='true'>" + "<t color='#ff00fa'>" + "Porte " + "</t>" + "<t color='#ff0004'>" + str _i + "</t>" + "<t color='#ff00fa'>" + " :   " + "</t>" + "</t>" + "<t color='#ef931a'>"+ "<t size='1.3'>" +((str (player getVariable[("Temps_porte_" + str (player GetVariable["Circuit",0]) + "_" + str _i),time])) select [0,4]) + "</t>" + "</t>" + "<t color='#ff00fa'>" + "<t underline='true'>" + "  secondes" + "</t>" + "</t>" + "</t>" + "<t size='1.1'>" + "   ( " + str(player getVariable["diff_porte_" + str (player GetVariable["Circuit",0]) + "_" + str (_i),0]) + " )" + "</t>")]; // ORANGE GRAS ITALIQUE
			_txt=composeText [_txt,parseText ("<br /> ")];
		};
		_txt=composeText [_txt,parseText ("<br /> ")];
		_txt=composeText [_txt,parseText ("<t align='left'>" + "<t size='1.3'>" + "<t color='#7c5b00'>" + "<t underline='true'>" + "Temps circuit:   " + "</t>" + "</t>" + "<t color='#fff200'>" + ((str _temps_tour) select [0,4]) + "</t>" + "<t underline='true'>" + "<t color='#7c5b00'>" + " secondes"  + "</t>"+ "</t>"+ "</t>")]; //GROS VIOLET GRAS
		_txt=composeText [_txt,parseText ("<br /> ")];
		_txt=composeText [_txt,parseText ("<t align='left'>" + "<t size='1.3'>" +"<t color='#7c5b00'>" + "<t underline='true'>" +  "Record  joueur:   " + "</t>" + "</t>" + "<t color='#fff200'>" + ((str _record_joueur) select [0,4]) + "</t>" + "<t underline='true'>" + "<t color='#7c5b00'>" + " secondes" + "</t>" + "</t>"+ "</t>")];
		_txt=composeText [_txt,parseText ("<br /> ")];
		_txt=composeText [_txt,parseText ("<t align='left'>" + "<t size='1.3'>" + "<t color='#7c5b00'>" + "<t underline='true'>" + "Record SERVER:   " + "</t>" + "</t>" + "<t color='#fff200'>" + ((str _record_SERVER) select [0,4]) + "</t>" + "<t underline='true'>" + "<t color='#7c5b00'>" + " secondes" + "</t>" + "</t>"+ "</t>"	)];
		_txt=composeText [_txt,parseText ("<br /> ")];
		_txt=composeText [_txt,parseText ("<br /> ")];
		if (_temps_tour-_record_SERVER>0) then {
			_txt=composeText [_txt,parseText ("<t shadow='2'>" + "<t size='1.5'>" +"<t color='#ff0000'>" + "+   " + "<t underline='true'>" + ((str (abs(_temps_tour-_record_SERVER))) select [0,5]) + "</t>" + "   secondes" + "</t>" + "</t>" + "</t>")];// ROUGE GROS GRAS
		};
		
		if (_temps_tour-_record_SERVER<0) then {
			_txt=composeText [_txt,parseText ("<t shadow='2'>" + "<t size='1.5'>" + "<t color='#32a000'>" + "-   " + "<t underline='true'>" + ((str (abs(_temps_tour-_record_SERVER))) select [0,5]) + "</t>" + "   secondes" + "</t>" + "</t>" + "</t>")];//VERT GROS GRAS
		};
		
		if (_temps_tour-_record_SERVER==0) then {
			_txt=composeText [_txt,parseText ("<t underline='true'>" + "<t size='1.5'>" + "<t color='#ffbb00'>" + "/!\RECORD BATTU/!\")];
		};
		
		_txt=composeText [_txt,parseText ("<br /> ")];
		_txt=composeText [_txt,parseText ("<br /> ")];
		
		if (_rang_record >-1) then {
			_txt=composeText [_txt,parseText ("<t underline='true'>" + "<t size='1.2'>" + "<t color='#00ffff'>" + "Classement :  " + str (_rang_record+1))];
		};
		
		_txt=composeText [_txt,parseText ("<br /> ")];
		_txt=composeText [_txt,parseText ("<br /> ")];
		_txt=composeText [_txt,parseText ("<t underline='true'>" + "<t size='1.5'>" + "<t color='#00ffff'>" + "LEADERBOARD")];
		_txt=composeText [_txt,parseText ("<br /> ")];
		_txt=composeText [_txt,parseText ("<br /> ")];
		for "_i" from 0 to 9 do {
			_txt=composeText [_txt,parseText ("<t align='left'>" + "<t color='#ff8484'>" + str (_i+1) + " :   " + ((_tableau_records select _i) select 0) + ": " + str ((_tableau_records select _i) select 1) + " secondes")];
			_txt=composeText [_txt,parseText ("<br /> ")];
		};
	};
};
hint _txt;

//REINITIALISATION TEMPS TOUR
player setVariable["Temps_tour",-1,true];
