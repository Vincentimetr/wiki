# Feu d'artifice

## 1- Présentation <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

Ce script permet de lancer un feu d'artifice d'environ 10 minutes dans un lieu a une plage horaire fixée

Totalement paramétrable et optimisé de façon a ce qu'il soit compatible avec n'importe quel serveur.

**Aperçu du résultat une fois implanté**

_Paramétrage par défaut:_

![](https://wiki.altisdev.com/uploads/images/gallery/2017-08-Aug/scaled-840-0/UDiCWpnl6KdAem3r-image-1503512016448.png)

 _Paramétrage optimisé:_

[![M328IC7j4rlrUqZx-107410\_screenshots\_20170710161801\_1.jpg](https://wiki.altisdev.com/uploads/images/gallery/2017-08-Aug/scaled-840-0/M328IC7j4rlrUqZx-107410_screenshots_20170710161801_1.jpg)](https://wiki.altisdev.com/uploads/images/gallery/2017-08-Aug/M328IC7j4rlrUqZx-107410_screenshots_20170710161801_1.jpg)

**Éléments à télécharger**

Vous devez maintenant **télécharger** les scripts :

`Altis_life.Altis\Init\Init_Feu_Artifice.sqf`

`Altis_life.Altis\Effets\Effet_Artifice.sqf`

{% file src="../.gitbook/assets/init\_feu\_artifice.sqf" %}

{% file src="../.gitbook/assets/effet\_artifice.sqf" %}

{% hint style="info" %}
Niveau de difficulté : **Moyen**  
Temps requis : 10 **minutes**
{% endhint %}

## 2- Installation et configuration <a id="bkmrk-page-title"></a>

**Fichiers concernés** 

* `Altis_Life.Altis\`**`init.sqf`**
* `Altis_Life.Altis\Effets\`**`Effet_Artifice.sqf`**
* `Altis_Life.Altis\Init\`**`Init_Feu_Artifice.sqf`**

**Mise en place**

1- **Placer** un ou plusieurs héliports invisibles a l'emplacement du feu d'artifice \(Exemple: Chateau de Kavala\)

 2- **Nommez** les _lancement\_feu\_artifice\_1_, _lancement\_feu\_artifice\_2_, _lancement\_feu\_artifice\_3_, ...etc...

3- **Téléchargez**  **`Effet_Artifice.sqf`** et placez le dans  `Altis_Life.Altis\Effets\`**`Effet_Artifice.sqf`** 

4- **Téléchargez**  **`Init_Feu_Artifice.sqf`** et placez le dans  `Altis_Life.Altis\Init\`**`Init_Feu_Artifice.sqf`**

5- **Ajoutez** la ligne suivant dans votre _**`init.sqf`**_1

```text
execVM "Init\Init_Feu_Artifice.sqf";
```

**Configuration**

{% hint style="danger" %}
 Attention !!! La configuration est susceptible de changer totalement l’esthétisme et les performances!!!
{% endhint %}

La configuration se fera dans les fichier:

* * `Altis_Life.Altis\Effets\`**`Effet_Artifice.sqf`**
  * `Altis_Life.Altis\Init\`**`Init_Feu_Artifice.sqf`**

`Altis_Life.Altis\Init\`**`Init_Feu_Artifice.sqf`** permet de modifier le temps de déclenchement

1- **Modifier** la période de déclenchement minimale

```text
_periode_min=600; //(en secondes)
```

2- **Modifier** la période de déclenchement minimale

```text
_periode_max=3600; //(en secondes)
```

3- **Modifier** l'heure du début de déclenchement

```text
_heure_debut=22; //(en heures)
```

4- **Modifier** l'heure du fin de déclenchement

```text
_heure_fin=5; //(en heures)
```

`Altis_Life.Altis\Effets\`**`Effet_Artifice.sqf`** permet de modifier le feu d'artifice

1- **Modifier** le nombre de séries de tir1

```text
_nombre_de_series=5; //Nombre de series de tir
```

2- **Modifier** le nombre de tir par série

```text
_nombre_artifices_par_serie=10; //nombre de tir par série
```

3- **Modifier** le temps d'intervalle entre deux tirs d'un lanceur

```text
_temps_de_tir=1; //temps de tir apres explosion du tir précédant (en secondes)
```

4- **Modifier** le temps d'intervalle entre deux séries d'un lanceur

```text
_temps_de_serie=10; //temps d'attente après la fin de la série précédante (en secondes)
```

5- **Modifier** le temps de fragmentation d'une explosion

```text
_temps_fragments=2; //temps d'existance des fragments (en secondes)
```

6- **Modifier** la vitesse de tir verticale

```text
_vitesse_de_tir_vertical=40; //Vitesse verticale moyenne de départ du feu d'artifice (en m/s)
```

7- **Modifier** la vitesse de tir horizontale

```text
_vitesse_de_tir_horizontal=20; //Vitesse horizontale moyenne de départ du feu d'artifice (en m/s)
```

8- **Modifier** la vitesse des fragments de l'explosion

```text
_vitesse_fragments=20; //Vitesse du fragment lors de l'explosion (en m/s)
```

9- **Modifier** le nombre de fragments

```text
_nombre_de_fragments=18; //Nombre de fragments lors de l'explosion
```

10- **Modifier** l'intensité lumineuse

```text
_intensite_lumineuse=20; //Intensité limineuse des fragments et de la fusée (Unité inconnue)
```

11- **Modifier** la vitesse de déclenchement de l'explosion

```text
_vitesse_declenchement_explosion=25; //vitesse a partir de laquelle les fragments sont créés pour êtres propulsés apres _temps_fumee (en m/s)
```

12- **Modifier** la vitesse de lecture du son

```text
_vitesse_lecture_son=2; //Multiplicateur de la vitesse de lecture des 5 sons différents des explosions
```

13- **Modifier** la distance de son de l'explosion

```text
_distance_explosion=2000; //distance d'entente des explosions
```

14- **Modifier** les couleurs des explosions

```text
_liste_couleurs_fragments=["Red","Blue","Yellow","Purple","Green","Orange",""]; //couleurs possibles des fragments de l'explosion (mettre plusieurs fois la même pour augmenter sa proportion d'apparition
```

15- **Modifier** la fréquence de rafraichissement de la vérification de la vitesse

```text
_frequence_rafraichissement_verification_vitesse=0.2; //PERIODE de verification d'atteinte de la vitesse de la fusée pour explosion (en secondes) pour les performances
```

16- **Modifier** le temps de déclenchement de la fusée

```text
_temps_fumee=2.5; //Temps de déclenchement des fumées (en secondes)
```

## 3- Problèmes récurrents <a id="bkmrk-page-title"></a>

**Solutions possibles pour les problèmes récurrents**

* **Erreur \#1** : La baisse de FPS est trop importante pour les joueurs

{% hint style="success" %}
**Solution** : Vous devez modifier les paramètres en baissant le nombre de fragments, réduire le nombre de lanceurs d'artifices et augmenter le temps entre deux tirs.
{% endhint %}

