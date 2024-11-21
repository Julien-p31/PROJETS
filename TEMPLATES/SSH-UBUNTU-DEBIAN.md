# INSTALLATION ET CONFIGURATION DE SSH SOUS DEBIAN/UBUNTU

## 1. Installation de SSH
``sudo apt update``<br>
``sudo apt install openssh-server``

## 2. Vérification du statut de SSH
``sudo systemctl status ssh``

## 3. Démarrer et activer SSH
``sudo systemctl start ssh``<br>
``sudo systemctl enable ssh``

## 4. Configuration de SSH (facultatif)
- Éditez le fichier de configuration :
  ``sudo nano /etc/ssh/sshd_config``
  
## Modifications :
- PermitRootLogin no : décommenter et mettre "yes".
- Sauvegardez et fermez le fichier (Ctrl + o pour sauvegarder puis Ctrl + x pour quitter le fichier).

## 5. Redémarrer SSH pour appliquer les changements
``sudo systemctl restart ssh``

## 6. Connexion SSH depuis un autre ordinateur
``ssh utilisateur@adresse_ip``
