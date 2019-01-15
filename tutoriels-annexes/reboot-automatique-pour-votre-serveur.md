# Reboot automatique pour votre serveur

## 1- Présentation <a id="bkmrk-page-title"></a>

**Manager**

Manager est un petit logiciel de gestion de reboot. Celui-ci suivant le processus que vous indiquerez sera en mesure suivant des heures de reboot bien définies, de couper et redémarrer votre processus.

Manager est complètement universel \(marche avec tous type de processus\) et se veut multi-plateforme pour sa version CLI \(en ligne de commande\).  

A vous les joies des reboot !



## 2- Installation <a id="bkmrk-page-title"></a>

**Télécharger le fichier**

Télécharger Manager adapté à votre système d'exploitation ici : 

[https://drive.google.com/open?id=114b6L2PlepzMbImXy4s7Syjp0uN\_JBKC](https://drive.google.com/open?id=114b6L2PlepzMbImXy4s7Syjp0uN_JBKC)

{% hint style="warning" %}
Le fichier est une archive .7z que vous devrez désarchiver.
{% endhint %}

L'opération est faisable :

sous Windows via le logiciel [WinRAR](https://www.win-rar.com/predownload.html?L=10) ou encore [7zip](http://www.7-zip.org/).

sous macOS via [7zX](https://www.opensourcemacsoftware.org/utilitaire-mac/7zip-mac-7zx.html)

sous Linux via [p7zip](https://doc.ubuntu-fr.org/p7zip)

Télécharger bien sur la version correspondant au genre d'OS que vous utiliser ! Il est important de posséder le [Framework .Net Core](https://www.microsoft.com/net/download/windows) en version 2.0.

Le logiciel est uniquement compatible avec un processeur ayant une architecture en 64 bits.

**Utilisation du logiciel**

Lors de la décompression de l'archives vous y trouverez un dossier et un fichier nommé "manager.xml". Dans le dossier vous y trouverez une foule de fichier, dans chacun d'entre eux il contient Manager sous la forme d'un fichier à lancé.

Attention ! Ceci est sûr pour la version Windows ! Pour les autres version ne me connaissant pas en Linux et n'ayant pas un Mac, je n'ai pas pu le tester ni le confirmer !

Vous devez avant toute chose configurer vos heures de reboot. Manager en gère 6 maximum, normalement il est pas nécessaire de les mettre toutes.

Si une erreur se produit alors mettez pour les reboots restants une heure commune, le résultat sera le même.

Le check se fait toutes les minutes, un décalage de quelques millisecondes \(le temps que le code s'exécute\) peut s'effectuer entraînant sur le long terme un décalage par rapport à l'heure ou vous l'avez lancé.  
Ceci normalement est marginale, néanmoins si cela se produit souvent un correctif sera lancé pour corriger cette erreur !

Vous devriez aussi indiqué le chemin pour exécuter le processus que vous vous exécuté, celui-ci est absolue et non relatif.

Si le chemin indiqué ne pointe pas vers un fichier pouvant s'exécuter \(raccourcis, .exe, .bat, etc...\), Manager détectera une erreur et stoppera son fonctionnement !

Après avoir configurer vos heures de reboot, vous n'avez plus qu'a lancé Manager, ils vous demandera le nom de votre processus, vous n'avez plus qu'a l'entrer et c'est partis pour l'automatisation des reboots !

Vérifier bien le nom du processus, sinon Manager détectera une erreur et stoppera son fonctionnement !

Il existe deux commandes, "set process" vous permettant de changer de processus sans ouvrir le fichier xml, et "exit", qui quitte l'application.

Voilà, j'ai normalement fait le tour de Manager, pour l'instant il ne gère qu'un seul processus, je ferai surement une mise à jour pour que vous puissiez gérer autant de reboot que vous voulez !

Sur ce à vos reboot !

