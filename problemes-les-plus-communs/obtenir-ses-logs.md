---
description: >-
  Ce guide va vous permettre de retrouver l'emplacement de vos logs, et ainsi
  pouvoir les partarger pour une demande d'aide, ou tout simplement pour
  comprendre un problème ou une erreur.
---

# Obtenir ses logs

## **Retrouver ses logs** CLIENT

Faites un `Windows + R`  et tapez ceci : `%localappdata%\Arma 3`

Accédez donc au dernier fichier en date portant ce type de nom : **arma3\_2019-07-27\_19-52-10.rpt** 

{% hint style="info" %}
Vous pouvez ensuite copier l’intégralité du fichier, et l'envoyer sur [hastebin](https://hastebin.com) afin de le partager pour une demande d'aide & support.
{% endhint %}



## Retrouver ses logs SERVEUR

### **SANS TADST**

Faites un `WINDOWS + R` puis saisissez `%localappdata%\Arma 3`

Accédez donc au dernier fichier en date portant ce type de nom : **arma3server\_2018-12-19\_15-07-58.rpt**

{% hint style="info" %}
Vous pouvez ensuite copier l’intégralité du fichier, et l'envoyer sur [hastebin](https://hastebin.com) afin de le partager pour une demande d'aide & support.
{% endhint %}



### **AVEC TADST**

Dans votre dossier de serveur, vous devriez trouver à la racine un dossier `TADST` qui se structure de la façon suivante par défaut, si vous n'avez pas crée d'autres profils de configuration : 

```text
\__default
\__TADST.profiles
```

Accédez donc au dossier pourtant le nom de votre profil utilisé dans TADST, puis, vous y trouverez des fichiers portant ce type de nom : **arma3server\_2018-12-19\_15-07-58.rpt**

Il ne vous reste plus qu'à ouvrir le dernier fichier `.rpt` en date.

{% hint style="info" %}
Vous pouvez ensuite copier l’intégralité du fichier, et l'envoyer sur [hastebin](https://hastebin.com) afin de le partager pour une demande d'aide & support.
{% endhint %}



### EXTDB \(extdb2 & extdb3\)

Dans votre dossier de serveur, vous devriez trouver à la racine un dossier `@extDB2` ou `extDB3` \(selon votre version\). Dans ce dossier, vous y trouverez un sous-dossier `logs`, 

Accédez ensuite au dossier correspondant à l’année, au mois, puis au jour et prenez le dernier fichier `.log` en date.

{% hint style="info" %}
Vous pouvez ensuite copier l’intégralité du fichier, et l'envoyer sur [hastebin](https://hastebin.com) afin de le partager pour une demande d'aide & support.
{% endhint %}

