# Problèmes liés à extDB

## 1 - Guide de résolution des problèmes liés à extDB2

{% hint style="danger" %}
 _Call extension 'extDB2' could not be found_
{% endhint %}

 Si vous avez cette erreur dans vos logs RPT **:**

```text
Call extension 'extDB2' could not be found
```



Vous devez vérifier les éléments suivants :   

* **Assurez-vous** que le dossier `@extDB2` est bien présent à la racine de votre serveur.
* **Assurez-vous** que "extDB2" est bien présent dans vos options de lancement, comme ceci : 

```text
-mod="@life_server;@extDB2"
```

* **Assurez-vous** que votre dossier @extDB2 contient bien un sous dossier `/addons` qui contient un .pbo
* **Assurez-vous** d'avoir la librarie Windows `tbbmalloc.dll` la racine de votre serveur.

{% hint style="danger" %}
 _extDB2: Problem with database connection_
{% endhint %}

 Si vous avez cette erreur dans vos logs RPT :

```text
extDB2: Problem with database connection
```



Vous devez vérifier les éléments suivants :  

* **Assurez-vous** que votre fichier extdb-conf.ini situé dans votre dossier @extDB2 est bien configuré avec vos identifiants pour vous connecter à votre base de données.
* **Assurez-vous que cette ligne :**

{% code-tabs %}
{% code-tabs-item title="extdb-conf.ini" %}
```text
[MySQL_Example] ; <-- celle ci
Type = MySQL
Name = Database_Name

Username = root
Password = password

IP = 127.0.0.1
Port = 3306

;minSessions = 2
idleTime = 60

compress = false
; Really should only use this if MySQL server is external. Also only for MySQL

Secure Auth = true
; Recommend you turn this on  http://dev.mysql.com/doc/refman/5.6/en/mysql-command-options.html#option_mysql_secure-auth
```
{% endcode-tabs-item %}
{% endcode-tabs %}



est bien modifiée comme ceci `[altislife]`

* **Assurez-vous** que l'utilisateur utilisé a les permissions nécessaires pour se connecter à la base de données ET que vous pouvez vous connecter en local / distant avec ce dernier.

{% hint style="danger" %}
 Si votre problème n'est pas répertorié, vous pouvez alors faire une demande d'aide sur le Forum, ou sur Discord directement.
{% endhint %}

## 2 - Guide de résolution des problèmes liés à extDB3 <a id="bkmrk-page-title"></a>

{% hint style="danger" %}
 _Call extension 'extDB3' could not be found_
{% endhint %}

 Si vous avez cette erreur dans vos logs RPT :

```text
Call extension 'extDB3' could not be found
```

Vous devez vérifiez les éléments suivants :   

* **Assurez-vous** que le dossier `@extDB3` est bien présent à la racine de votre serveur.
* **Assurez-vous** que "extDB3" est bien présent dans vos options de lancement, comme ceci : 

```text
-mod="@life_server;@extDB3"
```

* **Assurez-vous** que votre dossier @extDB3 contient bien un sous dossier `/addons` qui contient un .pbo
* **Assurez-vous** d'avoir les 2 libraries Windows `tbbmalloc.dll` et `tbbmalloc_x64.dll` à la racine de votre serveur

{% hint style="danger" %}
 _extDB3: Problem with database connection_
{% endhint %}

 Si vous avez cette erreur dans vos logs RPT :

```text
extDB3: Problem with database connection
```

Vous devez vérifier les éléments suivants :

* **Assurez-vous** que votre fichier extdb-conf.ini situé dans votre dossier @extDB3 est bien configuré avec vos identifiants pour vous connecter à votre base de données.
* **Assurez-vous que cette ligne :**

```text
[Main]
Version = 1

Randomize Config File = false
;; Randomizes Config File after loading.
;;   Recommend to turn on, if you have enabled filepatching on arma.

Allow Reset = false
;; Allows 9:RESET, usefull for development work

Thread = 0;
;; Option to force number of worker threads for extDB3.
;;   Auto = 0, Min = 2, Max = 6

[Log]
Flush = true;
;; Flush logfile after each update.
;;    Option really only usefull if running DEBUG BUILD


[Database] <---- Cette ligne
IP = 127.0.0.1
Port = 3306
Username = changeme
Password = changeme
Database = changeme
```

est bien modifiée comme ceci `[altislife]`  

* **Assurez-vous** que l'utilisateur utilisé a les permissions nécessaires pour se connecter à la base de données ET que vous pouvez vous connecter en local / distant avec ce dernier.

{% hint style="danger" %}
 Si votre problème n'est pas répertorié, vous pouvez alors faire une demande d'aide sur le Forum, ou sur Discord directement.
{% endhint %}

