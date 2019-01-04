# Installation et configuration sous Linux



## Pré-requis d'installation <a id="bkmrk-page-title"></a>

Avant de commencer ce guide d'installation, vous devez absolument vérifier les pré-requis systèmes pour installer un serveur AltisLife depuis [cette page essentielle.](https://docs.altisdev.com/wiki/serveur-altis-life/introduction)  


{% hint style="danger" %}
**ATTENTION :** Vous devez disposer d'un serveur Linux de type Debian - Ubuntu ou CentOS, nous vous recommandons vivement de **ne pas utiliser Fedora**.
{% endhint %}

**Nous avons besoin de plusieurs logiciels afin de compléter ce guide sans problème**

* [FilleZilla](http://filezilla.fr/) \( Ce qui nous permettra d'envoyer nos fichiers de missions et mods \)
* [PBOManager](http://www.armaholic.com/page.php?id=16369) \( Ce qui nous permettra d'encoder nos fichier en PBO pour les envoyez sur notre serveur \)
* [Putty](http://www.putty.org/) \( Ce qui nous permettra de nous connecter en ssh à notre serveur linux \)



## 2 - Installation des paquets <a id="bkmrk-page-title"></a>

 Dans cette partie, nous allons devoir **installer les différents paquets nécessaires** pour créer un serveur AltisLife.

{% hint style="info" %}
Si vous disposez d'un serveur distant, vous allez devoir vous connecter dessus à l'aide de Putty téléchargé précédemment.
{% endhint %}

 Nous allons donc voir **comment utiliser Putty** et **installer nos dépendances** et paquets sur notre futur serveur !

### **1 - Lancement et configuration de Putty :**

![](../.gitbook/assets/ugx5gpgd5cjclkif-putty.png)

Par exemple, vous devriez remplir le champ **Host Name \(or IP address\) avec l'adresse IP ou nom d'hôte de votre serveur** ainsi que le port SSH de votre serveur \(**par défaut:** 22\)

![](../.gitbook/assets/5cqqurcyqdkv4zh3-ip.png)

Vous pouvez **enfin appuyer sur le bouton "Open",** vous devriez avoir une fenêtre qui vous **demande l'utilisateur sur lequel vous voulez vous connecter** \(vous d**evez** répondre soit root, soit un utilisateur créée au préalable\), cette fenêtre apparaitra :

![](../.gitbook/assets/2c8ada35b86a28c0adcdf13a5697b8c7.png)

{% hint style="info" %}
Une fois, cela fait, le terminal devrait demander votre mot de passe, il ne sera pas affiché ****lorsque vous écrirez, **par mesure de sécurité ça sera toujours comme ça sur Linux.**
{% endhint %}

![](../.gitbook/assets/spagh9zy9dmwhkqc-image-1503737871741.png)

### **2 - Installation des paquets pour LGSM**

Pendant ce chapitre, Linux dispose de plusieurs distributions, il existe plusieurs dérivés de Linux qui ont des gestionnaires de paquets :  
  
- Debian, Ubuntu : apt-get  
- CentOS : yum

Avant l'installation des différents paquets, vous devez vérifier la version de votre serveur dispose d'un processeur 32 bits ou 64 bit via la commande suivante.1

```text
getconf LONG_BIT
```

Vous obtiendrez soit 32, soit 64 en réponse de cette commande.

#### **2.1 - Installation des paquets sous Ubuntu**

Si vous êtes sur **une version 64 bits d'Ubuntu**, **vous devez installer les paquets suivants.**1

```text
sudo dpkg --add-architecture i386; sudo apt-get update;sudo apt-get install postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386
```

Si vous êtes **une version 32 bits d'Ubuntu**, **vous devez installer les paquets suivants.**1

```text
sudo apt-get install postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates tmux libstdc++6
```

#### **2.2 - Installation des paquets sous Debian**

Si vous êtes sur **une version 64 bits de Debian**, **vous devez installer les paquets suivants.**1

```text
dpkg --add-architecture i386; 
```

2

```text
apt-get update; 
```

3

```text
apt-get install sudo binutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386
```

Si vous êtes **une version 32 bits de Debian**, **vous devez installer les paquets suivants.**1

```text
  apt-get install sudo binutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates tmux libstdc++6
```

#### **2.3 - Installation des paquets sous CentOS**

Si vous êtes sur **une version 64 bits de CentOS**, **vous devez installer les paquets suivants.**1

```text
yum install postfix curl wget bzip2 gzip unzip python tmux glibc.i686 libstdc++ libstdc++.i686
```

Si vous êtes **une version 32 bits de CentOS**, **vous devez installer les paquets suivants.**1

```text
yum install postfix curl wget bzip2 gzip unzip python tmux libstdc++
```

### **3 - Installation du serveur MySQL ou MariaDB**

Nous allons installer lors de ce chapitre, **MariaDB** qui est un remplacement de **MySQL**.  
Nous vous laissons ainsi le choix d'utiliser **MariaDB** ou **MySQL** pour des raisons de préférences personnelles.  
  
Néanmoins, **MariaDB** est un remplacement plus performant et plus flexible que **MySQL** et **nous vous le recommandons sérieusement.**

**Nous allons ajouter les dépôts pour** **MariaDB** pour pouvoir installer MariaDB pour **Debian 8** :1

```text
apt-get install software-properties-common
```

2

```text
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
```

3

```text
add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.1/debian jessie main'
```

Si vous rencontrez un problème avec `dirmngr` \(particulièrement sur Debian 9\), **vous devez** :

1. `apt remove gnupg`
2. `apt install --reinstall gnupg2`
3. `apt install dirmngr`

Dans le cas où votre serveur est sous **Ubuntu 16.10**, voici les différentes commandes :1

```text
sudo apt-get install software-properties-common
```

2

```text
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
```

3

```text
sudo add-apt-repository 'deb [arch=amd64,i386] http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.1/ubuntu yakkety main'
```

Dans le cas où votre serveur est sous **CentOS 7**, **vous n'avez strictement rien à faire**, vous pouvez directement installer **MariaDB.**

#### **3.2 Installation de MySQL**

**Nous devons AVANT TOUT mettre à jour notre serveurs et la liste de nos dépôts via ces commandes :**

 1

```text
apt-get update && apt-get upgrade && apt-get dist-upgrade -y
```

Nous allons **installer le client et le serveur** MySQL, cette commande est valide pour **Debian et Ubuntu** :1

```text
apt-get -y install mariadb-server
```

 Si vous êtes sous **CentOS**, cette commande est valide :1

```text
sudo yum install MariaDB-server MariaDB-client
```

Lors de l'installation, **vous devez OBLIGATOIREMENT entrer un mot de passe pour l'utilisateur "root" !**  
V**ous devrez vous en souvenir pour la prochaine étape, alors gardez-le bien précieusement !**

![](../.gitbook/assets/dpaamu41rtrkvuh3-image-1503735255179.png)

\*\*\*\*

### **3.2 Installation d'un serveur web**

Dans ce chapitre, nous allons installer Apache 2 qui sera nécessaire durant la suite du guide, cependant, vous êtes libre d'adapter cette partie de vos propres moyens en installant Nginx, OpenLitespeed ou n'importe quel autre serveur web

Nous allons d'abord **installer les dépôts PHP pour Ubuntu et Debian** :1

```text
apt-get install apt-transport-https lsb-release ca-certificates
```

2

```text
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
```

3

```text
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
```

4

```text
apt-get update
```

Ensuite, nous allons ensuite **installer le serveur Apache 2** :1

```text
apt-get install apache2
```

Si vous souhaitez installer PHP 5.6, vous pouvez exécuter cette commande :1

```text
apt-get install php5-mysqlnd php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl libapache2-mod-php5
```

Si vous souhaitez PHP 7, vous pouvez utiliser les commandes suivantes :1

```text
apt install -y --no-install-recommends php7.0 libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-gd php7.0-mcrypt php7.0-msgpack php7.0-memcached php7.0-intl php7.0-sqlite3 php7.0-gmp php7.0-geoip php7.0-mbstring php7.0-redis php7.0-xml php7.0-zip
```

Si vous souhaitez PHP 7.1, vous pouvez utiliser les commandes suivantes :1

```text
apt install -y --no-install-recommends php7.1 libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php7.1-gd php7.1-mcryp
```



## 3 - Installation du Serveur Arma 3 <a id="bkmrk-page-title"></a>

1 - Nous allons créer l'user qui gérera notre serveur arma 3, pour ma part se sera : `arma3`1

```text
adduser arma3
```

2 - Une fois l'utilisateur crée, nous lui définissons un mot de passe avec cette commande :1

```text
 passwd arma3
```

Vous serez ensuite invité à saisir un nouveau mot de passe. N'ayez crainte, votre saisie ne va pas apparaître, car sous Linux, nous sommes un peu parano, mais votre mot de passe sera bel et bien enregistré une fois avoir fait _Entrée_

3 - **Assurons-nous** que notre user à bien accès à son dossier1

```text
chown -R arma3 /home/arma3
```

4 - Ensuite nous nous **connectons** en tant que notre user :1

```text
su arma3
```

5 - **Déplaçons-nous** à son répertoire :1

```text
cd /home/arma3
```

6 - **Téléchargeons** maintenant les paquets lgsm grâce à cette commande :1

```text
wget -N --no-check-certificate https://gameservermanagers.com/dl/linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh arma3server
```

On prépare le fichier d’installation ;1

```text
./arma3server install
```

\*\*\*\*

**Pour la faciliter connectez vous avec FileZilla :**   
En `hôte` , **renseignez** l'IP de votre serveur, en `Identifiant` **renseignez** votre user `arma3` crée sur votre machine et en mot de passe, **renseignez** le mot de passe saisi pour l'user `arma3` En port, mettez `22` \(qui est le port SSH par défaut\)

Là vous devriez voir votre répertoire !

7 - **Allez** dans :1

```text
lgsm/config-lgsm/arma3server/_default.cfg
```

**Copiez** le contenu du fichier _\_default.cfg_

Puis, **allez** dans :1

```text
lgsm/config-lgsm/arma3server/arma3server.cfg
```

**Éditez** le fichier _arma3server.cfg_, copiez/collez le contenu du fichier précédent, et pour finir, **ajoutez** votre steamlogin ainsi que les mods.

Pour ajouter un mod/add-on, **référez-vous** à la ligne ci-dessous, présente dans votre fichier _arma3server.cfg_

 Ligne de lancement des mods/add-ons :1

```text
servermods="\@extDB3\;\@life_server"
```

Et si vous souhaitez ajouter de nouveaux mods/add-ons sur votre serveur, suivez cet exemple :1

```text
mods = "\@extDB3\;\@life_server\;\@Mod1\;\@Mod2   etc..."
```

De plus vous pouvez déjà upload vos mods dans le dossier `serverfiles` qui se trouve à la racine de votre répertoire.

8 - Ensuite tapez ces deux commandes sur Putty qui permettrons de lancer l'installation d'Arma 3 :1

```text
cd /home/arma3
```

2

```text
​
```

3

```text
./arma3server install
```

Normalement si vous avez bien tout suivi votre serveur est en cours d’installation.  
**PS** : Le code de la double authentification de Steam dépend de votre sécurité Steam configurée   
\(Code généré par l'appli mobile Steam ou un code reçu directement par mail\)

**Installation et configuration de la base de données**

9 - **Allez** maintenant sur votre console SSH via Putty, nous allons nous connecter à la console MySQL / MariaDB en faisant la commande suivante :1

```text
 mysql -u root -p
```

Une fois fait,  saisissez le mot de passe du Serveur SQL, que vous avez défini à l'étape précédente, lors de l'installation du paquet `mariadb-server`.

Si tout s'est bien passé, vous devriez avoir quelque chose comme ça :

![](../.gitbook/assets/0hnbmvswmz1qbuut-d7089e11316877d6c893e28595f04669.png)

10 - Nous allons maintenant créer un nouvel utilisateur SQL, que nous allons appeler `arma3` en tapant :1

```text
CREATE USER 'arma3'@'%';
```

Puis, nous allons définir le mot de passe pour le user, pour se faire, **saisissez** cette commande : 1

```text
UPDATE mysql.user SET password=PASSWORD("MDP_A_DEFINIR") where User="arma3";
```

11 - Nous allons maintenant rendre le serveur accessible à distance. Par défaut, le serveur SQL n'écoute qu'en localhost. Il faut donc mettre en commentaire le paramètre `bind-adress` du fichier de config de MySQL / MariaDB, Pour se faire, **faites** :1

```text
nano /etc/mysql/my.cnf
```

**Cherchez** ensuite `bind-adress` et ajoutez un _\# ****_devant afin de le commenter.

12 - Une fois fait, il va falloir redémarrer le serveur SQL, pour se faire, **saisissez** : 1

```text
/etc/init.d/mysql restart
```

Si tout s'est bien déroulé, vous devriez avoir ce message de confirmation :

![](../.gitbook/assets/kmaj2omx9072qxnl-89b83b8858c9b50bf1c877b2ee195445.png)

Votre serveur SQL est maintenant accessible à distance.

13 - Il vous faut maintenant télécharger un logiciel de gestion de bases de données, avec lequel nous allons par la suite gérer à distance la base de données du serveur. **Téléchargez** donc le logiciel suivant : 

[Télécharger **HeidiSQL**](https://www.heidisql.com/download.php)

Une fois avoir exécuté et installé le logiciel, vous devriez avoir cette interface sous vos yeux : 

![](../.gitbook/assets/u7noirfcdf2xgzcs-55ce1a49ff53c83f10b0f8f94edbfe6f.png)

**Saisissez** alors les informations de connexion de votre serveur, à savoir :

* Adresse IP
* Utilisateur, qui sera ici arma3
* Mot de passe
* Port \(laisser 3306 car port par défaut\)

Puis, **cliquez** sur `Ouvrir`

Si la connexion échoue, assurez-vous d'avoir correctement suivi les étapes précédentes

14 - Une fois la connexion réussie, vous serez devant cette interface : 



Suivez alors ces étapes pour importer la base de données :

* Téléchargez le fichier :

{% file src="../.gitbook/assets/altislife.sql" %}

* Sur HeidiSQL, **allez** dans `Fichier > Exécuter un fichier SQL...` puis ouvrez le fichier _altislife.sql_
* Une erreur va apparaître, c'est un simple problème de type, faites `OK`
* Allez ensuite dans votre console SSH via Putty, puis **saisissez** cette commande, pour autoriser l'user arma3 à interagir avec la base de données `altislife` :

1

```text
GRANT ALL PRIVILEGES ON altislife.* TO 'arma3'@'%';
```

**Installation d'AltisLife et de ses dépendances**

15 - Nous avons maintenant un serveur SQL qui fonctionne, avec une base de données correcte. Il faut maintenant installer le Framework AltisLife, ainsi que ses dépendances. **Téléchargez-les** :

* [Framework Altis Life - Mission](https://github.com/AsYetUntitled/Framework)
* [extDB3](https://bitbucket.org/torndeco/extdb3/downloads/)

16 - **Envoyez** vos mods via FileZilla \(attention de bien être connecté en tant que votre user qui gère votre répertoire\) dans le répertoire `serverfiles/`

17 - **Sélectionnez** tout vos mods, puis faites un clic droit 'Droit d’accès au fichier' puis remplissez le comme ceci :

![](../.gitbook/assets/e33d41d0cd86cd1d604c9b048c8848d5.png)

18 - **Mettez** votre mission en .pbo dans le dossier `mpMissions`, puis les configs de vos servers se trouvent dans le dossier `cfg`

19 - **Allez** dans votre dossier `@extDB3` puis **éditez** le fichier _extDB3-conf.ini_ :

![](../.gitbook/assets/1d4ec667df70266bd527335ada2dac27.png)

20 - **Remplacez** "passdb" par le mot de passe d'accès de votre user arma3.

**Démarrage du serveur**

**Rappel** : _life\_server_ et votre mission _Altis\_Life.Altis_ doivent être au format .PBO \(via PBOManager\)

21 - **Rendez-vous** sur votre console SSH via Putty, puis **retournez** à la racine de votre user avec votre user en faisant :1

```text
su arma3
```

Puis :1

```text
cd /home/arma3
```

Pour finir, **lancez** votre serveur en faisant : 1

```text
./arma3server start
```

## 4 - Référencement erreurs <a id="bkmrk-page-title"></a>

**1. Problème liée a extDB3**

**1.1 Erreur dans la console possible :**

`21:50:30 "extDB3: Error with Database Connection"`

Les logs extDB3 ne sont pas généré.

Le correctif est le suivant : 

* `cd /home/arma3/serverfiles/@extDB3`
* `ldd extDB3.so`

Cela vous retournera les dépendances qu'a besoin extDB3 :1

```text
linux-gate.so.1 (0xf776f000)
```

2

```text
        libtbbmalloc.so.2 => not found 
```

3

```text
        libdl.so.2 => /lib/i386-linux-gnu/i686/cmov/libdl.so.2 (0xf7215000)
```

4

```text
        libz.so.1 => not found
```

5

```text
        libm.so.6 => /lib/i386-linux-gnu/i686/cmov/libm.so.6 (0xf71ce000)
```

6

```text
        libpthread.so.0 => /lib/i386-linux-gnu/i686/cmov/libpthread.so.0 (0xf71b2000)
```

7

```text
        libc.so.6 => /lib/i386-linux-gnu/i686/cmov/libc.so.6 (0xf7005000)
```

8

```text
        /lib/ld-linux.so.2 (0xf7772000)
```

  Il manque 2 dépendances, installons les \(en root\):

* `apt-get install libtbb2:i386`
* `apt-get install lib32z1-dev` 

Maintenant extDB3 devrait ce lancer correctement

Si d'autres dépendances sont manquantes recherchez les et faite un apt-get install de la librairie

 **1.2 Autre Erreur dans la console \(Sur VPS\) :**

* `extDB 3 : terminate called after throwing an instance of 'std::runtime_error'  what():  locale::facet::_S_create_c_locale name not valid`

Le correctif est le suivant \(en root\) : 

* `export LC_ALL="en_US.UTF-8"`

Le problème de langage est maintenant réglé

