# Mettre en place une White-list

## 1. Introduction <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

Ce tutoriel vous montrera comment créer une white-list via une base de données. Ce script est compatible avec toute version qui utilise le remoteExec \(donc + de version 3.x\).

Le niveau d'installation de ce script est très faible.

J'utilise Extdb3 mais Extdb2 fonctionne tout aussi bien.

**Éléments à télécharger**

Les fichiers à **télécharger** sont:

{% file src="../.gitbook/assets/whitelist \(1\).sql" %}

{% file src="../.gitbook/assets/fn\_whitelist.sqf" %}

{% file src="../.gitbook/assets/fn\_whitelistres \(1\).sqf" %}



{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : **2-5 minutes**
{% endhint %}

## 2. Installation <a id="bkmrk-page-title"></a>

### **Mise en place**

Placer donc les fichiers précédemment téléchargés dans les dossiers ci-dessous:

* fn\_whiteList.sqf :  `\life_server\Functions\MySQL\`
* fn\_whitelistRes.sqf qui devra être placer ici: `\core\functions\`

Puis exécuter le fichier whitelist.sql dans votre base de données. Pour exécuter ce fichier dans votre base de données, c'est pareil que quand vous avez installer la base de données altis life.

Les fichiers à modifier \(dans l'ordre\) sont:

* `\life_server\config.cpp`
* `Altis_Life.altis\Functions.hpp`
* `Altis_Life.altis\CfgRemoteExec.hpp`
* `Altis_Life.altis\description.ext`
* `Altis_Life.altis\core\init.sqf`

\*\*\*\*

### **Coté serveur**

* Allez dans le fichier `\life_server\config.cpp`

En dessous de :

```text
class updatePartial {};
```

Vous devrez donc ajouter cette ligne:

```text
class whiteList {};
```

{% hint style="info" %}
Ce qui donnera par exemple:
{% endhint %}

```text
    class MySQL_Database {
        tag = "DB";
        class MySQL
        {
            file = "\life_server\Functions\MySQL";
            class numberSafe {};
            ...
            ...
            ...
            class updatePartial {};
            class whiteList {};
        };
    };
```

### \*\*\*\*

### **Coté mission**

* Allez dans le fichier `Altis_Life.altis\Functions.hpp`

En dessous de :

```text
file = "core\functions";
```

 Vous devrez donc ajouter cette ligne:

```text
class whitelistRes {};
```

{% hint style="info" %}
Ce qui donnera par exemple:
{% endhint %}

```text
    class Functions {
        file = "core\functions";
        class whitelistRes {};
        class AAN {};
        class accType {};
        class actionKeyHandler {};
        ...
        ...
        ...
    };
```

* Allez dans le fichier `Altis_Life.altis\CfgRemoteExec.hpp`

En dessous de :

```text
F(TON_fnc_houseGarage,SERVER)
```

 Vous devrez donc ajouter ces lignes:

```text
F(life_fnc_whitelistRes,CLIENT)
F(DB_fnc_whiteList,SERVER)
```

{% hint style="info" %}
 Ce qui donnera par exemple:
{% endhint %}

```text
...
...
...
F(TON_fnc_vehicleUpdate,SERVER)
F(TON_fnc_handleBlastingCharge,SERVER)
F(TON_fnc_houseGarage,SERVER)
F(life_fnc_whitelistRes,CLIENT)
F(DB_fnc_whiteList,SERVER)
```

* Allez dans le fichier `Altis_Life.altis\description.ext`

En dessous de :

```text
class CfgDebriefing {
    class NotWhitelisted {
        title = "$STR_NotWhitelisted_Title";
        subtitle = "$STR_NotWhitelisted_SubTitle";
        description = "$STR_NotWhitelisted_Descript";
        pictureBackground = "";
        picture = "";
        pictureColor[] = {0,0.3,0.6,1};
    };
```

 Vous devrez donc ajouter ces lignes:

```text
    class NotWhitelistedServer
    {
        title = "Mission echouée";
        subtitle = "WhiteList du serveur";
        description = "Vous n'êtes dans la whiteList du serveur, contactez un administrateur.";
        pictureBackground = "";
        picture = "";
        pictureColor[] = {0,0.3,0.6,1};
    };
```

{% hint style="info" %}
Ce qui donnera par exemple:
{% endhint %}

```text
class CfgDebriefing {
    class NotWhitelisted {
        title = "$STR_NotWhitelisted_Title";
        subtitle = "$STR_NotWhitelisted_SubTitle";
        description = "$STR_NotWhitelisted_Descript";
        pictureBackground = "";
        picture = "";
        pictureColor[] = {0,0.3,0.6,1};
    };
    class NotWhitelistedServer
    {
        title = "Mission echouée";
        subtitle = "WhiteList du serveur";
        description = "Vous n'êtes dans la whiteList du serveur, contactez un administrateur.";
        pictureBackground = "";
        picture = "";
        pictureColor[] = {0,0.3,0.6,1};
    };
```



* Allez dans le fichier `Altis_Life.altis\core\init.sqf`

**Au dessus** de :

```text
[] call SOCK_fnc_dataQuery;
```

Vous devrez donc ajouter ce bout de code:

```text
diag_log "::Life Client:: Check if player is in whiteList.";
0 cutText ["Verification dans la whiteLife","BLACK FADED"];
0 cutFadeOut 99999999;
whiteListCheck = false;
isInWL = false;
[getPlayerUID player,player] remoteExecCall ["DB_fnc_whiteList",RSERV];
waitUntil {whiteListCheck};
if(!isInWL)exitWith{
    0 cutText ["Vous n'êtes pas dans la whiteList, veuillez contacter un administrateur du serveur.","BLACK FADED"];
    0 cutFadeOut 99999999;
    ["NotWhitelistedServer",false,true] call BIS_fnc_endMission;
};
isInWL= nil;
whiteListCheck = nil;
```

{% hint style="info" %}
 Ce qui donnera par exemple:
{% endhint %}

```text
if (!isNil "_extDB_notLoaded" && {_extDB_notLoaded isEqualType []}) exitWith {
    diag_log _extDB_notLoaded;
    999999 cutText ["extDB failed to load, please contact an administrator.","BLACK FADED"];
    999999 cutFadeOut 99999999;
};

diag_log "::Life Client:: Check if player is in whiteList.";
0 cutText ["Verification dans la whiteLife","BLACK FADED"];
0 cutFadeOut 99999999;
whiteListCheck = false;
isInWL = false;
[getPlayerUID player,player] remoteExecCall ["DB_fnc_whiteList",RSERV];
waitUntil {whiteListCheck};
if(!isInWL)exitWith{
    0 cutText ["Vous n'êtes pas dans la whiteList, veuillez contacter un administrateur du serveur.","BLACK FADED"];
    0 cutFadeOut 99999999;
    ["NotWhitelistedServer",false,true] call BIS_fnc_endMission;
};
isInWL= nil;
whiteListCheck = nil;

[] call SOCK_fnc_dataQuery;
```



