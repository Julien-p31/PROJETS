# OUVRIR TERMINAL SUR LES DEUX MACHINES (SERVEUR/CLIENT)

## 1. On vérifie qu'on a openssh serveur sur le client:
- Vérifie si le serveur SSH est installé :<br>
  `sshd -V`  # Pour vérifier si installé, si pas installer :<br>
  `sudo apt install openssh-server`<br>
  `sshd -V`  # Pour vérifier

- Vérifie si le service SSH est activé :<br>
  `systemctl status ssh`

- Si le service n'est pas activé, rends-le actif au démarrage :<br>
  `systemctl enable ssh`  # Rend actif au démarrage<br>
  `systemctl status ssh`<br>
  `systemctl status sshd`  # Si tout est bon tout est vert et enable

## 2. On se connecte depuis le serveur pour vérifier que tout est ok :
  `ssh client@ip`  # On dit oui et on tape le mot de passe du client<br>
  `exit`

## 3. On crée une clé SSH sur le serveur :
  `ssh-keygen -t ecdsa`<br>
  `yes`<br>
  (passphrase pas obligé) 
  `ls -a`  # Pour vérifier le fichier .ssh => lieu de stockage de la clé SSH

## 4. On déploie la clé SSH publique depuis le serveur vers le client :
  `ssh-copy-id -i /home/user/.ssh/id_ecdsa.pub client@ip`<br>
  on rentre le mot de passe  # Si tout est ok, on se connecte

## 5. On vérifie que la clé correspond sur les machines :
  `cat /home/wcs/.ssh/id_ecdsa.pub`  # Sur le serveur<br>
  `cat .ssh/authorized_keys`  # Sur le client

## 6. On se connecte :
  `ssh client@ip`  # Si tout est ok, on n'entre pas de mot de passe
