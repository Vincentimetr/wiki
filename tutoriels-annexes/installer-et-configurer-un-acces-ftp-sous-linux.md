# Installer et configurer un accès FTP \(Sous Linux\)

## 1. Installation de Proftpd <a id="bkmrk-page-title"></a>

### **Installer proftpd pour son serveur FTP sous linux.**

> Nous allons en premier lieu nous connecter en shh à notre user root  linux \( mot de passe reçu par mail, tous dépend de votre hébergeur\)

#### **1. Exécution de la commande d'installation en mode sudo :**

\(Si vous n'avez pas sudo, installer le `apt-get install sudo` \)

![Terminal SSH - Putty](../.gitbook/assets/c7oz0v5ao51xacyt-sudoinstall.png)

#### **2. Une fois la commande lancée vous terminerez sur cette page d'instruction :**

![Terminal SSH -Putty](../.gitbook/assets/0spsyqwtf5floueq-config.png)

* Si vous sélectionnez l'option 'Depuis inetd' , votre service ftp ne ce lancera que quand quelqu'un s'y connectera mais le service sera beaucoup plus long à ce lancer.
* Si vous sélectionnez l'option 'Indépendamment', votre service ftp sera lancé en permanence.

L'option Indépendamment est fortement conseillée, à vous de choisir.



## 2. Configuration de proftpd <a id="bkmrk-page-title"></a>

### **Configurer le service proftpd.**

Dans le chapitre précèdent, nous avons vue comment installer proftpd ! Nous allons maintenant le configurer

#### **1. Chemin d'accès pour configurer protfpd :**

Voila, nous touchons au but, normalement nous sommes toujours connecter en ssh à notre serveur linux.

Tapez cette commande pour allez dans le dossier de configuration :

```text
sudo nano /etc/proftpd/proftpd.conf
```

Ce qui vous affichera : 

![Terminal SSH - Putty](../.gitbook/assets/qjsvnsd4ibfd1gf2-3d2b0e3354151d1c357217645ddcd8ae.png)

Le `ServerName` est le nom afficher lors que la connexion a notre serveur FTP.

Vous pourrez remarquer que le `#DefaultRoot` et de-commentez, c'est pour que notre user qui se connecte reste bloqué à sa racine.

Relancer votre service avant de vous connecter :

```text
sudo /etc/init.d/proftpd reload
```



{% hint style="success" %}
Vous pouvez dès à présent vous connecter avec user via Filezilla.

L'identifiant et le mot de passe reste les mêmes.
{% endhint %}



![FileZilla - FTP](../.gitbook/assets/zl0bmluankrejwzv-sucees.png)



