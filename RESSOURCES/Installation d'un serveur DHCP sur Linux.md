# 🛠️ Installation d'un serveur DHCP sur Linux 🖥️

## 1️⃣ Préparation des machines virtuelles
1. Sur **VirtualBox**, monter **3 VMs** :
   - 🟠 **1 Ubuntu** en serveur
   - 🟢 **1 Debian** pour l'IP statique
   - 🔵 **1 autre VM** en DHCP
2. Configurer les cartes réseau des VMs sur **"Réseau interne"** et choisir un **nom de réseau commun** pour les 3 VMs.

---

## 2️⃣ Configuration du serveur DHCP
### 🏗️ Installation des paquets nécessaires
1. Installer le serveur DHCP en mode **root** :

  ``apt install isc-dhcp-server``

⚙️ Configuration de base

Modifier le fichier /etc/default/isc-dhcp-server pour définir l'interface à écouter :

``INTERFACES="enp0s3"``

Modifier le fichier de configuration DHCP :

``sudo nano /etc/dhcp/dhcpd.conf``

Ajouter les options suivantes :

``option domain-name "tecmint.lan";
option domain-name-servers ns1.tecmint.lan, ns2.tecmint.lan;  
default-lease-time 3600;  
max-lease-time 7200;  
authoritative;``

Configurer le sous-réseau :

    subnet 192.168.10.0 netmask 255.255.255.0 {
        option routers                  192.168.10.1;
        option subnet-mask              255.255.255.0;
        option domain-search            "tecmint.lan";
        option domain-name-servers      192.168.10.1;
        range   192.168.10.10   192.168.10.100;
    }

🖥️ Ajouter une machine statique

    Définir une adresse IP fixe pour une machine spécifique avec son adresse MAC :

    host debian-node {
        hardware ethernet 08:00:27:54:6d:d2;
        fixed-address 172.20.0.10;
    }

3️⃣ Configuration de la machine en IP statique
🛠️ Modifier les interfaces réseau

    Éditer le fichier /etc/network/interfaces :

# nano /etc/network/interfaces

Ajouter les paramètres suivants :

``auto enp0s3
iface enp0s3 inet static 
    address 172.20.0.10
    netmask 255.255.255.0
    gateway 172.20.0.1``

Sauvegarder et éditer /etc/resolv.conf pour définir le serveur DNS :

  ``nano /etc/resolv.conf
    nameserver 8.8.8.8``

🔄 Redémarrer les services réseau

    Appliquer les modifications :

``/etc/init.d/network restart  [Pour SysVinit]
systemctl restart network    [Pour SystemD]``
