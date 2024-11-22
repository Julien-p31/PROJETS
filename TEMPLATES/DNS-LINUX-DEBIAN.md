# INSTALLATION ET CONFIGURATION DE DNS SOUS DEBIAN

## 1. Installation du serveur DNS (BIND)
``sudo apt update``<br>
``sudo apt install bind9 bind9utils bind9-doc``

## 2. Configuration du serveur DNS
- Éditez le fichier de configuration principal de BIND :  
  ``sudo nano /etc/bind/named.conf.local``

### Modifications :
- Ajoutez une zone de recherche directe pour votre domaine, par exemple :

``zone "example.local" { ``<br>
      ``type master;``<br> 
      ``file "/etc/bind/db.example.local";`` <br>
      ``};``

- Sauvegardez et fermez le fichier.

## 3. Créer un fichier de zone pour votre domaine
- Créez et éditez le fichier de zone pour votre domaine :  
``sudo nano /etc/bind/db.example.local``

### Modifications :

``$TTL 604800 @ IN SOA ns1.example.local. admin.example.local. ( 2023112201 ; Serial 604800 ; Refresh 86400 ; Retry 2419200 ; Expire 604800 ) ; ``<br>
``Minimum TTL``

   ``IN      NS      ns1.example.local.``<br>
    ``IN      A       192.168.1.10``

``ns1 IN A 192.168.1.10 www IN A 192.168.1.20``

- Sauvegardez et fermez le fichier.

## 4. Vérifier la configuration et redémarrer BIND
- Vérifiez la configuration de BIND pour les erreurs :  
  ``sudo named-checkconf``<br>
  ``sudo named-checkzone example.local /etc/bind/db.example.local``

- Si aucune erreur n'est signalée, redémarrez le service BIND pour appliquer les modifications :  
  ``sudo systemctl restart bind9``

## 5. Vérification du statut du serveur DNS
- Pour vérifier que le serveur DNS fonctionne correctement, utilisez la commande suivante :  
  ``sudo systemctl status bind9``

## 6. Tester la configuration DNS
- Depuis un autre ordinateur sur le réseau, testez la résolution DNS en utilisant la commande suivante :  
  ``nslookup www.example.local``  
  Vous devriez obtenir l'adresse IP configurée pour ``www.example.local`` (par exemple, 192.168.1.20).

## 7. Dépannage (si nécessaire)
- Si vous rencontrez des problèmes, consultez les logs dans le fichier suivant :  
  ``sudo tail -f /var/log/syslog``

- Assurez-vous que le service BIND est correctement configuré et écoute sur le bon port.
