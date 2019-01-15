# Installer et configurer un accès FTP \(Sous Windows\)

## 1- Télécharger FileZilla Server <a id="bkmrk-page-title"></a>

**Télécharger et installer FileZilla Server** 

1- Pour commencer, **téléchargez** l'installateur de FileZilla Server sur le [site officiel.](https://filezilla-project.org/download.php?type=server)

2- **Acceptez** les conditions d'utilisation, puis, dans la rubrique "Choisissez les composants", **configurez** de la façon suivante : 

![](../.gitbook/assets/oxdzmuw4zemnlebc-2.png)

3- Une fois avoir choisi l'emplacement d'installation de File Zilla, vous devez choisir comment File Zilla sera démarré. Pour se faire, suivez l'exemple ci-dessous : 

![](../.gitbook/assets/djkepj25uudt2krh-5.png)

4- Suivez maintenant les étapes, sans modifier les paramètres, et laissez File Zilla s'installer comme ci-dessous.

![](../.gitbook/assets/sic3ytqtalra9lzu-8.png)

## 2- Configuration du serveur FTP <a id="bkmrk-page-title"></a>

**Installation et configuration du serveur FTP sur votre machine**

1- Une fois avoir installé File Zilla Server, **ouvrez le**. Une fenêtre va apparaître : 

![](../.gitbook/assets/zfiacjvohadquvr7-9.png)

Cette fenêtre va permettre de se connecter au serveur FTP \(qui est donc en local\). Les informations concernant le serveur FTP sur lequel nous voulons nous connecter sont les suivantes : 

`Nom d'hôte (ou nom de domaine)` : Cette information correspond à l'adresse IP, ou le nom de domaine \(ici l'adresse local de machine, soit **localhost** ou **127.0.0.1**\)

`Port` : Le port de gestion administrative du serveur FTP \(port par défaut : **141417**\)

`Mot de passe` : Vous devez spécifier le mot de passe qui protège la partie administration du serveur cible

`Toujours se connecter à ce serveur` : Cette option permet de se reconnecter directement au dernier serveur connu. A cocher si vous n'avez pas plusieurs serveurs à administrer.

Une fois toutes ces informations passées en revue, vous pouvez cliquer sur `Connecter`

**Connexion au Serveur FTP en local**

  
2- Maintenant que nous avons installé correctement File Zilla Server, si tout s'est bien passé, vous devriez vous trouvez face à cette interface : 

![](../.gitbook/assets/6zmrm7ph35xmyjbi-a197e62840ecb2ae93cfaa9641a4faa2.png)

Cette interface va vous permettre de gérer simplement votre serveur. 

Si vous rencontrez des erreurs dans les logs, comme "Connection to server closed", il est possible que le service permettant au serveur de fonctionner ne se soit pas lancer correctement. Pour le lancer manuellement, il vous suffit de cliquer sur le raccourci qui se situe dans le menu `Démarrer > Programmes`  puis **sélectionnez** File Zilla Server, puis Démarrer File Zilla Server. Cette méthode va permettre de lancer manuellement le service permettant au serveur de tourner. Pour se faire, **effectuez** un clic-droit ****sur le Poste de Travail puis `Gérer`. Une fois fait, la fenêtre de gestion de l'ordinateur s'affiche. **Sélectionnez** alors `Services et applications` puis `Services`. Cherchez dans la liste des services "FileZilla Server FTP server", **assurez-vous** de son état "Démarré", et si ce n'est pas le cas, **faites** un clic-droit sur le service, puis `Démarrer`.   \(voir ci-dessous\)

![](../.gitbook/assets/ji2xtdlllvjjaus2-c8b3187b7b2ca1cea7271bd24b03627d.png)

**Application des paramètres globaux**

3- Maintenant que votre serveur tourne correctement en local \(sur votre machine\), **rendez-vous** dans `Edit > Settings` Ou `Modifier > Paramètres (si vous êtes en français)`. 

4- **Assurez-vous** maintenant que dans "Paramètres Généraux", vous ayez les mêmes paramètres que ci-dessous. Vous pouvez modifier si vous le souhaitez le `Max. number of users` par sécurité, qui permet de brider le nombre de connexions simultanés sur votre serveur FTP. 

![](../.gitbook/assets/fz3tz9bm6gkj60kc-2a8e881bc22b636e595dbe146335535c.png)

5- Maintenant, il vous faut créer un compte utilisateur, qui va pouvoir se connecter à un répertoire précis de votre serveur, en lui donnant toutes les principales permissions. Pour se faire, **rendez-vous** dans `Edit > Users` ou `Modifier > Utilisateurs (si vous êtes en français)` puis, allez dans la page `General`, une fois fait, cliquez sur `Add` puis configurez un nom d'utilisateur.

![](../.gitbook/assets/mekozympwbvl5qta-845e3946ac37fca811f85f5ba7470b5c.png)

6- Une fois le nom d'utilisateur défini, il faut maintenant lui donner un mot de passe, pour ça, **cochez** les cases `Enable account`et `Password` puis **saisissez** votre mot de passe. Laissez le `Group membership` à **&lt;none&gt;** 

7- Une fois l'utilisateur crée, il faut maintenant définir le répertoire auquel cet utilisateur. Pour ça, allez dans la page `Shared folders`.

![](../.gitbook/assets/fdnkjectdu8u0clt-0db8617bdae611519d7014190971a6f6.png)

De là, vous pouvez voir au centre de la fenêtre qu'un chemin d'accès est déjà défini par défaut chez moi, qui est `C:\serv_test`. **Cliquez** donc maintenant sur `Add`, puis **sélectionnez** le dossier auquel l'utilisateur aura accès à distance, et une fois fait, validez en cliquant sur **Ok**. 

8- Une fois fait, il faut maintenant attribuer les permissions auxquelles l'utilisateur aura droit dans son dossier. Pour cela, il faut cocher les cases des rubriques `Files` et `Directories` puis fiez vous au tableau ci-dessous pour définir les permissions : 

* Rubrique `Files` :

| **Intitulé de la permission** | **Traduction - Signification** | **Fonction de la permission** |
| :--- | :--- | :--- |
| `Read` | Droit de lecture | Permet de lire tout les fichiers présents dans le répertoire\* |
| `Write` | Droit d'écriture | Permet de modifier tout les fichiers présents dans le répertoire\* |
| `Delete` | Droit de suppression | Permet de supprimer tout les fichiers présents dans le répertoire\* |
| `Append` | Droit de création | Permet de créer de nouveaux fichiers dans le répertoire courant |

\*Les fichiers cachés ne pourront pas être lus / édités / supprimés.

* Rubrique `Directories` :

| **Intitulé de la permission** | **Traduction - Signification** | **Fonction de la permission** |
| :--- | :--- | :--- |
| `Create` | Droit de création d'un dossier  | Permet de créer un dossier dans le répertoire courant |
| `Delete` | Droit de suppression d'un dossier/sous-dossier | Permet de de supprimer n'importe quel dossier du répertoire courant |
| `List` | Droit d'afficher les dossiers/ existants  | Permet de voir les dossiers existants dans le répertoire courant |
| `+ Subdirs`  | Droit de création de sous-dossiers | Permet de créer des sous-dossiers dans des dossiers existants  |

Une fois vos permissions appliquées, validez les changements, puis **assurez-vous** que le serveur a bien pris en compte les permissions récemment mises en place, en observant ce message de confirmation dans la console : 

1

```text
Retrieving settings, please wait...
```

2

```text
Done retrieving settings
```

\*\*\*\*

**Rendre le serveur "distant"**

Maintenant que notre serveur FTP est fonctionnel en local, il faut le rendre accessible à distance, ce qui est tout de même l'objectif final. En d'autres termes : rendre votre serveur distant.

9- Pour commencer, **allez** sur File Zilla Server, puis dans `Edit > Settings` ou `Modifier > Paramètres`

10- **Allez** dans la rubrique `Passive Mode`, puis, **configurez** les paramètres comme ci-dessous :

![](../.gitbook/assets/upykin46datudr56-873e67e3a40afe41f46c5678d602ca3b.png)

11- **Démarrez** maintenant votre `Gestionnaire de serveur`, puis allez dans `Outils > Pare-feu Windows avec fonctions avancées de sécurité` 

12- Vous voilà maintenant dans le gestionnaire de règles de pare-feu de votre serveur. **Sélectionnez** maintenant sur `Règles de trafic entrant`, dans la fenêtre de gauche. Une fois fait, cliquez sur `Nouvelle règle...` dans la fenêtre de droite.

Suivez maintenant les étapes suivantes, pour définir une nouvelle règle de pare-feu : 

* **Sélectionnez** `Port`, puis faites `Suivant >`
* **Choisissez** `TCP`, puis `Ports locaux spécifiques :` , et **saisissez** 21
* **Sélectionnez** Autoriser la connexion, puis faites `Suivant >`
* **Laissez** les 3 cases cochées par défaut, puis faites `Suivant >`
* **Définissez** un nom personnalisé pour votre règle, **mettez** par exemple "Port 21 File Zilla Server", cela permet de savoir à quoi correspond cette règle dans la liste une fois crée. **Saisissez** une description si vous le souhaitez, puis faites `Terminer`

Vous venez de définir une règle de pare-feu sur le port 21. Autrement dit : Le port 21 est maintenant "ouvert" pour l'application File Zilla.

13- Répétez maintenant les mêmes étapes qu'à l'étape 12, en remplaçant le port 21 par la plage de port **211-215** \(saisissez bien la plage, en incluant le tiret, c'est important pour que le pare-feu comprenne que c'est une plage de ports, et pas un port unique\)  

14- A partir là, votre serveur FTP devrait être accessible à distance. Si ce n'est pas le cas, **vérifiez** que vos règles de ports sont bien configurées en `TCP`, et en `UDP`.

