# Gestion du téléphone

## 1- Introduction <a id="bkmrk-page-title"></a>

**But de ce tutoriel**

Ce tutoriel permet d'empêcher au joueur d'utiliser le menu téléphone si il ne possède pas une radio.

{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : **1 minutes**
{% endhint %}

## 2- Mise en place <a id="bkmrk-page-title"></a>

**Fichiers concernés**  

 `Altis_Life.Altis/`**`dialog/player_inv.hpp`**

**Mise en place**

1- Dans **`player_inv.hpp`** trouvez le bloc:

```text
class ButtonCell: Life_RscButtonMenu {
     idc = 2014;
     text = "$STR_PM_CellPhone";
     onButtonClick = "createDialog ""Life_cell_phone""";
     x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
     y = 0.8 - (1 / 25);
     w = (6.25 / 40);
     h = (1 / 25);
};
```

  2- Transformez-le comme ceci:

```text
class ButtonCell: Life_RscButtonMenu {
        idc = 2014;
        text = "$STR_PM_CellPhone";
        onButtonClick = "if (""ItemRadio"" in (assignedItems player)) then {createDialog ""Life_cell_phone"";} else {closeDialog 0;hint (""Vous devez avoir un telephone"")};";
        x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
        y = 0.8 - (1 / 25);
        w = (6.25 / 40);
        h = (1 / 25);
};
```

**Accès aux problèmes récurrents**

Si vous rencontrez des problèmes avec le tutoriel, **rendez-vous** dans la page suivante intitulé _Problèmes Récurrents ****_pour trouver une réponse à votre problème.

Merci de consulter les Problèmes Récurrents avant de créer un sujet dans l'Aide & Support de notre Forum.

