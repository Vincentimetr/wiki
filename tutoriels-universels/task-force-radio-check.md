# Task Force Radio check

## Installation <a id="bkmrk-page-title"></a>

**1.1 Direction : description.ext !**

Rajouter dans la class  : CfgDebriefing

```text
class Ts3Server {
     title = "Task Force Radio";
     subtitle = "Tasf Force radio est obligatoire pour jouer !";
     description = "Merci d'avoir votre task Force Radio pour pouvoir jouer sur notre serveur";
     pictureBackground = "";
     picture = "";
     pictureColor[] = {0,0.3,0.6,1};
 };
```

**1.2 Direction : /core/Configuration.sqf**

Rajouter c'est  4 variable global :

```text
tsServer = "";
tsChannel = "";
life_mauvaisTs = false;
life_mauvaisChan = false;
```

1.3 Direction : /core/fn\_survival.sqf  

Au dessus du UiSleep rajouter :

```text
tsServer = [] call TFAR_fnc_getTeamSpeakServerName;
tsChannel = [] call TFAR_fnc_getTeamSpeakChannelName;
if(tsServer != "Nom du server ts3") then {
     life_mauvaisTs = true;
} else {
     life_mauvaisTs = false;
     if(tsChannel != "Nom de votre channel") then {
     life_mauvaisChan = true;
} else {
    life_mauvaisChan = false;
  };
};
```

{% hint style="info" %}
 Pensez a modifiée les informations avec les vôtres.
{% endhint %}

**1.4 Direction : /core/init.sqf**

Chercher :

`getPlayerUID player,player getVariable ["realname",name player]] remoteExec ["life_fnc_wantedProfUpdate",RSERV];`

Ajouter en dessous :

```text
[] spawn {
    sleep 15;
    while {true} do
    {
        waitUntil {life_mauvaisTs};
        hint "Le Task Force radio est obligatoire";
        sleep 10;
        if (life_mauvaisTs) then {
            0 cutText ["Merci de vous connecter sur le teamspeak", "BLACK FADED"];
            0 cutFadeOut 99999;
            disableUserInput true;
            [] spawn {
                sleep 120;
                if (life_mauvaisTs) then {
                    [] call SOCK_fnc_updateRequest;
                    sleep 5;
                    ["Ts3Server", false, true] call BIS_fnc_endMission;
                };
            };
            waitUntil {!life_mauvaisTs};
            disableUserInput false;
            0 cutText ["", "BLACK IN"];
            hint 'Merci de rester dans le teamspeak dédié a Task Force';
        };
    };
};
[] spawn {
    sleep 15;
    while {true} do
    {
        waitUntil {life_mauvaisChan};
        hint "Le Task Force radio est obligatoire";
        sleep 10;
        if (life_mauvaisChan) then {
            0 cutText ["Merci de vous connecter sur le bon channel Task Force Radio", "BLACK FADED"];
            0 cutFadeOut 99999;
            disableUserInput true;
            [] spawn {
                sleep 120;
                if (life_mauvaisChan) then {
                    [] call SOCK_fnc_updateRequest;
                    sleep 5;
                    ["Ts3Server", false, true] call BIS_fnc_endMission;
                };
            };
            waitUntil {!life_mauvaisChan};
            disableUserInput false;
            0 cutText ["", "BLACK IN"];
            hint 'Merci de rester dans le channel dédié a Task Force';
        };
    };
};
```

{% hint style="success" %}
 Hé voila c'est pas plus bête :\)
{% endhint %}



