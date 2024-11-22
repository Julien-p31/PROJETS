# INSTALLATION ET CONFIGURATION DE DHCP SOUS DEBIAN/UBUNTU

## 1. Installation du serveur DHCP
``sudo apt update``<br>
``sudo apt install isc-dhcp-server``

## 2. Configuration du serveur DHCP
- Éditez le fichier de configuration principal :  
  ``sudo nano /etc/dhcp/dhcpd.conf``

### Modifications :

``default-lease-time 600;``<br>
``max-lease-time 7200;``<br>
``authoritative;``

``subnet 192.168.1.0 netmask 255.255.255.0 {``<br>
    ``range 192.168.1.100 192.168.1.200;``<br>
    ``option routers 192.168.1.1;``<br>
    ``option subnet-mask 255.255.255.0;``<br>
    ``option domain-name-servers 8.8.8.8, 8.8.4.4;``<br>
    ``option domain-name "example.local";``<br>
``}``

- Sauvegardez et fermez le fichier (Ctrl + o pour sauvegarder puis Ctrl + x pour quitter).

## 3. Définir l'interface réseau
- Éditez le fichier suivant :  
  ``sudo nano /etc/default/isc-dhcp-server``

### Modifications :

``INTERFACESv4="eth0"``<br>
``INTERFACESv6=""``

- Sauvegardez et fermez le fichier.

## 4. Démarrer et activer le service DHCP
``sudo systemctl start isc-dhcp-server``<br>
``sudo systemctl enable isc-dhcp-server``

## 5. Vérification du statut du serveur DHCP
``sudo systemctl status isc-dhcp-server``

## 6. Dépannage (si nécessaire)
- Vérifiez les logs pour identifier les problèmes :  
  ``sudo journalctl -u isc-dhcp-server``
- Assurez-vous que l'interface réseau est active et connectée au bon réseau.

