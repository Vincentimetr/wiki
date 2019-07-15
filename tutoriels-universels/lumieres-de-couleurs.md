# Lumières de Couleurs

## 1- Présentation <a id="bkmrk-page-title"></a>

### **But de ce tutoriel**

 Ce script permet à un mappeur n'ayant aucune connaissance du sqf de pouvoir ajouter des lumières de façon extrêmement simple. 

### **Aperçu du résultat une fois implanté**

![](../.gitbook/assets/jgqdy2iqeetbukhl-1.jpg)

### **Éléments à télécharger**

Vous devez maintenant **télécharger** le script : 

{% file src="../.gitbook/assets/init\_light.sqf" %}

Et le placer ici :

```text
Altis_life.Altis\Init\Init_Light.sqf
```

{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : 3 **minutes**
{% endhint %}

## 2- Installation <a id="bkmrk-page-title"></a>

### **Fichiers concernés** 

* `Altis_Life.Altis\init.sqf`
* `Altis_Life.Altis\Init\Init_Light.sqf`

### **Mise en place**

1- **Créez** des héliports invisibles et **Nommez** les de la façon suivante: `Light_color_X` avec X un entier de 1 à N.

{% hint style="success" %}
 Remplacer "color" par r,g,b,l pour rouge,vert,bleu,blanc
{% endhint %}

{% hint style="danger" %}
 Si il y a une interruption des numéros de X, les lumières après l'interruption ne fonctionnerons pas.  
Le compteur doit s'effectuer indépendamment pour chaque couleurs
{% endhint %}

2- **Téléchargez**  `Init_Light.sqf` : 

{% file src="../.gitbook/assets/init\_light.sqf" %}

Et **placez** le dans  **`Altis_Life.Altis\Init\Init_Light.sqf`**  

4- **Ajoutez** la ligne suivant dans votre _**`init.sqf`**_

```text
execVM "Init\Init_Light.sqf";
```

Author: Vincent Bénet (Vincentimetr)


Tutoriel proposé par Vincent Bénet \( [Vincentimetr](https://altisdev.com/u/vincentimetr/) \)

