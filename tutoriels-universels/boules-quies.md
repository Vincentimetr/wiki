# Boules quies

## 1- Introduction <a id="bkmrk-page-title"></a>

### **But de ce tutoriel**

  Ce tutoriel vous permet d'améliorer le script de base des boules quies en réglant le volume de 10 % en 10 %

{% hint style="info" %}
Niveau de difficulté : **Facile**  
Temps requis : **5 minutes**
{% endhint %}

## 2- Mise en place <a id="bkmrk-page-title"></a>

### **Fichiers concernés** 

* `Altis_Life.Altis/`**`function/fn_KeyHandler.sqf`**

**Mise en place \(listing des étapes\)**

1- **Transformez** le bloc dans le fichier **`fn_KeyHandler.sqf`** comme ceci:

{% code-tabs %}
{% code-tabs-item title="fn\_keyHandler.sqf" %}
```c
//O Key
    case 24: {
        if (_shift) then {
			if (soundVolume<0.1) then {
				1 fadeSound 1;
			}
			else {
				1 fadeSound (round((soundVolume - 0.1)*10)/10);
			};
			hint format [localize "STR_MISC_sound", (soundVolume*100)];
        };
    };
```
{% endcode-tabs-item %}
{% endcode-tabs %}





