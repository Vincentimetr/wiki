# Respawn d'objets

## 1- Présentation <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

Ce script permet a des objets cassables tel que des murs de respawn après un temps paramétrable. Les débris sont supprimés après un temps également paramétrable.

Fonctions intéressantes:

-Empêche les objets de réapparaitre sur les joueurs

-Permet a un objet de réapparaitre "dans" un autre objets

**Aperçu du résultat une fois implanté**

 _**`Illustration non necessaire`**_

**Éléments à télécharger**

Vous devez maintenant **télécharger** les scripts

```text
Altis_life.Altis\Init\Init_Remove.sqf
```

{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : 10 **minutes**
{% endhint %}

## 2- Installation <a id="bkmrk-page-title"></a>

**Fichiers concernés** 

* `Altis_Life.Altis\init.sqf`
* `Altis_Life.Altis\Init\Init_Respawn_Objects.sqf`

**Mise en place**

1- **Nommez** les objets de la façon suivante: `Object_Respawn_X` avec X un entier de 1 à N.

{% hint style="danger" %}
Si il y a une interruption des numéros, les objets après l'interruption ne fonctionnerons pas.
{% endhint %}

2- **Téléchargez**  `Init_Respawn_Objects.sqf` et placez le dans  **`Altis_Life.Altis\Init\Init_Respawn_Objects.sqf`**

3- **Ajoutez** la ligne suivant dans votre _**`init.sqf`**_1

```text
execVM "Init\Init_Respawn_Objects.sqf";
```

**Accès aux problèmes récurrents**

Si vous rencontrez des problèmes avec le tutoriel, **rendez-vous** dans la page suivante intitulé _Problèmes Récurrents ****_pour trouver une réponse à votre problème.  

Merci de consulter les Problèmes Récurrents avant de créer un sujet dans l'Aide & Support de notre Forum.

