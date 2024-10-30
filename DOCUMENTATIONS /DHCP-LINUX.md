# Documentation : Installation et Configuration DHCP

## Partie 1 : Serveur DHCP sous Debian avec Client Ubuntu

### Prérequis

1. **Serveur Debian** installé et configuré avec les droits d'administration.
2. **Client Ubuntu** configuré pour obtenir une adresse IP dynamique.
3. Les deux machines doivent être connectées au même réseau.

### Étape 1 : Installation du Serveur DHCP sur Debian

1. **Mettre à jour les paquets** :
   ```bash
   sudo apt update && sudo apt upgrade -y

	2.	Installer le serveur DHCP :

sudo apt install isc-dhcp-server -y



Étape 2 : Configuration du Serveur DHCP

	1.	Éditer le fichier de configuration DHCP :

sudo nano /etc/dhcp/dhcpd.conf


	2.	Définir la configuration réseau dans dhcpd.conf (remplacez les valeurs selon votre réseau) :

subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.100 192.168.1.200;
    option routers 192.168.1.1;
    option domain-name-servers 8.8.8.8, 8.8.4.4;
    option domain-name "exemple.local";
}


	3.	Définir l’interface réseau (ex. eth0) :
	•	Modifier le fichier /etc/default/isc-dhcp-server :

INTERFACESv4="eth0"


	4.	Redémarrer le service DHCP :

sudo systemctl restart isc-dhcp-server


	5.	Vérifier le statut du service :

sudo systemctl status isc-dhcp-server



Étape 3 : Configuration du Client Ubuntu

	1.	Configurer l’interface pour obtenir une IP dynamique en modifiant /etc/netplan/01-netcfg.yaml :

network:
  ethernets:
    eth0:
      dhcp4: true
  version: 2


	2.	Appliquer les modifications Netplan :

sudo netplan apply


	3.	Vérifier l’adresse IP obtenue :

ip a



Étape 4 : Tests et Dépannage

	•	Utilisez dhcp-lease-list sur le serveur pour vérifier les baux actifs.
	•	Sur le client, vérifiez les logs de DHCP :

sudo journalctl -u systemd-networkd
