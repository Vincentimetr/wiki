# Autosave

## 1- Présentation <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

Ce script vous permet de sauvegarder les données de vos joueurs à des intervalles de temps plus ou moins réguliers en fonctions des options activés au niveau de l'autosave.

**Aperçu du résultat une fois implanté**

Aucun aperçu n'est disponible car ce script est un script dit "backend" \(c'est-à-dire qu'il fonctionne en arrière plan\).

**Eléments à télécharger**

Vous devez télécharger l'archive 7z  `autosave.7z`.

## 2- Installation et configuration <a id="bkmrk-page-title"></a>

**Fichiers concernés**

* **`Altis_Life.Altis\scripts\autosave\fn_autosave.sqf`**
* **`Altis_Life.Altis\scripts\autosave\auto_script_macros.hpp`**
* **`Altis_Life.Altis\scripts\autosave\Master.hpp`**

**Mise en place**

{% hint style="danger" %}
Attention si vous avez déjà un autosave veuillez a bien le supprimer
{% endhint %}

Tout d'abords vous devez extraire l'archive `autosave.7z` que vous avez obtenu.

Ensuite vous devez placé le dossier obtenu dans `Altis_Life.Altis`.  

Ouvrez votre fichier `Altis_Life.Alits\core\init.sqf` et trouver ceci:

```text
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
```

 Au dessus de cela vous devez ajouter: 

```text
[] execVM "scripts\autosave\fn_autosave.sqf";
```

 Enfin rendez-vous dans votre fichier `Altis_Life.Altis\Description.ext`.

 Trouvez ceci: 

```text
#include "config\Config_Master.hpp"
```

 Et ajouter cela en dessous:

```text
#include "scripts\autosave\Master.hpp"
```

 Voilà l'autosave est installé.

**Options supplémentaires**

Pour trouver ces options rendez-vous dans votre fichier `Altis_Life.Altis\scripts\autosave\Master.hpp`.

* **`autoSaveSleep`** définie le temps dit “brut” entre chaque save du joueur
* **`saveTrafic`** est une option ajoutant un temps aléatoire pour éviter que les saves des joueurs se fassent en même temps \(occasionnant des lags\)
* **`randomTime`** définie la valeur du temps aléatoire maximal
* **`messageWhenPlayerDataAreSave`** est une option affichant un message au joueur \(en haut à droite de l’écran\) le prévenant que ses données ont été sauvegardés
* **`saveDataLog`** est une option créent des logs à chaque fois qu’un joueur voit ses données sauvegardés \(le log indique le nom du joueur\)

Si l’option **`saveTrafic`** est à true \(vrai\), la valeur du temps entre les saves du joueurs sera comprise entre votre valeur de **`autoSaveSleep`** + celle du **`randomTime`**. De base le temps entre chaque save du joueurs est de 10 minutes minimum et de 15 minutes maximum \(du fait du **`saveTrafic`** activé\).  

Toutes les valeurs de **`autoSaveSleep`** et de **`randomTime`** sont établis en minutes !

## 3- Problèmes récurrents <a id="bkmrk-page-title"></a>

Assurez-vous que vos fichiers soient dans le bon dossier, à savoir `Altis_Life.Altis\scripts\autosave`.  


