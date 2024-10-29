# Installation et configuration de SSH sur un serveur Debian

### Étape 1 : Installation de OpenSSH Server
Pour installer le serveur OpenSSH sur Debian, ouvrez un terminal et exécutez les commandes suivantes :

sudo apt update
sudo apt install openssh-server

### Étape 2 : Vérification du statut du service SSH
Après l'installation, vérifiez que le service SSH fonctionne correctement :

sudo systemctl status ssh

Vous devriez voir un message indiquant que le service est actif (running).

### Étape 3 : Configuration du serveur SSH
Le fichier de configuration principal d'OpenSSH se trouve à l'emplacement suivant :

/etc/ssh/sshd_config

Pour modifier ce fichier, utilisez un éditeur de texte tel que nano :

sudo nano /etc/ssh/sshd_config

#### Options de configuration courantes
- **Changer le port SSH (facultatif)** :
  Pour des raisons de sécurité, vous pouvez changer le port par défaut (22) en un autre numéro de port :

  Port 2222

- **Désactiver l'authentification par mot de passe** :
  Pour renforcer la sécurité, vous pouvez désactiver l'authentification par mot de passe et n'autoriser que l'authentification par clé publique :

  PasswordAuthentication no

- **Restreindre l'accès aux utilisateurs spécifiques** :
  Pour restreindre l'accès à des utilisateurs spécifiques, ajoutez :

  AllowUsers username

### Étape 4 : Redémarrer le service SSH
Après avoir apporté des modifications à la configuration, redémarrez le service SSH pour appliquer les changements :

sudo systemctl restart ssh

### Étape 5 : Ouverture du port dans le pare-feu (si applicable)
Si vous utilisez ufw (Uncomplicated Firewall), ouvrez le port SSH :

sudo ufw allow ssh

Si vous avez changé le port par défaut, remplacez ssh par le numéro de port que vous avez configuré :

sudo ufw allow 2222/tcp

### Étape 6 : Vérification de la connexion
Vous pouvez maintenant essayer de vous connecter à votre serveur SSH depuis un client.

## Configuration du client Ubuntu

### Étape 1 : Installation de OpenSSH Client
Sur Ubuntu, le client SSH est souvent préinstallé. Pour l'installer ou le mettre à jour, exécutez :

sudo apt update
sudo apt install openssh-client

### Étape 2 : Connexion au serveur SSH
Pour vous connecter à votre serveur SSH, utilisez la commande suivante dans le terminal :

ssh username@server_ip

Remplacez username par votre nom d'utilisateur sur le serveur et server_ip par l'adresse IP ou le nom de domaine de votre serveur.

### Étape 3 : Utilisation de clés SSH (facultatif)
Pour éviter de saisir un mot de passe à chaque connexion, vous pouvez configurer des clés SSH :

#### Génération de clés SSH
Sur le client Ubuntu, générez une paire de clés SSH :

ssh-keygen -t rsa -b 4096

Appuyez sur Entrée pour accepter le chemin par défaut et suivez les instructions pour protéger votre clé par une phrase secrète.

#### Copie de la clé publique sur le serveur
Utilisez ssh-copy-id pour copier la clé publique vers votre serveur :

ssh-copy-id username@server_ip

Après avoir entré votre mot de passe, vous devriez pouvoir vous connecter sans mot de passe.

### Étape 4 : Vérification de la connexion par clé SSH
Testez la connexion SSH :

ssh username@server_ip
