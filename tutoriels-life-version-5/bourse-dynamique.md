# Bourse Dynamique

## 1- Introduction <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

Ce tutoriel va vous permettre de mettre en place une bourse dynamique sur votre serveur. Cette bourse est relativement modifiable, et facile d'utilisation pour le joueur.

Source & Repo Git : [https://github.com/dbenson24/Framework-1/tree/dynamicmarket](https://github.com/dbenson24/Framework-1/tree/dynamicmarket)

Crédits : [FeaReD\_Glock](https://altisdev.com/user/feared_glock)

**Aperçu du résultat une fois implanté**

[![SLZNRrGZu0qbuWaR-vZEmXr0sSeCwbInYFrdnDA.png](https://wiki.altisdev.com/uploads/images/gallery/2017-09-Sep/scaled-840-0/SLZNRrGZu0qbuWaR-vZEmXr0sSeCwbInYFrdnDA.png)](https://wiki.altisdev.com/uploads/images/gallery/2017-09-Sep/SLZNRrGZu0qbuWaR-vZEmXr0sSeCwbInYFrdnDA.png)

**Éléments complémentaires à télécharger** 

Vous devez maintenant **télécharger** l'archive _Bourse.rar_ en fichier joint.

{% hint style="info" %}
Niveau de difficulté : **Moyen**  
Temps requis : **10-12 minutes**
{% endhint %}

## 2- Installation & Configuration <a id="bkmrk-page-title"></a>

**Fichiers concernés** 

Fichiers et dossiers concernés durant le tutoriel : 

* `/mpmissions/Altis_Life.Altis/`**`CfgRemoteExec.hpp`**
* `/mpmissions/Altis_Life.Altis/`**`functions.hpp`**
* `/mpmissions/Altis_Life.Altis/config/`**`Config_Master.hpp`**
* `/mpmissions/Altis_Life.Altis/config/`**`Config_vItems.hpp`**
* `/mpmissions/Altis_Life.Altis/core/`**`economy`**
* `/mpmissions/Altis_Life.Altis/core/functions/`**`fn_keyHandler.sqf`**
* `/mpmissions/Altis_Life.Altis/core/shops/`**`fn_virt_sell.sqf`**
* `/mpmissions/Altis_Life.Altis/core/shops/`**`fn_virt_update.sqf`**
* `/mpmissions/Altis_Life.Altis/dialog/`**`MasterHandler.hpp`**
* `/mpmissions/Altis_Life.Altis/dialog/`**`market.hpp`**
* `/mpmissions/Altis_Life.Altis/`**`script_macros.hpp`**
* `/life_server/`**`config.cpp`**
* `/life_server/`**`init.sqf`**
* `/life_server/`**`script_macros.hpp`**
* `/mpmissions/Altis_Life.Altis/core/economy/`**`fn_updateEconomy.sqf`**

**Mise en place du Altis\_Life.Altis**

1- **Allez** dans _CfgRemoteExec.hpp_ et ajouter :

```text
F(TON_fnc_adjustPrices,SERVER)
```

 2- Dans _Functions.hpp_ **ajoutez** :

```text
class Economy {
        file="core\economy";
        class marketGrab {};
        class openEconomy {};
        class retrievePrices {};
        class updateEconomy {};
        class updatePrice {};
    };
```

 3- Dans _Config\_Master.hpp_ **ajoutez** :

```text
/* Dynamic Market */
    dynamic_market = false; //True enables Dynamic Market
    dynamic_market_persistence = true; //True makes price changes last across restarts
    end_time = 14400; //Last time to sync prices (Default: 4 hours)
    sync_rate = 900; //Seconds between syncs to database (Default: 15 minutes)
    adjustment_delay = 120; //Seconds it takes for price changes to hit the market (Default: 2 minutes)
    //Order these by factor starting with a factor of 1 (Default: Illegal - 1, Natural Resources - 2, Hunting - 3)
    market_categories[] = { "------------Illegal Goods------------","--------Natural Resources--------","-----Hunting and Gathering-----"};
```

 4- Dans _Config\_vItems.hpp_ **ajoutez** :

```text
varPrice = 2;
maxPrice = 3072;
minPrice = 1280;
factor = 1;
```

{% hint style="danger" %}
 **Attention** : **modifiez** le prix pour qu’il corresponde au votre  
Exemple : \(Factor : 1 = Illegale / 2 = Ressource / 3 = Chasse-Peche et 0 = N’apparaît pas\)   
D’ailleurs **pensez** aussi à mettre seulement les ressources vendables et ne pas **mettez** les _unprocessed_    
{% endhint %}

5- Ensuite **créez** le dossier `economy` à placer dans le dossier `/core` et **placez** les fichiers contenus dans l’archive téléchargeable en fichier joint.  

6- Dans _fn\_keyHandler.sqf_ **ajoutez** :

```text
//3 Market
    case 4:
    {
        if (playerSide == civilian && player getVariable["restrained",false]) then
        {
            hint "You cannot open the market when you're restrained!";
        }
        else
        {
            if (dialog) exitWith {};
            [] call life_fnc_OpenEconomy;
        };
    };
```

7- Dans _fn\_virt\_sell.sqf_ **supprimez** ou **commentez** :1

```text
_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");
```

Et **ajoutez** en dessous :1

```text
_price = lbValue[2402,(lbCurSel 2402)];
```

8- Puis, après :1

```text
[] call life_fnc_virt_update;
```

**Ajoutez** :

```text
if ((LIFE_SETTINGS(getNumber, "dynamic_market")) isEqualTo 1) then {
        [0,player,life_shop_type,_amount,_price,_type] remoteExec ["TON_fnc_adjustPrices",RSERV];
    };
```

 Comme ceci :

```text
[] call life_fnc_virt_update;
    if ((LIFE_SETTINGS(getNumber, "dynamic_market")) isEqualTo 1) then {
        [0,player,life_shop_type,_amount,_price,_type] remoteExec ["TON_fnc_adjustPrices",RSERV];
    };
};
```

 9- Dans _fn\_virt\_update.sqf_ **remplacez** par :

```text
#include "..\..\script_macros.hpp"
/*
    File: fn_virt_update.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Update and fill the virtual shop menu.
*/
private ["_item_list","_gear_list","_shopItems","_name","_price"];
disableSerialization;

//Setup control vars.
_item_list = CONTROL(2400,2401);
_gear_list = CONTROL(2400,2402);

//Purge list
lbClear _item_list;
lbClear _gear_list;

if (!isClass(missionConfigFile >> "VirtualShops" >> life_shop_type)) exitWith {closeDialog 0; hint localize "STR_NOTF_ConfigDoesNotExist";}; //Make sure the entry exists..
ctrlSetText[2403,localize (M_CONFIG(getText,"VirtualShops",life_shop_type,"name"))];

[0, life_shop_type] spawn life_fnc_retrievePrices;
```

10- Dans _MasterHandler.hpp_ **ajoutez** :1

```text
#include "market.hpp"
```

 11- **Créez** le fichier _market.hpp_ dans `/mpmissions/Altis_Life.Altis/`**`dialog/`** et **ajoutez-y** ceci ****:

```text
class Market
{
    idd = 39000;
    name = "Market";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class TitleBackground: Life_RscText
        {
            idc = 1000;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0.05,0.5,0.05,0.8};
            colorActive[] = {0.05,0.5,0.05,0.8};
        };
        class MarketBackground: Life_RscText
        {
            idc = 1001;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.506 * safezoneH;
            colorBackground[] = {0,0,0,0.6};
        };
        class Title: Life_RscText
        {
            idc = 1002;
            text = "The Market"; //--- ToDo: Localize;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.044 * safezoneH;
        };
    };

    class Controls
    {
        class GoodsDisplay: Life_RscListbox
        {
            idc = 39001;
            text = "";
            sizeEx = 0.035;
            onLBSelChanged = "[] spawn life_fnc_marketGrab";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.418 * safezoneH;
        };
        class GoodsTitle: Life_RscText
        {
            idc = -1;
            text = "Goods"; //--- ToDo: Localize;
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0360937 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class InfoTitle: Life_RscText
        {
            idc = -1;
            text = "Information"; //--- ToDo: Localize;
            x = 0.515469 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0567187 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class CurrentGood: Life_RscText
        {
            idc = 39002;
            text = "Current Good:"; //--- ToDo: Localize;
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class CurrentPrice: Life_RscText
        {
            idc = 39003;
            text = "Current Price:"; //--- ToDo: Localize;
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RecentPrice: Life_RscText
        {
            idc = 39004;
            text = "Most Recent Price:"; //--- ToDo: Localize;
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RecentChange: Life_RscText
        {
            idc = 39005;
            text = "Most Recent Change:"; //--- ToDo: Localize;
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class StartPrice: Life_RscText
        {
            idc = 39006;
            text = "Server Start Price:"; //--- ToDo: Localize;
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class StartChange: Life_RscText
        {
            idc = 39007;
            text = "Change Since Server Start:"; //--- ToDo: Localize;
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class ExitButton: Life_RscButtonMenu
        {
            idc = 39008;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.654688 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0360937 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0.05,0.5,0.05,0.8};
            colorActive[] = {0.05,0.5,0.05,0.8};
        };
    };
};
```

 12- **Ajoutez** dans _script\_macros.hpp_ :

```text
//System Macros
#define ITEM_WEIGHT(varName) M_CONFIG(getNumber,"VirtualItems",varName,"weight")
#define ITEM_VARPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"varPrice")
#define ITEM_MAXPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"maxPrice")
#define ITEM_MINPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"minPrice")
#define ITEM_FACTOR(varName) M_CONFIG(getNumber,"VirtualItems",varName,"factor")

```

{% hint style="danger" %}
 **IMPORTANT : Pensez** à modifier vos prix dans le schéma SQL \(_altislife.sql_\) 
{% endhint %}

13- **Ajoutez** à votre base de donnée le schéma **altislife.sql** en l'important. 

Voici comment importer un fichier **.sql** sur : 

→ PhpMyAdmin : [https://docs.phpmyadmin.net/fr/latest/import\_export.html](https://docs.phpmyadmin.net/fr/latest/import_export.html)

→ HeidiSQL : [https://support.appliedi.net/kb/a1034/how-to-import-and-export-a-mysql-database-using-heidisql.aspx](https://support.appliedi.net/kb/a1034/how-to-import-and-export-a-mysql-database-using-heidisql.aspx)

→ Navicat : [http://wiki.navicat.com/fr/index.php/Comment\_puis-je\_importer\_un\_fichier\_SQL\_sur\_le\_serveur\_%3F](http://wiki.navicat.com/fr/index.php/Comment_puis-je_importer_un_fichier_SQL_sur_le_serveur_%3F)

**Mise en place du life\_server**

14- **Créez** un dossier `economy` dans `/mpmissions/Altis_Life.Altis/`**`functions`** puis **ajoutez** les fichiers de l’archive disponible en fichier joint.  

15- Dans le `life_server/`**`config.cpp`** **ajoutez** en dessous du `housing` :

```text
class Economy {
        file = "\life_server\Functions\Economy";
        class adjustPrices {};
        class loadPrices {};
        class syncPrices {};
};
```

 16- Dans **``**`life_server/`**`init.sqf`** **ajoutez** :

```text
/* Start dynamic market syncing */
 [] spawn TON_fnc_syncPrices;
```

 En dessous de :

```text
/* Tell clients that the server is ready and is accepting queries */
life_server_isReady = true;
publicVariable "life_server_isReady";
```

 17- Dans `life_server/`**`script_macros.hpp`** **modifiez** :

```text
#define ITEM_ILLEGAL(varName) M_CONFIG(getNumber,"VirtualItems",ITEM_VARNAME(varName),"illegal")
#define ITEM_SELLPRICE(varName) M_CONFIG(getNumber,"VirtualItems",ITEM_VARNAME(varName),"sellPrice")
#define ITEM_BUYPRICE(varName) M_CONFIG(getNumber,"VirtualItems",ITEM_VARNAME(varName),"buyPrice")
```

Par

```text
#define ITEM_ILLEGAL(varName) M_CONFIG(getNumber,"VirtualItems",varName,"illegal")
#define ITEM_SELLPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"sellPrice")
#define ITEM_BUYPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"buyPrice")
```

 Et **ajoutez** en dessous :

```text
#define ITEM_VARPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"varPrice")
#define ITEM_MAXPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"maxPrice")
#define ITEM_MINPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"minPrice")
#define ITEM_FACTOR(varName) M_CONFIG(getNumber,"VirtualItems",varName,"factor")
```

18- **Ajoutez** dans _script\_macros.hpp_

```text

```

1

```text
#define ITEM_ICON(varName) M_CONFIG(getText,"VirtualItems",varName,"icon")
```

**Éditez** le fichier : fn\_updateEconomy.sqf qui se trouve dans `/mpmissions/Altis_Life.Altis/core/economy/`**`fn_updateEconomy.sqf`**

Dans l’`array` du `private` **ajoutez** `_icon`

Dans la boucle `forEach life_market`, **ajoutez** sous le dernier `_name` :1

```text
_icon = ITEM_ICON((_x select 0));
```

Et sous le dernier `_goodlist` :1

```text
_goodlist lbSetPicture [(lbSize _goodlist)-1,_icon];
```

Comme ceci :

```text
#include "..\..\script_macros.hpp"
/*
    File: fn_updateEconomy.sqf
    Author: Worldtrade1101
    Edited by: Derek
    Base on Tonic script

    Description:
    Update and fill the Economy gui menu.
*/
private["_display","_name","_factor","_categories","_goodlist","_icon"];
disableSerialization;
params [
    ["_type", 0],
    ["_market", []]
];
life_market = _market;

//Setup control vars.
_display = findDisplay 39000;
_goodlist = _display displayCtrl 39001;

//Purge list
lbClear _goodlist;

if (count life_market isEqualTo 0) exitwith {};

_categories = LIFE_SETTINGS(getArray, "market_categories");
_factor = 1;
{
    _goodlist lbAdd _x;
    _goodlist lbSetValue [(lbSize _goodlist)-1,(_factor*2)-1];
    _factor = _factor + 1;
} forEach _categories;

{
    if ((_x select 2) > 1 ) then {
        _name = ITEM_NAME((_x select 0));
		_icon = ITEM_ICON((_x select 0));
        _goodlist lbAdd format["%1",(localize _name)];
        _goodlist lbSetData [(lbSize _goodlist)-1,_x select 0];
        _goodlist lbSetValue [(lbSize _goodlist)-1,2*(_x select 6)];
        _goodlist lbSetPicture [(lbSize _goodlist)-1,_icon];

    };
} foreach life_market;

lbSortByValue _goodlist;
```

**Petit plus - ajouter des icônes \(Facultatif\)**

Si vous voulez que le marché ressemble à [ceci](https://wiki.altisdev.com/attachments/74)

**Éditez** le fichier : fn\_updateEconomy.sqf qui se trouve dans `/mpmissions/Altis_Life.Altis/core/economy/`**`fn_updateEconomy.sqf`**

dans la boucle `forEach life_market`, **modifiez** :1

```text
_goodlist lbAdd format["%1",(localize _name)];
```

par

```text
_goodlist lbAdd format["%1(%2)",(localize _name),(_x select 2)];
```

Et le _market.hpp_ **remplacez** le par :

```text
class Market
{
    idd = 39000;
    name = "Market";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class TitleBackground: Life_RscText
        {
            idc = 1000;
            x = SafeZoneX + (669.999999999999 / 1920) * SafeZoneW;
			y = SafeZoneY + (312.999999999999 / 1080) * SafeZoneH;
			w = (494.999999999999 / 1920) * SafeZoneW;
			h = (16.0000000000001 / 1080) * SafeZoneH;
            colorBackground[] = {0.05,0.5,0.05,0.8};
            colorActive[] = {0.05,0.5,0.05,0.8};
        };
        class MarketBackground: Life_RscText
        {
            idc = 1001;
            x = SafeZoneX + (669.999999999999 / 1920) * SafeZoneW;
			y = SafeZoneY + (330.833333333333 / 1080) * SafeZoneH;
			w = (494.999999999999 / 1920) * SafeZoneW;
			h = (315.999999999999 / 1080) * SafeZoneH;
            colorBackground[] = {0,0,0,0.6};
        };
        class Title: Life_RscText
        {
            idc = 1002;
            text = "Economie de l'île d'Altis"; //--- ToDo: Localize;
            x = SafeZoneX + (669.999999999999 / 1920) * SafeZoneW;
			y = SafeZoneY + (312.999999999999 / 1080) * SafeZoneH;
			w = (494.999999999999 / 1920) * SafeZoneW;
			h = (16.0000000000001 / 1080) * SafeZoneH;
        };
    };

    class Controls
    {
        class GoodsDisplay: Life_RscListbox
        {
            idc = 39001;
            text = "";
            sizeEx = 0.035;
            onLBSelChanged = "[] spawn life_fnc_marketGrab";
            x = SafeZoneX + (683.333333333333 / 1920) * SafeZoneW;
			y = SafeZoneY + (342.5 / 1080) * SafeZoneH;
			w = (465 / 1920) * SafeZoneW;
			h = (290.000000000001 / 1080) * SafeZoneH;
        };
       
        class ExitButton: Life_RscButtonMenu
        {
            idc = 39008;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = SafeZoneX + (1083 / 1920) * SafeZoneW;
			y = SafeZoneY + (646.166666666667 / 1080) * SafeZoneH;
			w = (80.9999999999999 / 1920) * SafeZoneW;
			h = (20 / 1080) * SafeZoneH;
            colorBackground[] = {0.05,0.5,0.05,0.8};
            colorActive[] = {0.05,0.5,0.05,0.8};
        };
    };
};
```

A vous de le modifier à votre guise à partir de là.

**Accès aux problèmes récurrents**

Si vous rencontrez des problèmes avec le tutoriel, **rendez-vous** dans la page suivante intitulé _Problèmes Récurrents ****_pour trouver une réponse à votre problème.  

Merci de consulter les Problèmes Récurrents avant de créer un sujet dans l'Aide & Support de notre Forum.

