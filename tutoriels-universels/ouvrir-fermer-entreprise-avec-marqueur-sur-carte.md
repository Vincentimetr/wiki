# Ouvrir / Fermer entreprise

## 1- Présentation

### But de ce tutoriel

Ce script va permettre d'ouvrir/fermer une entreprise. Le but étant de changer dynamiquement sur carte le marqueur correspondant à l'emplacement de votre entreprise, de "_Ouvert_ \(en vert par exemple\)" à "_Fermé_ \(en rouge par exemple\)". Cela peut également être une base pour vous permettre de restreindre certaines actions si l'entreprise est fermée ou ouverte.

## 2- Installation et configuration

### Fichiers concernés

* `Altis_Life.Altis\core\civilian\`**`fn_markerOpenClose.sqf`**



### Mise en place

1 - **Créer** le fichier : **`fn_markerOpenClose.sqf`** dans le répertoire : **`core\civilian`** , puis y **placer** le code suivant :

```
/*
    File: fn_markerOpenClose.sqf
    ====================
    Author: Joaquine
    ====================
    Description :
	this addAction ["Ouvrir / Fermer ", life_fnc_markerOpenClose, "Nom de l'entreprise", 0, false, false, "", 'licence_civ_....'];
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



2- Ensuite, **déclarer** la commande addAction à placer dans un panneau / PNJ / objet sur carte : 

```text
this addAction ["Ouvrir / Fermer ", life_fnc_markerOpenClose, "Nom de l'entreprise", 0, false, false, "", 'licence_civ_....'];
```



Tutoriel proposé par [Joaquine](https://altisdev.com/u/joaquine)

