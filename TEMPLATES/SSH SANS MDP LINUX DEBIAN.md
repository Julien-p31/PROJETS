# OUVRIR TERMINAL SUR LES DEUX MACHINES

## On vérifie qu'on a openssh serveur sur le client:
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

## On met sur le même réseau IP (VM en pont) et on redémarre le service :
  `sudo systemctl restart Networking` (ou `NetworkManager`)<br>
  `ip a`  # Pour récupérer l'IP<br>
  `ping (adresse ip)`  # On vérifie si la communication est ok

## On se connecte depuis le serveur pour vérifier que tout est ok :
  `ssh client@ip`  # On dit oui et on tape le mot de passe<br>
  `exit`

## On crée une clé SSH :
  `ssh-keygen -t ecdsa`
  `yes`
  passphrase pas obligé
  `ls -a`  # Pour vérifier le fichier .ssh => lieu de stockage de la clé SSH

## On déploie la clé SSH publique depuis le serveur vers le client :
  `ssh-copy-id -i /home/user/.ssh/id_ecdsa.pub client@ip`<br>
  on rentre le mot de passe  # Si tout est ok, on se connecte

## On vérifie que la clé correspond sur les machines :
  `cat /home/wcs/.ssh/id_ecdsa.pub`  # Sur le serveur<br>
  `cat .ssh/authorized_keys`  # Sur le client

## On se connecte :
  `ssh client@ip`  # Si tout est ok, on n'entre pas de mot de passe
