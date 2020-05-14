# Circuit de Course

## 1- Présentation <a id="bkmrk-page-title"></a>

### **But de ce tutoriel**

Ce script, combiné a un mapping donnera a votre Altis Life un ou plusieurs circuits de course avec chronomètre permettant aux joueurs de s'affronter au contre la montre dans le circuit.

Le script garde en mémoire les records des joueurs avec un leaderBoard de 10 personnes, le temps d'avance ou de retard.

Les joueurs recoivent une prime lorsqu'ils sont dans les 10 premiers.

Les records sont reset a chaque reboot.

### **Aperçu du résultat une fois implanté**

![](../.gitbook/assets/mfegpsrxvden6phh-107410_screenshots_20170825140902_1.jpg)

![](../.gitbook/assets/usvpszizgv2ypksb-image-1503653257774.png)

### **Éléments complémentaires à télécharger \(Obligatoire\)**

Vous devez maintenant **télécharger** le script suivant : 

{% file src="../.gitbook/assets/verification.sqf" %}

A placer dans : 

`Altis_life.Altis\Scripts\Circuit\Verification.sqf`

{% hint style="info" %}
Niveau de difficulté : **Difficile**  
Temps requis : **20 minutes**
{% endhint %}

## 2- Installation <a id="bkmrk-page-title"></a>

### **Fichiers concernés** 

* `Altis_life.Altis\core\scripts\Circuit\Verification.sqf`

### **Mise en place**

1- **Téléchargez** le fichier et **placez**-le dans le chemin indiqué.

2- **Mapper** un ou plusieurs circuits avec une ligne d'arrivée et des checkpoints sur votre map.

3- **Placez** un trigger de **grande taille** a chaque checkpoints et **nommez**-les `trigger_`_`NumeroCircuit`_`_`_`NumeroPorte`_

{% hint style="danger" %}
Si les triggers sont trop petits, ils ne se déclencheront pas toujours lorsque le joueur les traversent avec un grande vitesse!
{% endhint %}

EXEMPLE:

Le premier circuit comportant 5 triggers:

Le premier trigger sur la ligne d'arrivée sera `trigger_1_0`

Le second trigger du checkpoint 1 sera `trigger_1_1`

Le dernier trigger des checkpoints sera `trigger_1_4`

Le premier circuit comportant 5 triggers:

Le premier trigger sur la ligne d'arrivée sera `trigger_2_0`

Le second trigger du checkpoint 1 sera `trigger_2_1`

Le dernier trigger des checkpoints sera `trigger_2_4`

4- **Placez** un héliport invisible que vous nommerez `SERVER`

5- **Configurez** les triggers comme ceci:

![](../.gitbook/assets/telechargement.png)

6- **Entrez** dans "On Activation" du trigger le code suivant:

```text
ThisTrigger call compile preprocessFileLineNumbers 'core\scripts\Circuit\Verification.sqf';
```

{% hint style="info" %}
 Il est possible de mettre un nombre illimité de circuits
{% endhint %}

{% hint style="success" %}
 L'installation est maintenant finie, libre a vous de modifier le script qui est perfectible et de me contacter si vous le faites avec succès.
{% endhint %}

 ****

Tutoriel proposé par Vincent Bénet \( [Vincentimetr](https://altisdev.com/u/vincentimetr/) \)
