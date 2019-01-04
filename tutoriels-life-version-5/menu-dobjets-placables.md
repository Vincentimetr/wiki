# Menu d'objets plaçables

## 1- Introduction <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

Ce tutoriel va permettre d'intégrer un menu qui permettra aux policiers/medics de placer des objets du type barrière, cône etc...

Les panneaux présents dans les Screenshots ne sont pas les panneaux d'origine donc à ajouter vous même !

**Aperçu du résultat une fois implanté**

[![JcAiKy3yEWMoZQUG-Placeables2.jpg](http://wiki.altisdev.com/uploads/images/gallery/2017-11-Nov/scaled-840-0/JcAiKy3yEWMoZQUG-Placeables2.jpg)](http://wiki.altisdev.com/uploads/images/gallery/2017-11-Nov/JcAiKy3yEWMoZQUG-Placeables2.jpg)

[![1SbMIhHo1u5lJuYc-Placeables-3.jpg](http://wiki.altisdev.com/uploads/images/gallery/2017-11-Nov/scaled-840-0/1SbMIhHo1u5lJuYc-Placeables-3.jpg)](http://wiki.altisdev.com/uploads/images/gallery/2017-11-Nov/1SbMIhHo1u5lJuYc-Placeables-3.jpg)

[![fU6SF72TfCEyHNX0-Pleaceables-1.jpg](http://wiki.altisdev.com/uploads/images/gallery/2017-11-Nov/scaled-840-0/fU6SF72TfCEyHNX0-Pleaceables-1.jpg)](http://wiki.altisdev.com/uploads/images/gallery/2017-11-Nov/fU6SF72TfCEyHNX0-Pleaceables-1.jpg) 

{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : **8-10 minutes**  
{% endhint %}

## 2- Installation <a id="bkmrk-page-title"></a>

**Fichiers concernés** 

{% hint style="danger" %}
Voici la liste des fichiers concernés dans cette partie, veuillez bien vérifier que vous ayez ces fichiers de votre coté.
{% endhint %}

* * **`function.hpp`**
  * `core\pmenu\`**`fn_p_openMenu.sqf`**
  * `core\`**`fn_initCop.sqf`**
  * `core\`**`fn_initMedic.sqf`**
  * `dialog\`**`MasterHandler.hpp`**
  * `core\Function\`**`KeyHandler.sqf`**

**Installation**

1- **Allez** dans _function.hpp_ et en dessous de la **class** cop **ajoutez**:

```text
class Placeables {  
	file = "core\placeables";  
	class placeablesInit {};  
	class placeablesMenu {};  
	class placeablesRemoveAll {};  
	class placeablePlace {};  
	class placeableCancel {};  
	class placeableComplete {};  
};  
```

2- **Allez** dans `core` puis **créez** un dossier qui se nommera **placeables,** ensuite nous allons **créez** plusieurs fichiers à l’intérieur

2a- **Créez** un fichier nommé _fn\_placeablesInit.sqf_ puis **ajoutez** ce code à l’intérieur, se sera votre sorte de fichier config

```text
/*   
	Author: Maximum, Adapté par Sharywan 
	Description: Placeables for the cop\medic sides.  
	Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE… Credits: Killerty69 for a second pare of eyes when mine got to sleepy  
	P.S. - Don't be a faggot like i know some of you all will be.  
*/  
life_barrier_active = false;  
life_barrier_activeObj = ObjNull;  
life_placeables = [  
	[ "Cone", "RoadCone_F"],  
	[ "Cone lumiere blanche", "RoadCone_L_F"],  
	[ "Panneau de signalisation", "SignAd_Sponsor_F"],  
	[ "Barriere", "Land_BarGate_F"],  
	[ "Barriere routier", "Land_Crash_barrier_F"],  
	[ "Barriere en plastique orange", "PlasticBarrier_03_orange_F"],  
	[ "Barriere en plastique jaune", "PlasticBarrier_02_yellow_F"],  
	[ "Lampe simple", "Land_PortableLight_single_F"],  
	[ "Lampe double", "Land_PortableLight_double_F"],  
	[ "Drapeau De l'ONU", "Flag_UNO_F"]  
];  
life_bar_limit = 2500;  
life_bar_placey = [];  
```

 2b- **Créez** un fichier nommé _fn\_placeablesMenu.sqf_ puis **ajoutez** ce code à l’intérieur, ce fichier sert à afficher le menu

```text
/*   
	Author: Maximum, Adapté par Sharywan 
	Description: Placeables for the cop\medic sides.  
	Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE... Credits: Killerty69 for a second pare of eyes when mine got to sleepy  
	P.S. - Don't be a faggot like i know some of you all will be.  
*/  
disableSerialization;  

createDialog "life_cop_placeables";  
waitUntil { !isNull(findDisplay 20000) };  
_display = findDisplay 20000;  
_placeables = _display displayCtrl 20001;  
lbClear _placeables;  

{      
	_name = _x select 0;  
    _className = _x select 1;  
    _placeables lbAdd _name;  
    _placeables lbSetData [(lbSize _placeables) - 1, _className];  
} foreach (life_placeables);  
```

 2c- **Créez** un fichier nommé _fn\_placeablesRemoveAll.sqf_ puis **ajoutez** ce code à l’intérieur, c'est ce qui retire tout les objets

```text
/*   
	Author: Maximum, Adapté par Sharywan  
	Description: Placeables for the cop\medic sides.  
	Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE... Credits: Killerty69 for a second pare of eyes when mine got to sleepy  
	P.S. - Don't be a faggot like i know some of you all will be.  
*/  
{  
	deleteVehicle _x;  
} forEach (life_bar_placey);  
```

 2d- **Créez** un fichier nommé _fn\_placeablePlace.sqf_  puis **ajoutez** ce code a l’intérieur, maintenant on fait apparaître l'objet

```text
/*
    Author: Maximum, Adapté par Sharywan
    Description: Placeables for the cop\medic sides.
    Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE... Credits: Killerty69 for a second pare of eyes when mine got to sleepy
    P.S. - Don't be a faggot like i know some of you all will be.
*/
disableSerialization;

if (typeOf (life_barrier_activeObj) != "") then { 
                _currentPos = getPosATL life_barrier_activeObj;
                detach life_barrier_activeObj;
                life_barrier_activeObj setPos[(getPos life_barrier_activeObj select 0), (getPos life_barrier_activeObj select 1), 0];
                life_barrier_activeObj enableSimulationGlobal true;
                life_bar_placey pushBack life_barrier_activeObj;
                life_barrier_active = false;
                life_barrier_activeObj = ObjNull; 
            };

if (count life_bar_placey >= life_bar_limit) exitWith { hint "Vous avez atteint la limite des objets placables"; };
_display = findDisplay 20000;
_placeables = _display displayCtrl 20001;
_className = lbData[20001, lbCurSel (20001)];
closeDialog 0;
life_barrier_active = true;
_allowMoveDistance = 50;
_object = _className createVehicle (position player);
life_barrier_activeObj = _object;
_attachPos = [0, 3, 0.5];
_object attachTo[player, _attachPos];
_object enableSimulationGlobal false;
_originalPos = position _object;
_playerOriginalPos = position player;

waitUntil{
    if (life_barrier_activeObj distance _originalPos > _allowMoveDistance || player distance _playerOriginalPos > _allowMoveDistance) then {
        [true] call life_fnc_placeableCancel;
    };
    sleep 1;
    !life_barrier_active;
};
```

 2e-  **Créez** un fichier nommé _fn\_placeableCancel.sqf_ puis **ajoutez** ce code a l’intérieur, ont ajoute la possibilité d'annuler

```text
/*   
	Author: Maximum, Adapté par Sharywan  
	Description: Placeables for the cop\medic sides.  
	Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE... Credits: Killerty69 for a second pare of eyes when mine got to sleepy  
	P.S. - Don't be a faggot like i know some of you all will be.  
*/  
if (!life_barrier_active) exitWith {}; //bad check?  
deleteVehicle life_barrier_activeObj;  
life_barrier_active = false;  
life_barrier_activeObj = ObjNull; 
```

 2f- **Créez** un fichier nommé _fn\_placeableComplete.sqf_ puis **ajoutez** ce code a l’intérieur, là ont maintenant on pose l'objet

```text
/*   
	Author: Maximum, Adapté par Sharywan  
	Description: Placeables for the cop\medic sides.  
	Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE... Credits: Killerty69 for a second pare of eyes when mine got to sleepy  
	P.S. - Don't be a faggot like i know some of you all will be.  
*/  
disableSerialization;  
if (!life_barrier_active) exitWith {};  
if (life_barrier_activeObj == ObjNull) exitWith {};  

_currentPos = getPosATL life_barrier_activeObj;  
detach life_barrier_activeObj;  
life_barrier_activeObj setPos[(getPos life_barrier_activeObj select 0), (getPos life_barrier_activeObj select 1), 0];  
life_barrier_activeObj enableSimulationGlobal true;  
life_bar_placey pushBack life_barrier_activeObj;  
life_barrier_active = false;  
life_barrier_activeObj = ObjNull;  
```



3- Maintenant **rendez-vous** dans `dialog\`**`MasterHandler.hpp`** pour inclure nos fichiers fraîchement crées, puis on ajoute ceci à la suite des autres1

```text
#include "placeables.hpp"
```

 4- Après, vous devez vous rendre dans le dossier `dialog` puis créez un fichier nommé _placeables.hpp_

```text
class Life_Cop_Placeables {  
	idd = 20000;  
    name= "life_cop_placeables";  
    movingEnable = false;  
    enableSimulation = true;  
    onLoad = "";  

	class controlsBackground {  
		class Life_RscTitleBackground: Life_RscText {  
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};  
			idc = -1;  
			x = 0.1;  
			y = 0.2;  
			w = 0.6;  
			h = (1 / 25);  
		};  

		class MainBackground: Life_RscText {  
			colorBackground[] = {0, 0, 0, 0.7};  
			idc = -1;  
			x = 0.1;  
			y = 0.2 + (11 / 250);  
			w = 0.6;  
			h = 0.6 - (22 / 250);  
		};  
    };  

	class controls {  
		class Title : Life_RscTitle {  
			colorBackground[] = {0, 0, 0, 0};  
			idc = -1;  
			text = "Liste des objets";  
			x = 0.1;  
			y = 0.2;  
			w = 0.6;  
			h = (1 / 25);  
		};  

		class PlaceablesList : Life_RscListBox {  
			idc = 20001;  
			text = "";  
			sizeEx = 0.035;  
			x = 0.12;  
			y = 0.26;  
			w = 0.56;  
			h = 0.370;  
		};  

		class CloseButtonKey : Life_RscButtonMenu {  
			idc = -1;  
			text = "$STR_Global_Close";  
			onButtonClick = "closeDialog 0;";  
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));  
			y = 0.8 - (1 / 25);  
			w = (6.25 / 40);  
			h = (1 / 25);  
		};  

		class RemoveAll : life_RscButtonMenu {  
			idc = -1;  
			text = "Retirer tous";  
			onButtonClick = "[] call life_fnc_placeablesRemoveAll";  
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));  
			y = 0.8 - (1 / 25);  
			w = (6.25 / 40);  
			h = (1 / 25);  
		};  

		class Place : Life_RscButtonMenu {  
			idc = -1;  
			text = "Placer";  
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};  
			onButtonClick = "[] spawn life_fnc_placeablePlace;";  
			x = 0.32;  
			y = 0.69;  
			w = (6.25 / 40);  
			h = (1 / 25);  
		};  
    };  
};  
```

 5- **Maintenant** on entre dans le fichier _player\_inv.hpp_ et on **rajoute** ceci en dessous tout en bas juste en dessous de`Syncdata`, se sera le bouton dans le menu Y

```text
class ButtonPlaceables: Life_RscButtonMenu {  
	idc = 20003;  
	text = "Placeables";  
	onButtonClick = "[] spawn life_fnc_placeablesMenu; closeDialog 0;";  
	//x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));  
	x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));  
	y = 0.801;  
	w = (6.25 / 40);  
	h = (1 / 25);  
};  
```



6- Allons maintenant dans `core\pmenu\`**`fn_p_openMenu.sqf`** et on rajoute ceci à civilian, grâce à cela nous masquons le bouton pour les civils

```text
case civilian: {  
		ctrlShow[2012,false];  
		ctrlShow[20003,false]; //<--- ajouter sa  
	};
```

7- On va dans `core\fn_initCop.sqf et core\`**`fn_initMedic.sqf`** `` puis on rajoute pour les deux fichiers à la fin, qui permettra d'initialiser le menu au spawn des policiers et médecins1

```text
[] spawn life_fnc_placeablesInit;
```

8- Dernière étape ! on se dirige dans `core\Function\`**`KeyHandler.sqf`** pour y ajouter ceci, là on ajoute la touche pour placer les objets \(Par défaut, touche C\)

```text
//Modifer le numéro pour changer la touche
case 46	: {  
            _currentPos = getPosATL life_barrier_activeObj;  
            detach life_barrier_activeObj;  
            life_barrier_activeObj setPos[(getPos life_barrier_activeObj select 0), (getPos life_barrier_activeObj select 1), 0];  
            life_barrier_activeObj enableSimulationGlobal true;  
            life_bar_placey pushBack life_barrier_activeObj;  
            life_barrier_active = false;  
            life_barrier_activeObj = ObjNull;  
            hint "Vous avez placé l'objet !";  
   	};  
```

## 3- Problèmes récurents <a id="bkmrk-page-title"></a>

**Solutions possibles pour les problèmes récurrents**

* **Erreur \#1** : Votre menu ne s'affiche pas  ?

{% hint style="success" %}
**Solution** : Cela est peut être dû au fichier _function.hpp_ auquel vous avez mal défini la class **placeables**
{% endhint %}

* **Erreur \#2** : L'objet apparaît devant vous mais vous ne pouvez pas le placer ?

{% hint style="success" %}
**Solution** : Vous avez probablement changer les numéros de la class `core\Function\`**`KeyHandler.sqf`** remettez le a **case 46**et votre touche sera c
{% endhint %}

* **Erreur \#3** : Les civils voient aussi le bouton objets ?

{% hint style="success" %}
**Solution** : C'est peut être que **l’étape 6** de l'installation a été mal effectué, veuillez la recommencer
{% endhint %}

{% hint style="info" %}
Si vous rencontrez un problème n'étant pas répertorié ci-dessus, merci d'en prévenir l'auteur, afin qu'il l'ajoute au plus vite.
{% endhint %}

