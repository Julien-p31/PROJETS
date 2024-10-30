# Installation et configuration de SSH sur un serveur Windows

### Étape 1 : Installation de OpenSSH Server
1. Ouvrez les **Paramètres** de Windows.
2. Allez dans **Applications** > **Fonctionnalités facultatives**.
3. Cliquez sur **Ajouter une fonctionnalité**.
4. Recherchez **OpenSSH Server** dans la liste et cliquez sur **Installer**.

### Étape 2 : Vérification du statut du service SSH
Après l'installation, ouvrez un terminal PowerShell en tant qu'administrateur et vérifiez que le service OpenSSH est actif :
Get-Service -Name sshd

### Étape 3 : Configuration du serveur SSH
Le fichier de configuration principal d'OpenSSH se trouve généralement à cet emplacement :
C:\ProgramData\ssh\sshd_config
Pour modifier ce fichier, ouvrez-le avec un éditeur de texte comme Notepad en tant qu'administrateur.

#### Options de configuration courantes
- **Changer le port SSH (facultatif)** : Pour des raisons de sécurité, vous pouvez changer le port par défaut (22) : 
Port 2222
- **Désactiver l'authentification par mot de passe** : Pour renforcer la sécurité, vous pouvez désactiver l'authentification par mot de passe : 
PasswordAuthentication no
- **Restreindre l'accès aux utilisateurs spécifiques** : Pour restreindre l'accès à des utilisateurs spécifiques, ajoutez : 
AllowUsers username

### Étape 4 : Démarrer le service SSH
Après avoir modifié la configuration, démarrez le service SSH :
Start-Service -Name sshd

### Étape 5 : Ouverture du port dans le pare-feu (si applicable)
Pour autoriser les connexions SSH à travers le pare-feu de Windows, exécutez la commande suivante dans PowerShell :
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
Si vous avez changé le port par défaut, remplacez 22 par votre nouveau numéro de port.

### Étape 6 : Vérification de la connexion
Vous pouvez maintenant essayer de vous connecter à votre serveur SSH depuis un client.

## Configuration du client Windows

### Étape 1 : Installation de OpenSSH Client
OpenSSH Client est souvent préinstallé sur les versions récentes de Windows 10 et 11. Pour vérifier, ouvrez PowerShell et exécutez :
ssh
Si cela renvoie une liste de commandes SSH, vous êtes prêt à utiliser SSH. Sinon, installez-le de la même manière que pour le serveur :
1. Ouvrez les **Paramètres** de Windows.
2. Allez dans **Applications** > **Fonctionnalités facultatives**.
3. Cliquez sur **Ajouter une fonctionnalité**.
4. Recherchez **OpenSSH Client** dans la liste et cliquez sur **Installer**.

### Étape 2 : Connexion au serveur SSH
Pour vous connecter à votre serveur SSH, utilisez la commande suivante dans PowerShell ou l'invite de commandes :
ssh username@server_ip
Remplacez username par votre nom d'utilisateur sur le serveur et server_ip par l'adresse IP ou le nom de domaine de votre serveur.

### Étape 3 : Utilisation de clés SSH (facultatif)
Pour éviter de saisir un mot de passe à chaque connexion, vous pouvez configurer des clés SSH :

#### Génération de clés SSH
1. Ouvrez PowerShell et générez une paire de clés SSH :
ssh-keygen -t rsa -b 4096
2. Appuyez sur Entrée pour accepter le chemin par défaut et suivez les instructions.

#### Copie de la clé publique sur le serveur
Utilisez ssh-copy-id pour copier la clé publique vers votre serveur. Si ssh-copy-id n'est pas disponible, vous pouvez copier la clé manuellement.
1. Copiez le contenu de la clé publique :
type $env:USERPROFILE\.ssh\id_rsa.pub
2. Connectez-vous à votre serveur et ajoutez cette clé au fichier authorized_keys :
echo "votre_clé_publique" >> ~/.ssh/authorized_keys

### Étape 4 : Vérification de la connexion par clé SSH
Testez la connexion SSH :
ssh username@server_ip
