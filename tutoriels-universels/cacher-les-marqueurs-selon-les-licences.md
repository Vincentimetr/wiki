# Cacher les marqueurs selon les licences

## 1- Introduction <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

Ce tutoriel vous permet de cacher certain marqueurs selon les licences des joueurs \(Les joueurs commencent avec aucun marqueur sur la map et au fur et à mesure qu'ils achètent des licences, ces marqueurs apparaissent\).  
Le programme ne fait aucune sur-interraction avec la base de donnée et donc ne créer aucun lag ou réduction de performance.

{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : **60 minutes**
{% endhint %}

## 2- Installation <a id="bkmrk-page-title"></a>

**Fichiers concernés** 

* `Altis_Life.Altis/core/`**`init.sqf`**
* `Altis_Life.Altis/`**`core/functions/fn_keyHandler.sqf`**
* `Altis_Life.Altis/`**`core/functions/fn_actualiseMap.sqf`** \(a créer\)

**Mise en place**

1- **Allez** dans `Altis_Life.Altis/`**`core/functions/fn_keyHandler.sqf`** jusqu'au bloc :

```text
//Map Key
    case _mapKey: {
        switch (playerSide) do {
            case west: {if (!visibleMap) then {[] spawn life_fnc_copMarkers;}};
            case independent: {if (!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
            case civilian: {if (!visibleMap) then {[] spawn life_fnc_civMarkers;}};
        };
    };
```

  et **transformez**-le comme ceci: \(en **ajoutant** la ligne 3: `execVM "core\functions\fn_actualiseMap.sqf";` \)

```text
//Map Key
    case _mapKey: {
    	execVM "core\functions\fn_actualiseMap.sqf";
        switch (playerSide) do {
            case west: {if (!visibleMap) then {[] spawn life_fnc_copMarkers;}};
            case independent: {if (!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
            case civilian: {if (!visibleMap) then {[] spawn life_fnc_civMarkers;}};
        };
    };
```

 2- **Allez** dans `Altis_Life.Altis/`**`core/Init.sqf`** avant le bloc:

```text
switch (playerSide) do {
    case west: {
        _handle = [] spawn life_fnc_initCop;
        waitUntil {scriptDone _handle};
    };
    case civilian: {
        //Initialize Civilian Settings
        _handle = [] spawn life_fnc_initCiv;
        waitUntil {scriptDone _handle};
    };
    case independent: {
        //Initialize Medics and blah
        _handle = [] spawn life_fnc_initMedic;
        waitUntil {scriptDone _handle};
    };
};
```

 Et **ajoutez** la ligne: `execVM "core\functions\fn_actualiseMap.sqf";` comme ceci:

```text
execVM "core\functions\fn_actualiseMap.sqf";

switch (playerSide) do {
    case west: {
        _handle = [] spawn life_fnc_initCop;
        waitUntil {scriptDone _handle};
    };
    case civilian: {
        //Initialize Civilian Settings
        _handle = [] spawn life_fnc_initCiv;
        waitUntil {scriptDone _handle};
    };
    case independent: {
        //Initialize Medics and blah
        _handle = [] spawn life_fnc_initMedic;
        waitUntil {scriptDone _handle};
    };
};
```

 3- **Allez** dans `Altis_Life.Altis/`**`core/functions/`** et créez le fichier `fn_actualiseMap.sqf`

{% hint style="danger" %}
 Vous **devrez** alors répertorier TOUS vos marqueurs dans ce fichier et leur **associer** un groupe comme ceci:
{% endhint %}

```text
_market=["market_1","market_2","market_3","market_4","market_5","market_6"];
_farm_ingrat=["apple_1","peaches_1","wood_1"];
_ATM=["atm_marker_1","atm_marker_2","atm_marker_3","atm_marker_4","atm_marker_5","atm_marker_6","atm_marker_7","atm_marker_8","atm_marker_9","atm_marker_10","atm_marker_11","atm_marker_12","atm_marker_13","atm_marker_14","atm_marker_15","atm_marker_16","atm_marker_17","atm_marker_18","atm_marker_19","atm_marker_20","atm_marker_21","atm_marker_22"];
_burger=["burger_1","burger_2"];
_kebab=["kebab_1","kebab_2"];
_coffee=["coffee_1","coffee_2"];
_gen_store=["general_store_1","general_store_2","general_store_3"];
_supermarket=["supermarche_1"];
_quicaillerie=["quicaillerie_1"];
_vetements=["vetements_1","vetements_2","vetements_3","vetements_4"];
_bijouterie=["bijouterie_1"];
_bases=["base_OTAN","base_OTAN_3","Base_IDAP","Base_OCP"];
_lieux=["7News_1","fed_reserve","RebelleFringant","depannage_society"];
_fuel_storage=["fuel_storage_1","fuel_storage_2"];
_hopitaux=["hospital_1","hospital_2","hospital_3"];
_gun_store=["gun_store_1","gun_store_2"];
_garage=["civ_gar_1", "civ_gar_2", "civ_gar_3", "civ_gar_4", "civ_gar_5"];
_circuit=["circuit_1","circuit_2","kartShop_1"];
_concessionnaire_voiture=["car_1","car_2", "car_3", "car_4"];
_concessionnaire_camion=["civ_truck_shop_1","civ_truck_shop_2"];
_concessionnaire_aerien=["airshop","airshop_1","airshop_2"];
_garage_aerien=["civ_gar_aerien_1"];
_service_aerien=["air_serv_1","air_serv_2"];
_zone_chasse=["hunting_marker","hunting_zone"];
_shop_chasse=["boucherie_1"];
_dive_shop=["dive_shop_1","dive_shop_2","fish_market_1"];
_oil=["oil_field_1","oil_field_2", "Oil_processing", "oil_trader_1","oil_trader_2"];
_diamond=["diamond_mine_1", "diamond_processing", "diamond_trader"];
_salt=["salt_mine_1", "salt_processing", "salt_trader"];
_sand=["sand_mine_1", "sand_processing", "glass_trader"];
_iron=["iron_mine_1", "iron_processing", "iron_copper_trader"];
_copper=["copper_mine_1", "copper_mine_2", "iron_copper_trader"];
_dive=["dive_shop_1","dive_shop_2","fish_market_1"];
_boat=["civ_ship_5","civ_ship_2","civ_ship_3","boat_1","boat_2","boat_3"];
_bandit=["chop_shop_1","chop_shop_2","chop_shop_3","chop_shop_4","chop_shop_5","Prison","gold_bar_dealer","mine_souffre_1","mine_charbon_1","bandit_shop_1"];
_rebel=["Rebelop_1","Rebelop_2","Rebelop_3","Munitions_OTAN","rebel_shop_1"];
_drogue=["cocaine_1", "heroine_1", "weed_1", "coke_area_1","heroin_area_1","weed_area_1","cocaine_processing_1","heroin_processing_1","weed_processing_1","Dealer_1","Dealer_2","Dealer_3"];
_tortue=["turtle_dealer_1","turtle_dealer_2","turtlePoint_1","turtlePoint_2","turtlePoint_3","turtle_1","turtle_2","turtle_3"];
```

{% hint style="danger" %}
 **Mettre** les "\_" en premier dans vos groupes \(exemple: "\_garage\_aerien"\) est très important! Cela permet à la variable de rester associée au joueur seulement \(être locale\).
{% endhint %}

 4- Ensuite vous devez **associer** chaque groupe à des licences comme ceci:

```text
_marqueurs_ramasseur=_market+_farm_ingrat;
_marqueurs_citoyen=_market + _ATM + _burger+_kebab+_coffee+_gen_store+_supermarket+_quicaillerie+_vetements+_bijouterie +_bases + _lieux + _fuel_storage;
_marqueurs_soin=_hopitaux;
_marqueurs_home=[];
_marqueurs_gun=_gun_store;
_marqueurs_driver=_garage+_circuit+_concessionnaire_voiture;
_marqueurs_trucking=_concessionnaire_camion;
_marqueurs_boat=_boat;
_marqueurs_pilot=_garage_aerien;
_marqueurs_chasse=_zone_chasse+_shop_chasse;
_marqueurs_dive=_dive;
_marqueurs_depanneur=[];
_marqueurs_oil=_oil;
_marqueurs_diamond=_diamond;
_marqueurs_salt=_salt;
_marqueurs_sand=_sand;
_marqueurs_iron=_iron;
_marqueurs_copper=_copper;
_marqueurs_cement=[];
_marqueurs_medmarijuana=[];
_marqueurs_cocaine=[];
_marqueurs_heroin=[];
_marqueurs_marijuana=[];
_marqueurs_rebel=_rebel;
_marqueurs_bandit=_bandit+_tortue;
_marqueurs_terroriste=_drogue;
_marqueurs_service=_marqueurs_ramasseur+_marqueurs_citoyen+_marqueurs_soin+_marqueurs_home+_marqueurs_gun+_marqueurs_driver+_marqueurs_trucking+_marqueurs_boat+_marqueurs_pilot+_marqueurs_chasse+_marqueurs_dive+_marqueurs_depanneur+_marqueurs_oil+_marqueurs_diamond+_marqueurs_salt+_marqueurs_sand+_marqueurs_iron+_marqueurs_copper+_marqueurs_cement+_marqueurs_medmarijuana;
```

 5- Il vous faut ensuite **cacher** chacun des marqueurs comme ceci:

```text
{_x setMarkerAlphaLocal 0}foreach 
	_marqueurs_ramasseur+_marqueurs_citoyen+_marqueurs_soin+_marqueurs_home+
	_marqueurs_gun+_marqueurs_driver+_marqueurs_trucking+_marqueurs_boat+_marqueurs_pilot+
	_marqueurs_chasse+_marqueurs_dive+_marqueurs_depanneur+
	_marqueurs_oil+_marqueurs_diamond+_marqueurs_salt+
	_marqueurs_sand+_marqueurs_iron+_marqueurs_copper+_marqueurs_cement+
	_marqueurs_medmarijuana+_marqueurs_cocaine+_marqueurs_heroin+
	_marqueurs_marijuana+_marqueurs_rebel+_marqueurs_bandit+_marqueurs_terroriste+
	_marqueurs_service
;
```

 6- Enfin vous allez **rendre** visible les groupes de marqueurs selon les licences:

```text
if (license_civ_ramasseur ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_ramasseur;};
if (license_civ_citoyen ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_citoyen;};
if (license_civ_soin ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_soin;};
if (license_civ_home ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_home;};
if (license_civ_gun ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_gun;};
if (license_civ_driver ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_driver;};
if (license_civ_trucking ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_trucking;};
if (license_civ_boat ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_boat;};
if (license_civ_pilot ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_pilot;};
if (license_civ_chasse ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_chasse;};
if (license_civ_dive ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_dive;};
if (license_civ_depanneur ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_depanneur;};
if (license_civ_oil ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_oil;};
if (license_civ_diamond ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_diamond;};
if (license_civ_salt ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_salt;};
if (license_civ_sand ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_sand;};
if (license_civ_iron ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_iron;};
if (license_civ_copper ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_copper;};
if (license_civ_cement ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_cement;};
if (license_civ_medmarijuana ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_medmarijuana;};
if (license_civ_cocaine ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_cocaine;};
if (license_civ_heroin ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_heroin;};
if (license_civ_marijuana ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_marijuana;};
if (license_civ_rebel ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_rebel;};
if (license_civ_bandit ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_bandit;};
if (license_civ_terroriste ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_terroriste;};
if (side player == west || side player == resistance) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_service;};
```

 7- Le fichier final \(différent pour chacun selon les noms de ses marqueurs et du nom de ses licences\) devra ressembler a celui-ci:

{% hint style="success" %}
 NE PAS **OUBLIER** LA PREMIERE LIGNE: `#include "..\..\script_macros.hpp"`
{% endhint %}

```text
#include "..\..\script_macros.hpp" 


_market=["market_1","market_2","market_3","market_4","market_5","market_6"];
_farm_ingrat=["apple_1","peaches_1","wood_1"];
_ATM=["atm_marker_1","atm_marker_2","atm_marker_3","atm_marker_4","atm_marker_5","atm_marker_6","atm_marker_7","atm_marker_8","atm_marker_9","atm_marker_10","atm_marker_11","atm_marker_12","atm_marker_13","atm_marker_14","atm_marker_15","atm_marker_16","atm_marker_17","atm_marker_18","atm_marker_19","atm_marker_20","atm_marker_21","atm_marker_22"];
_burger=["burger_1","burger_2"];
_kebab=["kebab_1","kebab_2"];
_coffee=["coffee_1","coffee_2"];
_gen_store=["general_store_1","general_store_2","general_store_3"];
_supermarket=["supermarche_1"];
_quicaillerie=["quicaillerie_1"];
_vetements=["vetements_1","vetements_2","vetements_3","vetements_4"];
_bijouterie=["bijouterie_1"];
_bases=["base_OTAN","base_OTAN_3","Base_IDAP","Base_OCP"];
_lieux=["7News_1","fed_reserve","RebelleFringant","depannage_society"];
_fuel_storage=["fuel_storage_1","fuel_storage_2"];
_hopitaux=["hospital_1","hospital_2","hospital_3"];
_gun_store=["gun_store_1","gun_store_2"];
_garage=["civ_gar_1", "civ_gar_2", "civ_gar_3", "civ_gar_4", "civ_gar_5"];
_circuit=["circuit_1","circuit_2","kartShop_1"];
_concessionnaire_voiture=["car_1","car_2", "car_3", "car_4"];
_concessionnaire_camion=["civ_truck_shop_1","civ_truck_shop_2"];
_concessionnaire_aerien=["airshop","airshop_1","airshop_2"];
_garage_aerien=["civ_gar_aerien_1"];
_service_aerien=["air_serv_1","air_serv_2"];
_zone_chasse=["hunting_marker","hunting_zone"];
_shop_chasse=["boucherie_1"];
_dive_shop=["dive_shop_1","dive_shop_2","fish_market_1"];
_oil=["oil_field_1","oil_field_2", "Oil_processing", "oil_trader_1","oil_trader_2"];
_diamond=["diamond_mine_1", "diamond_processing", "diamond_trader"];
_salt=["salt_mine_1", "salt_processing", "salt_trader"];
_sand=["sand_mine_1", "sand_processing", "glass_trader"];
_iron=["iron_mine_1", "iron_processing", "iron_copper_trader"];
_copper=["copper_mine_1", "copper_mine_2", "iron_copper_trader"];
_dive=["dive_shop_1","dive_shop_2","fish_market_1"];
_boat=["civ_ship_5","civ_ship_2","civ_ship_3","boat_1","boat_2","boat_3"];
_bandit=["chop_shop_1","chop_shop_2","chop_shop_3","chop_shop_4","chop_shop_5","Prison","gold_bar_dealer","mine_souffre_1","mine_charbon_1","bandit_shop_1"];
_rebel=["Rebelop_1","Rebelop_2","Rebelop_3","Munitions_OTAN","rebel_shop_1"];
_drogue=["cocaine_1", "heroine_1", "weed_1", "coke_area_1","heroin_area_1","weed_area_1","cocaine_processing_1","heroin_processing_1","weed_processing_1","Dealer_1","Dealer_2","Dealer_3"];
_tortue=["turtle_dealer_1","turtle_dealer_2","turtlePoint_1","turtlePoint_2","turtlePoint_3","turtle_1","turtle_2","turtle_3"];

//////////////////////////////////////////////////
_marqueurs_ramasseur=_market+_farm_ingrat;
_marqueurs_citoyen=_market + _ATM + _burger+_kebab+_coffee+_gen_store+_supermarket+_quicaillerie+_vetements+_bijouterie +_bases + _lieux + _fuel_storage;
_marqueurs_soin=_hopitaux;
_marqueurs_home=[];
_marqueurs_gun=_gun_store;
_marqueurs_driver=_garage+_circuit+_concessionnaire_voiture;
_marqueurs_trucking=_concessionnaire_camion;
_marqueurs_boat=_boat;
_marqueurs_pilot=_garage_aerien;
_marqueurs_chasse=_zone_chasse+_shop_chasse;
_marqueurs_dive=_dive;
_marqueurs_depanneur=[];
_marqueurs_oil=_oil;
_marqueurs_diamond=_diamond;
_marqueurs_salt=_salt;
_marqueurs_sand=_sand;
_marqueurs_iron=_iron;
_marqueurs_copper=_copper;
_marqueurs_cement=[];
_marqueurs_medmarijuana=[];
_marqueurs_cocaine=[];
_marqueurs_heroin=[];
_marqueurs_marijuana=[];
_marqueurs_rebel=_rebel;
_marqueurs_bandit=_bandit+_tortue;
_marqueurs_terroriste=_drogue;
_marqueurs_service=_marqueurs_ramasseur+_marqueurs_citoyen+_marqueurs_soin+_marqueurs_home+_marqueurs_gun+_marqueurs_driver+_marqueurs_trucking+_marqueurs_boat+_marqueurs_pilot+_marqueurs_chasse+_marqueurs_dive+_marqueurs_depanneur+_marqueurs_oil+_marqueurs_diamond+_marqueurs_salt+_marqueurs_sand+_marqueurs_iron+_marqueurs_copper+_marqueurs_cement+_marqueurs_medmarijuana;

{_x setMarkerAlphaLocal 0}foreach 
	_marqueurs_ramasseur+_marqueurs_citoyen+_marqueurs_soin+_marqueurs_home+
	_marqueurs_gun+_marqueurs_driver+_marqueurs_trucking+_marqueurs_boat+_marqueurs_pilot+
	_marqueurs_chasse+_marqueurs_dive+_marqueurs_depanneur+
	_marqueurs_oil+_marqueurs_diamond+_marqueurs_salt+
	_marqueurs_sand+_marqueurs_iron+_marqueurs_copper+_marqueurs_cement+
	_marqueurs_medmarijuana+_marqueurs_cocaine+_marqueurs_heroin+
	_marqueurs_marijuana+_marqueurs_rebel+_marqueurs_bandit+_marqueurs_terroriste+
	_marqueurs_service
;

if (license_civ_ramasseur ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_ramasseur;};
if (license_civ_citoyen ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_citoyen;};
if (license_civ_soin ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_soin;};
if (license_civ_home ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_home;};
if (license_civ_gun ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_gun;};
if (license_civ_driver ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_driver;};
if (license_civ_trucking ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_trucking;};
if (license_civ_boat ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_boat;};
if (license_civ_pilot ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_pilot;};
if (license_civ_chasse ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_chasse;};
if (license_civ_dive ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_dive;};
if (license_civ_depanneur ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_depanneur;};
if (license_civ_oil ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_oil;};
if (license_civ_diamond ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_diamond;};
if (license_civ_salt ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_salt;};
if (license_civ_sand ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_sand;};
if (license_civ_iron ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_iron;};
if (license_civ_copper ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_copper;};
if (license_civ_cement ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_cement;};
if (license_civ_medmarijuana ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_medmarijuana;};
if (license_civ_cocaine ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_cocaine;};
if (license_civ_heroin ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_heroin;};
if (license_civ_marijuana ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_marijuana;};
if (license_civ_rebel ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_rebel;};
if (license_civ_bandit ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_bandit;};
if (license_civ_terroriste ) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_terroriste;};
if (side player == west || side player == resistance) then {{_x setMarkerAlphaLocal 1}foreach _marqueurs_service;};
```

**Accès aux problèmes récurrents**

Si vous rencontrez des problèmes avec le tutoriel, **rendez-vous** dans la page suivante intitulé _Problèmes Récurrents ****_pour trouver une réponse à votre problème.  

Merci de consulter les Problèmes Récurrents avant de créer un sujet dans l'Aide & Support de notre Forum.

