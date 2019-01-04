# Installation et configuration sous Windows

## **Installations des logiciels et applications de base**

Pour partir sur de bonnes bases, vous devez avoir quelques logiciels pour gérer votre serveur, que voici : 

* [Google Chrome](https://www.google.fr/chrome/browser/desktop/index.html) \(car Internet Explorer est trop sécurisé, et donc pas simple d'utilisation\)
* [WinRar ](http://www.win-rar.com/predownload.html?&L=10&Version=64bit)\(pour gérer vos archives compressées\)
* [PBOManager ](http://www.armaholic.com/page.php?id=16369)\(pour gérer, et créer / décompresser les addons au format PBO\)
* [NotePad++](http://www.armaholic.com/page.php?id=8692) \(pour modifier le code de votre serveur\)
* [FileZilla Server](https://filezilla-project.org/download.php?type=server) \(permet d'avoir accès aux fichiers de votre serveur à distance via FTP\)
* [SteamCMD ](https://developer.valvesoftware.com/wiki/SteamCMD:fr#Installation)\(console BASH permettant de télécharger ArmA3 plus rapidement\)

{% hint style="warning" %}
 **ATTENTION** : Assurez vous bien de télécharger les logiciels avec la version adaptée à votre serveur. \( 64 bits, Windows etc.. \)
{% endhint %}

## Installation d'Arma 3 sur votre machine <a id="bkmrk-page-title"></a>

### **Téléchargement d'Arma 3 via la console BASH SteamCMD**

Une fois que vous avez téléchargé le SteamCMD, vous pouvez décompressez le fichier .exe dans un nouveau dossier **steamcmd**, que vous allez créer à la racine de votre disque par exemple C:\steamcmd.

**Exécutez** le fichier steamcmd.exe, puis **saisissez** :

```text
login VOTRE_NOM_DE_COMPTE_STEAM VOTRE_MOT_DE_PASSE VOTRE_CODE_STEAM_GUARD
```

Une fois connecté, vous verrez que le fichier steamcmd.exe vient de télécharger plusieurs fichiers, votre dossier va donc ressembler à ça : 

![](../.gitbook/assets/ofpa4ae3ew7kt8iq-d1da138fa48f8b2be38bb10c3adaf7c6.png)

Une fois votre compte identifié, vous devriez voir ceci dans la console :

![](../.gitbook/assets/k8rmvdejflytbv5j-6be8386e3920e7f3701723549b0bc494.png)

**Saisissez** alors dans la console :1

```text
force_install_dir c:/arma3_serveur
```

3. **Tapez** dans la console ****:1

```text
app_update 233780 validate
```

Un téléchargement devrait alors se lancer : 

![](../.gitbook/assets/mjlc9sjiopqpcxuv-8d8b36e5d400dfb6bf9abf21a2b48033.png)

Une fois le téléchargement terminé, vous devriez avoir un message confirmation, assurez-vous en, puis **saisissez** dans la console : 1

```text
quit
```

 Comme ceci :

![](../.gitbook/assets/82zt23nip3g45xrm-fdbde72d65d55b3256b20bf2f79c2e04.png)

Vous devez maintenant installer **DirectX11** qui permet entre autres de gérer une partie de la physique d'Arma, **téléchargez** `dxwebsetup.exe` 

{% file src="../.gitbook/assets/dxwebsetup.exe" %}

Vous venez de télécharger Arma 3 dans votre dossier **C:/arma3\_serveur**. Vous pouvez maintenant passer à la page suivante.

