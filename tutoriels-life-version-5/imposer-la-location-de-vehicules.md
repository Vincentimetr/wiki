# Imposer la location de véhicules

## 1- Introduction <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

Ce tutoriel va permettre de restreindre les véhicules disponibles pour les policiers / médecins à la location uniquement, et donc rendre inaccessible l'achat définitif d'un véhicule. Cela peut être pratique pour permettre aux fonctionnaires de votre serveur d'avoir des véhicules de fonction, sans pour autant que ces véhicules leur appartiennent.

Crédits : [kovix5519](https://altisdev.com/user/kovix5519)

**Aperçu du résultat une fois implanté**

Aucune aperçu disponible, car non nécessaire pour le tutoriel actuel.

{% hint style="info" %}
 Niveau de difficulté : **Facile**  
Temps requis : **3 minutes**
{% endhint %}

## 2- Installation <a id="bkmrk-page-title"></a>

**Fichiers concernés** 

* `Altis_Life.Altis/config/`**`Config_Master.hpp`**
* `/mpmissions/Altis_Life.Altis/config/`**`Config_Vehicles.hpp`**

**Mise en place**

1- **Allez** dans `Altis_Life.Altis/config/`**`Config_Master.hpp`** puis **cherchez** : 1

```text
/* Vehicle System Configurations */
```

Vous trouverez sous cette ligne commentée ceci : 1

```text
vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F", "B_Boat_Armed_01_minigun_F" };
```

Il vous suffira simplement d'inclure le classname d'un nouveau véhicule pour l'ajouter aux véhicules uniquement louables.

2- Ci-dessous un exemple permettant d'illustrer la manipulation : 

Exemple :

{% hint style="info" %}
J’ai mis a disposition un blindé et je ne veux pas que mes gendarmes le possède dans leur garage.
{% endhint %}

Le véhicule étant [celui-ci](https://community.bistudio.com/wiki/File:Arma3_CfgVehicles_B_APC_Tracked_01_CRV_F.jpg)

Ayant la classname `B_APC_Tracked_01_CRV_F`

  
3- Pour se faire je procède comme cela :

```text
vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F", "B_Boat_Armed_01_minigun_F","B_APC_Tracked_01_CRV_F" };
```

  
Si vous souhaitez retirer un véhicule de la location, vous avez simplement à la retirer de cette ligne :

```text
vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F", "B_Boat_Armed_01_minigun_F","B_APC_Tracked_01_CRV_F" };
```

Qui se trouve dans le `config_master.hpp`.

4- Faire varier le pourcentage pour la location de véhicule de chaque faction.  

Pour cela, toujours dans le `config_master.hpp` **recherchez** : 

```text
/* Vehicle Rental Prices */
```

En dessous vous trouverez les `%`  

A savoir que `.80` voudrait dire que le civil ne payera que 80% du prix d’achat du véhicule pour le louer. Ce pourcentage représente donc le prix de location du véhicule concerné.

```text
    /* Vehicle Rental Prices */
    vehicle_rental_multiplier_CIVILIAN = .80; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_COP = .3; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_MEDIC = .55; //Medic Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.
```

**Accès aux problèmes récurrents**

La page des problèmes récurrents n'est pas fournie avec ce tutoriel,  à cause de sa simplicité.  

Si vous rencontrez des problèmes avec le tutoriel, **rendez-vous** sur notre Forum et de créer un sujet dans l'Aide & Support, ou directement sur notre serveur Discord, également dans les sections d'Aide & Support.

