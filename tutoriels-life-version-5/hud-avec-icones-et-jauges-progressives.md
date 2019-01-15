# HUD avec icônes et jauges progressives

## 1 - Introduction <a id="bkmrk-page-title"></a>

### **But du guide**

Le présent guide va permettre d'intégrer un nouvel HUD avec des jauges progressives et des icônes, ce qui rendra l'affichage plus agréable.

Je tiens à donner les crédits à l'auteur original: [Repentz](https://www.altisliferpg.com/topic/3412-professional-looking-hud/)

### **Aperçu du résultat**

![](../.gitbook/assets/a7p7nyxkp1nx6uex-hud-apercu.png)



{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : **2 minutes**
{% endhint %}

\*\*\*\*

### **Textures / éléments complémentaires à télécharger**

Vous devez maintenant **télécharger** les textures \(HUD.rar\) :

{% file src="../.gitbook/assets/hud.rar" %}

A mettre dans :

 `Votremission/VindicateAssets/images/textures/HUD`  

## 2 - Installation <a id="bkmrk-page-title"></a>

{% hint style="danger" %}
Lors de l'étape d'installation, vous devez impérativement suivre toutes les étapes !  
{% endhint %}

1 - À la racine de votre mission `dialog/hud_stats.hpp`, **remplacez** par le code ci-dessous :

```text
//---------------------------------
//By Repentz
//Adapté par Sharywan pour AltisDev
//---------------------------------

#define INFINITE 1e+1000
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_FOOD_RING 3200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_WATER_RING 3201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_BAR_HEALTH_RING 3202
//#define IDC_LIFE_BAR_POOP 4202
#define IDC_LIFE_BAR_Speaker 3007
#define IDC_LIFE_BAR_SeatBelt 4203


class playerHUD {
	idd = -1;
	duration = INFINITE;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[] = {};
		controls[] = {
		LIFE_BAR_FOOD_RING,
		LIFE_BAR_WATER_RING,
		LIFE_BAR_HEALTH_RING,
		LIFE_BAR_Speaker,
		LIFE_BAR_SeatBelt
	};

		class LIFE_BAR_SeatBelt: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_SeatBelt;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.574333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
		class LIFE_BAR_Speaker: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_Speaker;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.640333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
		class LIFE_BAR_HEALTH_RING: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_HEALTH_RING;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.706333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
		class LIFE_BAR_FOOD_RING: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_FOOD_RING;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.772333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
		class LIFE_BAR_WATER_RING: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_WATER_RING;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.838333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
};
```

2 - À la racine de votre mission `core\functions\fn_HudUpdate.sqf`, **remplacez** par le fichier suivant : 

{% file src="../.gitbook/assets/fn\_hudupdate.sqf" %}



3 - À la racine de votre mission `core\functions\fn_HudSetup.sqf`, **remplacez** par le code ci-dessous :

```text
#include "..\..\script_macros.hpp"

disableSerialization;

2 cutRsc ["playerHUD","PLAIN"];
[] call life_fnc_hudUpdate;

[] spawn
{
	private["_dam"];
	while {true} do
	{
		_dam = damage player;
		waitUntil {(damage player) != _dam};
		[] call life_fnc_hudUpdate;
	};
};
```

Voilà le **HUD** est maintenant installé, pensez à vérifier qui'l ne manque pas des **accolades** \(pour éviter les erreurs inutiles\)

## 3 - Problèmes récurrents <a id="bkmrk-page-title"></a>

**1-** Vous ne voyez pas le HUD en jeu ?

{% hint style="success" %}
**Solution:** Pensez bien à vérifier que vous avez bien mis les textures dans le bon dossier
{% endhint %}

**2-** Vous voyez le HUD mais les textures ne changent pas ?

{% hint style="success" %}
**Solution:** Cela doit provenir du fichier **fn\_HudUpdate.sqf,** pensez à vérifier que vous avez bien mis ce qu'il y avait dans la **page 2**
{% endhint %}

**3-** Votre HUD ne s'affiche pas correctement ?

{% hint style="success" %}
**Solution:** Les fichiers **hud\_stats.hpp** & **hudSetup** doivent en être la cause. Vérifiez qu'ils sont bien complets par rapport à l’étape 2
{% endhint %}

