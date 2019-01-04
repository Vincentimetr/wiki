# Arma 3 Outils Officiels \(En cours de rédaction\)

## Arma 3 Outils Officiels \(En cours de rédaction\)

Cette catégorie contient des outils officiels créés par la Bohemia Interactive. Bohemia Interactive fournit ces outils à la communauté sous les termes qui permet l'utilisation gratuite des outils pour n'importe quel buts sauf commerciaux. N'importe quelle utilisation commerciale des outils est strictement interdite sans permission de BI.  
Vous devez être d'accord avec les termes de Contrat de licence d'Utilisateur final pour les Outils de BI avant l'utilisation de n'importe lequel des outils. https://community.bistudio.com/wiki/End\_User\_License\_Agreement\_for\_BI%27s\_Tools  
  
Les outils sont disponible gratuitement dans le magasin Steam. http://store.steampowered.com/app/233800/



## Addon Builder <a id="bkmrk-page-title"></a>

#### Information de base <a id="bkmrk-information-de-base"></a>

{% hint style="info" %}
 **Auteur:** Bohemia Interactive
{% endhint %}

{% hint style="info" %}
 **Compatibilité:** Arma 3
{% endhint %}

{% hint style="info" %}
 **Téléchargement:** [Disponible gratuitement sur Steam](http://store.steampowered.com/app/233800/)
{% endhint %}

#### Description <a id="bkmrk-description"></a>

Addon Builder est un outils d'archivage crée par Bohemia Interractive. Le but de cet outil est de convertir toutes les données dans des formats visibles par le moteur Real Virtuality et de les archiver dans une seule archive. L'outil a été autrefois connu comme [BinPBO](https://community.bistudio.com/wiki/BinPBO).

#### Utilisation <a id="bkmrk-utilisation"></a>

**Cible:** AddonBuilder.exe  
           AddonBuilder.exe -help

**Options:** Addon Builder peut utilisé dans le mode console avec les paramètres disponible [ICI](https://community.bistudio.com/wiki/Addon_Builder).

#### Licences <a id="bkmrk-licences"></a>

Licence: [Bohemia Interactive End User License Agreement](https://community.bistudio.com/wiki/End_User_License_Agreement_for_BI%27s_Tools)

Voir aussi: [BinPBO](https://community.bistudio.com/wiki/BinPBO)  

#### Paramètres <a id="bkmrk-param%C3%A8tres"></a>

{% hint style="info" %}
 Clear temp folder
{% endhint %}

 Cette case à cocher dans l'écran principal de l'interface permet à l'utilisateur d'archiver des données propres sans aucune interférence. L'archivage prend plus longtemps après avoir nettoyé le dossier temporaire, mais les données ne peuvent pas être affectées par des versions précédentes. Utilisez-le régulièrement si vous archivez des données faisant référence à d'autre addons pour assurer que tout fait correctement référence.

{% hint style="info" %}
 Sign output PBO file
{% endhint %}

 Utilisez cette option pour créer les signatures numériques du PBO. L'utilisation de la clé numérique est définie dans des options. Utilisez [DSCREATEKEY](https://community.bistudio.com/wiki/DSCreateKey) pour créer la clé.

{% hint style="info" %}
 Binarize
{% endhint %}

 Cette option vous permet de convertir les fichiers dans le format lisible par le Moteur RV. Laissez coché la plupart du temps à moins que vous ne vouliez publier les MLOD \(les sources 3D\).

{% hint style="info" %}
 List of files to copy directly
{% endhint %}

 C'est la liste d'extensions de fichiers à copier directement dans l'archive PBO. Des extensions de fichiers sont dans la liste par défaut.

{% hint style="info" %}
 Addon prefix
{% endhint %}

 Utilisez cette option pour mettre le préfixe de chemin à la structure de l'addon.

{% hint style="info" %}
 Path to signature file
{% endhint %}

 Utilisez ce chemin vers une clé si vous voulez signer votre PBO avec la signature numérique, le laisser vide dans le cas contraire.

{% hint style="info" %}
 Path to temporary folder
{% endhint %}

 C'est le chemin vers le dossier temporaire. Vide \(par défaut\), c'est le dossier temporaire Windows qui est utilisé. Pour pouvez rapidement vider ce dossier avec Clear temp folder.

{% hint style="info" %}
 Path to project folder
{% endhint %}

 C'est le même chemin que le répertoire source mais permet la jonction d'addons différent. Plus d'informations [ICI](https://community.bistudio.com/wiki/Addon_Builder).

{% hint style="info" %}
 Exclusion pattern file
{% endhint %}

 C'est le chemin du fichier qui permet d'exclure certains fichiers du PBO résultant.

  [Source et plus d'informations](https://community.bistudio.com/wiki/Addon_Builder)

