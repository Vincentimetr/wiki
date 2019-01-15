# Menu Y - Réadapté pour la 5.0

## 1 - Introduction <a id="bkmrk-page-title"></a>

### **But du guide**

Le but de ce guide est d'installer un menu Y propre, efficace et fonctionnel.

Nous allons donc le réadapter ensemble à la 5.

{% hint style="info" %}
Niveau de difficulté : **Moyen**  
Temps requis : **10-15 minutes**  
{% endhint %}

\*\*\*\*

### **Textures / éléments complémentaires à télécharger \(facultatif\)**

Vous devez maintenant **télécharger** le fichier _menu.paa_ à mettre dans `/racinedevotremission/textures/` 

{% file src="../.gitbook/assets/menu \(1\).paa" %}

## 2- Installation <a id="bkmrk-page-title"></a>

### **Fichiers concernés** 

{% hint style="danger" %}
Voici la liste des fichiers concernés dans cette partie, veuillez bien vérifier que vous ayez ces fichiers de votre coté.
{% endhint %}

* * `/dialog/`**`admin_menu.hpp`**
  * `/dialog/`**`gang.hpp`**
  * `/dialog/`**`key_chain.hpp`**
  * `/dialog/`**`player_inv.hpp`**
  * `/dialog/`**`settings.hpp`**
  * `/dialog/`**`wanted_list.hpp`**

### **Installation**

1- **Allez** dans `/dialog/`**`player_inv.hpp`** puis **insérez** cette class juste avant la class `controls` :

```c
    class controlsBackground {  

		class fondtablet: Life_RscPicture  
		{  
			idc = 9090909;  
			text = "textures\menu.paa";  
			x = 0;  
			y = -0.12;  
			w = 1;  
			h = 1.28;  
		};  

		class MainBackground:life_RscText {  
			idc = -1;  
			x = 0.1;  
			y = 0.2 + (11 / 250);  
			w = 0.8;  
			h = 0.6 - (22 / 250);  
		};  

		class Title : life_RscTitle {  
			colorBackground[] = {0, 0, 0, 0};  
			idc = -1;  
			text = "iOS 8";  
			x = 0.1;  
			y = 0.2;  
			w = 0.8;  
			h = (1 / 25);  
		};  

		class moneyStatusInfo : Life_RscStructuredText  
		{  
			idc = 2015;  
			sizeEx = 0.020;  
			text = "";  
			x = 0.105;  
			y = 0.30;  
			w = 0.3; h = 0.6;  
		};  

		class PlayersName : Title {  
			idc = carry_weight;  
			style = 1;  
			text = "";  
		};
```

 2- **Allez** dans `/dialog/`**`admin_menu.hpp`** puis **insérez** cette class juste avant la class `controls` :

```text
	class controlsBackground {  

	    class fondtablet: Life_RscPicture  
		{  
			idc = 9090909;  
			text = "textures\menu.paa";  
			x = 0;  
			y = -0.12;  
			w = 1;  
			h = 1.28;  
		};  

		class MainBackground:Life_RscText {  
			colorBackground[] = {0, 0, 0, 0.2};  
			idc = -1;  
			x = 0.1;  
			y = 0.2 + (11 / 250);  
			w = 0.8;  
			h = 0.6 - (22 / 250);  
		};  
	};  
```

 3- **Allez** dans `/dialog/`**`key_chain.hpp`** puis **insérez** cette class juste avant la class `controls` :

```text
    class controlsBackground {  

	    class fondtablet: Life_RscPicture  
		{  
			idc = 9090909;  
			text = "textures\menu.paa";  
			x = 0;  
			y = -0.12;  
			w = 1;  
			h = 1.28;  
		};  

		class MainBackground:Life_RscText {  
			idc = -1;  
			x = 0.1;  
			y = 0.2 + (11 / 250);  
			w = 0.8;  
			h = 0.6 - (22 / 250);  
		};
      };  
```

 4- **Allez** dans `/dialog/`**`wanted_list.hpp`** puis **insérez** cette class juste avant la class `controls` :

```text
 	class controlsBackground {  

	    class fondtablet: Life_RscPicture  
		{  
			idc = 9090909;  
			text = "textures\menu.paa";  
			x = 0;  
			y = -0.12;  
			w = 1;  
			h = 1.28;  
		};  

		class MainBackground:Life_RscText {  
			colorBackground[] = {0, 0, 0, 0.2};  
			idc = -1;  
			x = 0.21;  
			y = 0.2 + (11 / 250);  
			w = 0.6;  
			h = 0.6 - (22 / 250);  
		};  
	};  
```

 5- **Allez** dans `/dialog/`**`settings.hpp`** puis **insérez** cette class juste avant la class `controls` :

```text
	class controlsBackground {  

	    class fondtablet: Life_RscPicture  
		{  
			idc = 9090909;  
			text = "textures\menu.paa";  
			x = 0;  
			y = -0.12;  
			w = 1;  
			h = 1.28;  
		};  

		class MainBackground:Life_RscText {  
			colorBackground[] = {0, 0, 0, 0.2};  
			idc = -1;  
			x = 0.21;  
			y = 0.2 + (11 / 250);  
			w = 0.6;  
			h = 0.6 - (22 / 250);  
		};  
	};  
```

## 3- Problèmes récurrents <a id="bkmrk-page-title"></a>

### **Solutions possibles pour les problèmes récurrents**

**Erreur \#1** Votre menu s'affiche mal ?

{% hint style="success" %}
**Solution:** Téléchargez le pack menu et remplacer votre fichier par le fichier _player\_inv.hpp_
{% endhint %}

**Erreur \#2** Votre menu admin s'affiche mal ?

{% hint style="success" %}
**Solution:** Téléchargez le pack menu et remplacer votre fichier par le fichier _admin\_menu.hpp_
{% endhint %}

**Erreur \#3** Votre menu clés s'affiche mal ?

{% hint style="success" %}
**Solution:** Téléchargez le pack menu et remplacer votre fichier par le fichier _key\_chain.hpp_
{% endhint %}

**Erreur \#4** Une erreur avec le menu d'interpole ?

{% hint style="success" %}
**Solution:** Téléchargez le pack menu et remplacer votre fichier par le fichier _wanted\_list.hpp_
{% endhint %}

**Erreur \#5** Un soucis avec le menu options ?

{% hint style="success" %}
**Solution:** Téléchargez le pack menu et remplacer votre fichier par le fichier _settings.hpp_
{% endhint %}

**Erreur \#6** Votre menu gang s'affiche mal ?

{% hint style="success" %}
**Solution:** Téléchargez le pack menu et remplacer votre fichier par le fichier _gang.hpp_
{% endhint %}

Voilà c'est la fin des erreurs éventuelles, n’hésitez pas a communiquer sur le Discord ou sur les forums si vous avez trouvé des erreurs autres que celles-ci  ! 



