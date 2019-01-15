/*  
    GrenadeStop v0.8 for ArmA 3 Alpha by Bake (tweaked slightly by Rarek)  
    Author: Johnny  
	Modified by: Gbutome 
    DESCRIPTION:  
    Quand une perssone tire en zone safe, il se veras averti puis sanctionné.  
 
    CONFIGURATION:  
    Edit the #defines below.  
*/  
 
#define SAFETY_ZONES [["Safe_Zone_1", 550],["Safe_Zone_2", 200],["Safe_Zone_3", 200]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]  
#define MESSAGE "Tu es mort car tu as tiré dans une safe zone"  
 
    if (isDedicated) exitWith {};  
    waitUntil {!isNull player};  
 
switch (playerSide) do {  
    case west: {};  
 
    case civilian: {  
        player addEventHandler ["Fired", {  
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then {  
                if (life_advert == 2) then {  
                    deleteVehicle (_this select 6);  
                    titleText [MESSAGE, "PLAIN", 3];  
                    player setDamage 1; //Pan t'es mort  
                    hint parseText format["<t color='#01B0F0'><t size ='2.5'><t align='center'>Safe Zone<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Pas de tirs<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Pas de vols<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Pas de braquage<br/>"];  
                };
               
                if (life_advert == 1) then {  
                    removeAllWeapons player;            
                    "" hintC parseText "<t><t size='1.5'>Attention !</t><br/><br/>  
                    <t color='#F20000'>Le tir en Zone Safe n'est pas tolere</t><br/>  
                    <t color='#F20000'>par le serveur !</t><br/>  
                    <t color='#F20000'></t><br/>  
                    <t color='#F20000'>Toutes tes armes ont ete confisque !</t><br/><br/>  
                    <t color='#F20000'>Deuxieme avertissement !</t><br/>";  
                    life_advert = 2;  
                };  
 
                if (life_advert == 0) then {  
                    "" hintC parseText "<t><t size='1.5'>Attention !</t><br/><br/>  
                    <t color='#F20000'>Le tir en Zone Safe n'est pas tolere</t><br/>  
                    <t color='#F20000'>par le serveur !</t><br/>  
                    <t color='#F20000'></t><br/>  
                    <t color='#F20000'>Premiere avertissement !</t><br/>";  
                    life_advert = 1;  
                };
            };
        }];  
    };    
};