# Gestion du téléphone

## 1- Introduction <a id="bkmrk-page-title"></a>

### **But de ce tutoriel**

Ce tutoriel permet à une entreprise d'avoir des markers 'Ouvert / Fermer'.




Niveau de difficulté : **Facile**  
Temps requis : **1 minutes**
{% endhint %}

## 2- Mise en place <a id="bkmrk-page-title"></a>

### **Fichiers concernés**  

	`Altis_Life.Altis\Functions.hpp`
	`Altis_Life.Altis\core\civilian\fn_markerOpenClose.sqf`

### **Mise en place**

1- Dans **`Functions.hpp`** trouvez le bloc:

```sqf
   class Civilian {
        file = "core\civilian";
        class civLoadout {};
        class civMarkers {};
        class demoChargeTimer {};
        class freezePlayer {};
        class jail {};
        class jailMe {};
        class knockedOut {};
        class knockoutAction {};
        class removeLicenses {};
        class robPerson {};
        class robReceive {};
        class tazed {};
    };
```

2- Ajouter cette class:

```sqf
class markerOpenClose;
```
3 - Crée le fichier : **`fn_markerOpenClose.sqf`** dans le répertoire : **`core\civilian`** , puis mettez ce code a l'intérieur
```text
/*
    File: fn_markerOpenClose.sqf
    ====================
    Author: Joaquine
    ====================
    Description :
	this addAction ["Ouvrir / Fermer ", ina_fnc_markerOpenClose, "Nom de l'entreprise", 0, false, false, "", 'licence_civ_....'];
*/
private _target = [_this,0,objNull,[objNull]] call BIS_fnc_param;
private _name = [_this,3,"",[""]] call BIS_fnc_param;
	if (isNil {_target getVariable "markers"}) then {
		_target setVariable ["markers", false,true];
	};
	if ((_target getVariable "markers") isEqualTo false) exitWith {
		hint "Vous venez d'ouvrir votre entreprise";
			_marker = createMarker [format ["%1_marker",_name],position _target];
            _marker setMarkerColor "ColorGreen";
            _marker setMarkerType "Mil_dot";
            _marker setMarkerText format ["%1 : OUVERT", _name];
		sleep 2;
		_target setVariable ["markers", true,true];
	};
	if ((_target getVariable "markers") isEqualTo true) exitWith {
		hint "Vous venez de fermer votre entreprise";
		 deleteMarker format ["%1_marker",_name];
		sleep 2;
		_target setVariable ["markers", false,true];
	};
```

3 - La commande est a mettre dans un panneau / PNJ / autres object In Game
```sqf
this addAction ["Ouvrir / Fermer ", ina_fnc_markerOpenClose, "Nom de l'entreprise", 0, false, false, "", 'licence_civ_....'];
```




