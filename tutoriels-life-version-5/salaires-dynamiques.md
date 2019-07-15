# Salaires dynamiques

## 1-Présentation <a id="bkmrk-page-title"></a>

L'installation de ce script vous permet de multiplier le salaire donné aux joueurs en fonction de leurs licences

## 2-Installation <a id="bkmrk-page-title"></a>

Fichiers concernés:

```text
/core/init.sqf
```

Trouvez le commentaire:

```sql
//Set bank amount for new players
```

En dessous modifiez:

{% code-tabs %}
{% code-tabs-item title="core/init.sqf" %}
```text
switch (playerSide) do {
    case west: {
        life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_cop");
    };
    case civilian: {
        life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_civ");
    };
    case independent: {
        life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_med");
    };
};
```
{% endcode-tabs-item %}
{% endcode-tabs %}

 En ceci:

{% code-tabs %}
{% code-tabs-item title="core/init.sqf" %}
```text
switch (playerSide) do {
    case civilian: {
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_civ");
		
		if (license_civ_diplome_brevet)then {life_paycheck=life_paycheck+1};
		if (license_civ_diplome_baccalaureat)then {life_paycheck=life_paycheck+1};
		if (license_civ_diplome_license1)then {life_paycheck=life_paycheck+10};
		if (license_civ_diplome_license2)then {life_paycheck=life_paycheck+10};
		if (license_civ_diplome_license3)then {life_paycheck=life_paycheck+10};
		if (license_civ_diplome_ingenieur)then {life_paycheck=life_paycheck+100};
		if (license_civ_diplome_master)then {life_paycheck=life_paycheck+1000};
		if (license_civ_diplome_doctorat)then {life_paycheck=life_paycheck+1000};
		
		if (license_civ_drogue_marijuana)then {life_paycheck=life_paycheck+1000};
		if (license_civ_drogue_heroin)then {life_paycheck=life_paycheck+1000};
		if (license_civ_drogue_heroin)then {life_paycheck=life_paycheck+1000};
		
		if (license_civ_droit_sansPapier)then {life_paycheck=life_paycheck+1};
		if (license_civ_droit_citoyen)then {life_paycheck=life_paycheck+1};
		if (license_civ_droit_gun)then {life_paycheck=life_paycheck+10};
		if (license_civ_droit_home)then {life_paycheck=life_paycheck+100};
		
		if (license_civ_entrainement_voleur)then {life_paycheck=life_paycheck+1};
		if (license_civ_entrainement_bandit)then {life_paycheck=life_paycheck+10};
		if (license_civ_entrainement_contrebandier)then {life_paycheck=life_paycheck+100};
		if (license_civ_entrainement_rebel)then {life_paycheck=life_paycheck+1000};
		if (license_civ_entrainement_terroriste)then {life_paycheck=life_paycheck+10000};
		
		if (license_civ_metier_dive)then {life_paycheck=life_paycheck+1};
		if (license_civ_metier_chasse)then {life_paycheck=life_paycheck+1};
		if (license_civ_metier_bois)then {life_paycheck=life_paycheck+1};
		if (license_civ_metier_livraison)then {life_paycheck=life_paycheck+1};
		if (license_civ_metier_cement)then {life_paycheck=life_paycheck+1};
		if (license_civ_metier_sand)then {life_paycheck=life_paycheck+10};
		if (license_civ_metier_salt)then {life_paycheck=life_paycheck+10};
		if (license_civ_metier_oil)then {life_paycheck=life_paycheck+100};
		if (license_civ_metier_copper)then {life_paycheck=life_paycheck+100};
		if (license_civ_metier_iron)then {life_paycheck=life_paycheck+100};
		if (license_civ_metier_diamond)then {life_paycheck=life_paycheck+1000};
		
		if (license_civ_permis_driver)then {life_paycheck=life_paycheck+1};
		if (license_civ_permis_boat)then {life_paycheck=life_paycheck+1};
		if (license_civ_permis_trucking)then {life_paycheck=life_paycheck+10};
		if (license_civ_permis_pilot)then {life_paycheck=life_paycheck+100};
	};
    case west: {
        life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_cop");
		life_paycheck = (call life_coplevel )*life_paycheck;
    };
    
    case independent: {
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_med");
		life_paycheck = (call life_medicLevel )*life_paycheck;
    };
};
```
{% endcode-tabs-item %}
{% endcode-tabs %}

{% hint style="warning" %}
 Vous devrez évidemment adapter le nom des licences ainsi que le salaire additionnel donné en fonction du contenu de votre serveur.
{% endhint %}


Author: Vincent Bénet (Vincentimetr)

Tutoriel proposé par Vincent Bénet \( [Vincentimetr](https://altisdev.com/u/vincentimetr/) \)

