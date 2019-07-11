# Trafic Aérien

## 1- Présentation <a id="bkmrk-page-title"></a>

### **But de ce tutoriel**

Ce script permet d'ajouter en jeu un trafic aérien géré par les bots d'Arma.

Parfaitement optimisé, ce script ne crée pas de perte de performance, de message d'erreur et ne peut rentrer en conflit avec aucun autre script.

Le script est facile à installer et paramétrable.

### **Aperçu du résultat une fois implanté**

![](../.gitbook/assets/ej9x9oxizyj6jjva-107410_screenshots_20170823195932_1.jpg)

![](../.gitbook/assets/ap4dhyg9jcqjzodz-107410_screenshots_20170823200201_1.jpg)

![](../.gitbook/assets/grlnjoy9ndwqakn0-107410_screenshots_20170823200146_1.jpg)

### **Éléments à télécharger**

Vous devez maintenant **télécharger** le script \(_Init\_Avion\_Ligne.sqf_\) :

{% file src="../.gitbook/assets/init\_avion\_ligne.sqf" %}

A placer dans : 

_`Altis_life.Altis\Init\`**`Init_Avion_Ligne.sqf`**_  


{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : 3 **minutes**
{% endhint %}

## 2- Installation et configuration <a id="bkmrk-page-title"></a>

### **Fichiers concernés** 

* `Altis_Life.Altis\`**`init.sqf`**
* `Altis_Life.Altis\Init\`**`Init_Avion_Ligne.sqf`**

### **Mise en place**

1- **Téléchargez** le fichier `Init_Avion_Ligne.sqf` accessible en pièce jointe.

2- **Placez** ensuite le fichier dans un dossier que vous nommerez `\Init\`**`Init_Avion_Ligne.sqf`**

3- **Ajoutez** la ligne suivant dans votre _**`init.sqf`**_ présent à la racine de votre mission1

```text
execVM "Init\Init_Avion_Ligne.sqf";
```

### **Configuration**

1- **Modifier** les types de véhicules aériens  

Ajoutez des classnames dans l'array **\_liste\_avion**

{% hint style="success" %}
 Les avions moddés fonctionnent.
{% endhint %}

```text
_liste_avion=
[
	"O_T_VTOL_02_vehicle_F", //Véhicule 1
	"B_Plane_CAS_01_dynamicLoadout_F", //Véhicule 2
	"C_Plane_Civil_01_F" //Véhicule 3
];
```

{% hint style="success" %}
 Il est possible de mettre des hélicoptères dans cette liste. _Les noms des autres véhicules sont trouvables sur le_ [_wiki de Bohemia_](https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Vehicle_Weapons)
{% endhint %}

{% hint style="info" %}
 _Pour augmenter la fréquence d'apparition d'un véhicule, **mettez**-le plusieurs fois dans la liste._
{% endhint %}

2- **Modifier** la période d'apparition

Modifiez la valeur après "="

La période d'apparition est en seconde et modifie la période d'apparition des véhicules aériens.1

```text
_periode_apparition=60;
```

{% hint style="danger" %}
Si la période est trop petite, un nombre d'avion conséquent peut générer des pertes de performances.
{% endhint %}

3- **Modifier** la taille de la map

Modifiez la valeur après le "="1

```text
_taille_map=30000; //Map d'Altis (en mètres)
```

4- **Modifier** le type de fumée

Modifiez la classname après le "="1

```text
_type_de_fumee="test_EmptyObjectForSmoke"; //Fumée noire
```

4- **Modifier** l'altitude d'apparition

Modifiez la valeur après le "="1

```text
_altitude_apparition=1000; //(en secondes)
```

## 3- Problèmes récurrents <a id="bkmrk-page-title"></a>

**Erreur \#1** : Le script génère des baisses de performances sur votre serveur.

{% hint style="success" %}
**Solution** : Vous devez **augmenter** la période d'apparition.
{% endhint %}

**Erreur \#2** : Vous trouvez que les avions volent trop bas.

{% hint style="success" %}
**Solution** : Vous devez vous convaincre que c'est bien assez haut.
{% endhint %}



Tutoriel proposé par Vincent Bénet \( [Vincentimetr](https://altisdev.com/u/vincentimetr/) \)

