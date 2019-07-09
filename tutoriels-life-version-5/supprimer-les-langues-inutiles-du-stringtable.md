---
description: >-
  Ce tutoriel vous permet de gagner 500 Ko sur votre fichier mission et d'avoir
  plus de visibilité quand vous allez manipuler le stringtable
---

# Supprimer les langues inutiles du Stringtable

## 1- Introduction  <a id="bkmrk-page-title"></a>

### **But de ce tutoriel**

Ce tutoriel vous permet de gagner 500 Ko sur votre fichier mission et d'avoir plus de visibilité quand vous allez manipuler le stringtable.

Je vais vous guidez pour supprimer ce contenu indésirable qui allègera les joueurs lors du téléchargement de votre mission, empêchera une personne ne parlant pas français de venir jouer sur votre serveur et vous facilitera la manipulation de celui-ci dans le futur.

### **Aperçu du résultat une fois implanté**

Passer de ceci:

{% code-tabs %}
{% code-tabs-item title="stringtable.xml" %}
```text
<Key ID="STR_Init_ClientSetup">
            <Original>Setting up client, please wait...</Original>
            <Czech></Czech>
            <Spanish>Configurando cliente. Por favor espere...</Spanish>
            <Russian></Russian>
            <German>Einrichten des Clients, bitte warten...</German>
            <Italian>Caricamento dati, attendi...</Italian>
            <French>Configuration du client. Patientez s'il vous plait...</French>
            <Portuguese>Configurando o cliente. Por favor, aguarde...</Portuguese>
            <Polish></Polish>
        </Key>
        <Key ID="STR_Init_ServerReady">
            <Original>Waiting for the server to be ready...</Original>
            <Czech></Czech>
            <Spanish>Esperando a que el servidor esté listo...</Spanish>
            <Russian></Russian>
            <German>Warten, bis der Server bereit ist...</German>
            <Italian>Caricamento Server, attendi...</Italian>
            <French>En attente du chargement du serveur...</French>
            <Portuguese>Esperando o servidor estar pronto...</Portuguese>
            <Polish></Polish>
        </Key>
        <Key ID="STR_Init_ExtdbFail">
            <Original>extDB failed to load, please contact an administrator.</Original>
            <Czech></Czech>
            <Spanish>extDB no se pudo cargar, por favor contacte a un administrador.</Spanish>
            <Russian></Russian>
            <German>extDB konnte nicht geladen werden, wenden Sie sich bitte an einen Administrator.</German>
            <Italian>C'è stato un'errore con extDB, perfavore contatta un amministratore.</Italian>
            <French>extDB ne s'est pas lancé correctement. Veuillez contacter un administrateur.</French>
            <Portuguese>O extDB falhou ao carregar, por favor, contacte um administrador.</Portuguese>
            <Polish></Polish>
        </Key>
        <Key ID="STR_Init_ClientFinish">
            <Original>Finishing client setup procedure...</Original>
            <Czech></Czech>
            <Spanish>Finalizando configuración del cliente...</Spanish>
            <Russian></Russian>
            <French>Finalisation de la procédure de configuration du client...</French>
            <German>Fertigstellen der Client-Einrichtungs-Prozedur...</German>
            <Italian>Completando procedura d'inizializzazione </Italian>
            <Portuguese>Terminando o processo de configuração do cliente...</Portuguese>
            <Polish></Polish>
        </Key>
```
{% endcode-tabs-item %}
{% endcode-tabs %}

A ceci:

{% code-tabs %}
{% code-tabs-item title="stringtable.xml" %}
```text
<Key ID="STR_Init_ClientSetup">
            <Original>Configuration du client. Patientez s'il vous plait...</Original>
        </Key>
        <Key ID="STR_Init_ServerReady">
            <Original>En attente du chargement du serveur...</Original>
        </Key>
        <Key ID="STR_Init_ExtdbFail">
            <Original>extDB ne s'est pas lancé correctement. Veuillez contacter un administrateur.</Original>
        </Key>
        <Key ID="STR_Init_ClientFinish">
            <Original>Finalisation de la procédure de configuration du client...</Original>
        </Key>
```
{% endcode-tabs-item %}
{% endcode-tabs %}

## 2- Installation  <a id="bkmrk-page-title"></a>

### **Fichiers concernés**

```text
stringtable.xml
```

### **Logiciel nécessaire**

`Notepad++`

Ci-dessous la page internet du site de notepad ++ pour télécharger le logiciel Notepad ++:

{% hint style="warning" %}
[https://notepad-plus-plus.org/download/v7.5.3.html](https://notepad-plus-plus.org/download/v7.5.3.html)
{% endhint %}

### **Mise en place**

1- **Ouvrez** le stringtable.xml avec Notepad ++

2- **Faites** CTRL + F

3- **Sélectionnez** l'onglet Remplacer avec les mêmes paramètres:

![](https://i.imgur.com/iAbUUwI.png)

4- **Supprimez** la langue Original:

Dans la fenêtre `Recherche`, **mettre** `<Original>.*</Original>`

Dans la fenêtre `Remplacer par`, **ne rien mettre**

**Cliquez** sur `Remplacer tout`

5- **Recommencez** en **remplacant** `<Original>.*</Original>`par:

`<Czech>.*</Czech>`

`<Spanish>.*</Spanish>`

`<Russian>.*</Russian>`

`<German>.*</German>`

`<Italian>.*</Italian>`

`<Portuguese>.*</Portuguese>`

`<Polish>.*</Polish>`

`<Czech>.*</Czech>`

`<Czech>.*</Czech>`

6- Dans Edition =&gt; Lignes, **cliquez** sur `Enlever les lignes vides (Contenant les blancs aussi)`

![](https://wiki.altisdev.com/uploads/images/gallery/2017-12-Dec/scaled-840-0/f2mtWQsSpeWxbDho-image-1514737788292.png)

7- Toujours dans l'onglet **Remplacer**:

Dans la fenêtre `Recherche`, **mettre** `French`

Dans la fenêtre `Remplacer par`, **mettre** `Original`

\*\*\*\*

Author: Vincent Bénet (Vincentimetr)


