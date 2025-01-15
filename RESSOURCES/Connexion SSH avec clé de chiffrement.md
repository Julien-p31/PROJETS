## 1. Définition

La connexion SSH (Secure Shell) est un protocole de communication sécurisé entre deux systèmes. Elle permet l'échange de données en toute sécurité sur des réseaux non sécurisés, grâce à un chiffrement fort des données. Ce protocole assure également l'authentification et garantit l'intégrité des données.

- **Sécurité** : Les données sont chiffrées pour éviter l'écoute clandestine et assurer la confidentialité.
- **Authentification** : Plusieurs méthodes sont disponibles, dont l'authentification par mots de passe, clés publiques/privées, ou certificats.

## 2. Utilisation

Une connexion SSH se fait d'un **client** vers un **serveur**. Dans le cas de l'authentification par clés :

- **Clé Privée** : Elle reste sur le client et doit être protégée car elle permet de s'authentifier.
- **Clé Publique** : Elle est stockée sur le serveur et peut être partagée librement pour valider une signature de la clé privée correspondante.

#### Exemple avec un serveur Debian et des clients Windows 10 et Ubuntu :
- Le serveur doit avoir **OpenSSH** installé et configuré.
- Les clients utilisent respectivement **PuTTY** (Windows) ou **SSH** en ligne de commande (Ubuntu).

## 3. Installation et Configuration du Serveur SSH

### a. Installation

Sur le serveur Debian :

```
apt install openssh-server
```

Cela installe le serveur SSH et le client SSH.

Vérification de l’état du service :

```
systemctl status ssh
```

b. Création d'un Compte SSH<br>
Créer un utilisateur pour la connexion SSH :

```
adduser wilder
```

c. Configuration du Fichier sshd_config<br>
Éditer le fichier de configuration /etc/ssh/sshd_config :

Créer une copie de sauvegarde avant modification :

```
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bkp
```

Modifier les paramètres, par exemple pour changer le port ou autoriser un utilisateur :

```
echo "Port 2222" >> /etc/ssh/sshd_config
echo "AllowUsers wilder" >> /etc/ssh/sshd_config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
```

Redémarrer le service SSH :

```
systemctl restart sshd
```

d. Limitation du Nombre de Connexions<br>
Limiter le nombre de connexions simultanées pour l'utilisateur wilder :

Modifier le fichier /etc/security/limits.conf :

```
wilder hard maxlogins 1
```

Redémarrer le service SSH :

```
systemctl restart sshd
```

## 4. Sur le Client Ubuntu<br>
a. Installation de openssh-client<br>
Installer le client SSH :

```
apt install openssh-client
```

b. Connexion<br>
Tester la connexion avec l'utilisateur root (qui devrait échouer) :

```
ssh root@192.168.1.20
```

Se connecter avec l'utilisateur wilder :

```
ssh wilder@192.168.1.20
```

Passer en root après la connexion :

```
sudo -i
```

## 5. Sur Windows 10<br>
a. Utilisation de PuTTY<br>
Téléchargez et installez PuTTY.<br>
Configurez PuTTY :<br>

```
Host Name : Adresse IP du serveur Debian
Port : 22
```

Sauvegardez la session sous un nom comme "Debian".<br>
Lors de la première connexion, acceptez la clé SSH et entrez les identifiants.<br>
b. Utilisation de PowerShell<br>
Vérifiez si OpenSSH est installé :

```
Get-WindowsCapability -Online | Where-Object { Name -like "OpenSSH*" }
```

Installez-le si nécessaire :

```
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
```

Connectez-vous avec la commande :

```
ssh wilder@192.168.1.20
```

## 6. Connexion SSH par Clé<br>
a. Génération de Clé sur Ubuntu<br>
Générez une paire de clés RSA de 4096 bits :

```
ssh-keygen -t rsa -b 4096
```

Sauvegardez la clé privée et publique dans le dossier ~/.ssh/.

Clé Privée : ubuntu_ssh<br>
Clé Publique : ubuntu_ssh.pub<br>
Copiez la clé publique sur le serveur :

```
ssh-copy-id -i ubuntu_ssh.pub wilder@192.168.1.20
```

Vérification : la clé doit être présente dans le fichier /home/wilder/.ssh/authorized_keys.

b. Génération de Clé sur Windows avec PuTTYgen<br>
Lancez PuTTYgen.

Choisissez RSA et 4096 bits.

Cliquez sur Generate et déplacez la souris pour générer la clé.

Sauvegardez les clés publique et privée.

Copiez la clé publique sur le serveur, puis ajoutez-la dans le fichier authorized_keys.

Dans PuTTY, configurez l'utilisation de la clé privée dans Connection -> SSH -> Auth.

## 7. Configuration Avancée<br>
a. Activation du Strict Mode<br>
Activez le mode strict pour vérifier les permissions des fichiers SSH :

```
StrictModes yes
chmod go-w /home/wilder/
chmod 700 /home/wilder/.ssh
chmod 600 /home/wilder/.ssh/authorized_keys
```

Relancez le service SSH :

```
systemctl restart ssh
```

b. Connexion sans Mot de Passe<br>
Désactivez l'authentification par mot de passe :

```
PasswordAuthentication no
ChallengeResponseAuthentication no
```

Cela nécessite que vous conserviez la clé privée en toute sécurité.

c. Connexion à Plusieurs Serveurs<br>
Modifiez ou créez le fichier ~/.ssh/config :

```
Host serveur1
  HostName serveur1.domain.tld
  User wilder
  Port 22
  IdentityFile /home/remi/.ssh/id_rsa
```

Se connecter directement en utilisant :

```
ssh serveur1
```

## 8. Connexion SSH à partir de l'Hôte<br>
Configurez la carte réseau de la VM serveur en "Réseau privé hôte" ou en "Pont". Vous pouvez aussi utiliser le mode NAT, mais cela nécessitera une redirection de port.
