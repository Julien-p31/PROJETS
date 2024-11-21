# 1. Vérification de l'installation et activation d'OpenSSH sur les deux machines

## Sur le client :

1. Vérifie que `openssh-server` est installé :### 1. Vérification de l'installation et activation d'OpenSSH sur les deux machines

#### Sur le client :
1. Vérifie que `openssh-server` est installé :
``sshd -V  # Pour vérifier si le serveur SSH est installé``
   
Si ce n'est pas le cas, installe-le :
``sudo apt install openssh-server``<br>
``sshd -V  # Pour vérifier l'installation``
   
3. Vérifie si le service SSH est activé :
``systemctl status ssh  # Pour vérifier le statut du service SSH``

Si le service n'est pas activé, rends-le actif au démarrage :
``systemctl enable ssh  # Active SSH au démarrage``<br>
``systemctl status ssh  # Vérifie que SSH est activé``<br>
``systemctl status sshd  # Vérifie que le service SSHD fonctionne correctement``

### 2. Configuration réseau

1. Met les machines sur le même réseau (en mode pont pour les machines virtuelles), puis redémarre le service réseau :
``sudo systemctl restart networking``  # Redémarre le service réseau
ou si tu utilises `NetworkManager` :
``sudo systemctl restart NetworkManager``
   
3. Vérifie l'adresse IP de la machine avec :
``ip a``  # affiche les informations réseau, dont l'IP

4. Vérifie la connectivité réseau avec le ping :
``ping <adresse_ip>``  # Ping l'adresse IP de la machine distante


### 3. Vérification de la connexion SSH depuis le serveur

1. Depuis le serveur, teste la connexion SSH vers le client :
``ssh client@ip``  # Se connecter en SSH au client

3. Lorsque tu es invité à entrer le mot de passe, fais-le, puis quitte :

exit  # Quitte la session SSH


### 4. Création et déploiement de la clé SSH

1. Sur le serveur, crée une clé SSH (pas de passphrase si tu ne souhaites pas de protection par mot de passe) :
``ssh-keygen -t ecdsa``  # Crée une clé SSH de type ECDSA

Lorsque demandé, appuie sur `Entrée` pour accepter le chemin par défaut et laisse le champ de passphrase vide.

3. Vérifie que le fichier de la clé a bien été créé :
``ls -a``  # Vérifie le dossier .ssh et le fichier de clé

4. Déploie la clé publique depuis le serveur vers le client :
``ssh-copy-id -i /home/user/.ssh/id_ecdsa.pub client@ip``  # Copie la clé publique sur le client

Entrez le mot de passe du client quand il est demandé. Si tout se passe bien, tu devrais pouvoir te connecter sans mot de passe.

### 5. Vérification de la clé SSH

1. Vérifie que la clé publique est bien présente sur le serveur :
``cat /home/wcs/.ssh/id_ecdsa.pub``  # Vérifie la clé publique sur le serveur

2. Vérifie que la clé publique est bien enregistrée sur le client :
``cat ~/.ssh/authorized_keys``  # Vérifie la clé publique dans le fichier authorized_keys du client

### 6. Connexion sans mot de passe

1. Depuis le serveur, teste la connexion SSH sans mot de passe :
``ssh client@ip``  # Si tout est bien configuré, tu te connectes sans entrer de mot de passe
   

### 7. (Optionnel) Sécuriser la connexion SSH

Si tu veux désactiver l'authentification par mot de passe pour forcer l'utilisation de clés SSH :

1. Édite la configuration SSH sur le serveur :
``sudo nano /etc/ssh/sshd_config``  # Ouvre la configuration SSH
 
2. Modifie ou assure-toi que ces lignes sont présentes :
``PasswordAuthentication no``  # Désactive l'authentification par mot de passe
``ChallengeResponseAuthentication no``  # Désactive l'authentification par défi

4. Redémarre le service SSH pour appliquer les modifications :
``sudo systemctl restart ssh``  # Redémarre le service SSH
