# Connexion SSH sans Mot de Passe sous Debian/Ubuntu

## 1. Générer une clé SSH
- Sur votre machine locale (client), générez une clé SSH :
``ssh-keygen``
# Appuyez sur Entrée pour accepter le chemin par défaut.
# Laissez le mot de passe vide pour ne pas avoir de passphrase.

## 2. Copier la clé publique sur le serveur
- Copiez la clé publique sur votre serveur :
``ssh-copy-id utilisateur@adresse_ip``
# Remplacez 'utilisateur' par votre nom d'utilisateur et 'adresse_ip' par l'adresse IP du serveur.

## 3. Vérifier la connexion sans mot de passe
- Testez la connexion SSH sans mot de passe :
``ssh utilisateur@adresse_ip``

## 4. (Optionnel) Sécuriser SSH
 - Si vous voulez forcer l'utilisation de clés SSH pour l'authentification et désactiver l'authentification par mot de passe :
 - Éditez le fichier de configuration SSH sur le serveur :
 ``sudo nano /etc/ssh/sshd_config``
 - Assurez-vous que les lignes suivantes sont définies :
  PasswordAuthentication no
  ChallengeResponseAuthentication no
 - Redémarrez SSH pour appliquer les changements :
  ``sudo systemctl restart ssh``
