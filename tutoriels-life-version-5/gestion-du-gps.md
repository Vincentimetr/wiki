# Gestion du GPS

## 1- Introduction <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

 Ce tutoriel vous propose de rendre invisible sur la map pour les membres d'un même gang si ils ne possèdent pas de GPS ou si ils sont menottés.

{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : **5 minutes**
{% endhint %}

## 2- Mise en place <a id="bkmrk-page-title"></a>

**Fichiers concernés** 

 `Altis_Life.Altis/`**`core/civilian/fn_civMarkers.sqf`**

**Mise en place**

1- **Remplacez le script actuel par celui-ci:**  

```c
private ["_markers", "_members"];

_markers = [];
_members = [];

for "_i" from 0 to 1 step 0 do {
    sleep 0.5;
    if (visibleMap) then {
        _members = units (group player);
        {
            if (!(_x isEqualTo player) && !(_x getVariable "restrained") && ("ItemGPS" in (assignedItems _X)) && ("ItemGPS" in (assignedItems player))) then {
                _marker = createMarkerLocal [format ["%1_marker", _x], visiblePosition _x];
                _marker setMarkerColorLocal "ColorCivilian";
                _marker setMarkerTypeLocal "Arrow";
                _marker setMarkerTextLocal format ["%1", _x getVariable ["realname", name _x]];
                _markers pushBack [_marker, _x];
            };
        } forEach _members;

        while {visibleMap} do {
            {
                private ["_unit"];
                _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit && !(_unit getVariable "restrained")) then {
                    (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            } forEach _markers;
            if (!visibleMap) exitWith { };
            sleep 0.02;
        };

        { deleteMarkerLocal (_x select 0); } forEach _markers;
        _markers = [];
        _members = [];
    };
};
```



