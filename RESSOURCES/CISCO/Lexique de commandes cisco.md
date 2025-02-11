# Aide-mémoire pour les Commandes Cisco

**Équipe pédagogique réseau UCBL - En mémoire à Fabien Rico**

## Introduction
Cette documentation regroupe certaines commandes utilisées sur les routeurs et commutateurs CISCO lors du cours RS2P. 
Elle contient des commandes utiles même si elles n'ont pas toutes été manipulées lors des TPs.

### Convention d'écriture :
- *italics* : arguments fournis par l'utilisateur.
- `[X]` : élément facultatif.
- `|` : choix facultatif ou obligatoire.
- `[X|Y]` : choix facultatif.
- `{X|Y}` : choix obligatoire.

---

## 1. Commandes de base

### Changer de mode d'exécution et de configuration :
```bash
Router> enable
Router# configure terminal
Router(config)#
Router(config)# exit | end | ^C | ^Z
Router# disable
Router>
```

### Visualisation de l'état de l'équipement et des fichiers :
```bash
Router# show version
Router# show flash
Router# show memory
Router# show interfaces
Switch# show history
Router# dir
```

### Visualisation et sauvegarde de la configuration :
```bash
Router# show running-config
Router# show startup-config
Router# copy running-config startup-config
```

### Suppression du fichier de configuration initiale et redémarrage :
```bash
Router# erase startup-config
Router# reload
```

### Suppression d'un fichier :
```bash
Switch# delete nom-du-fichier
```

### Attribution d'un nom à un équipement :
```bash
Router(config)# hostname router-name
```

---

## 2. Adressage, routeurs et protocoles de routage

### 2.1 Commandes de base

#### Configuration d'une interface sur un routeur :
```bash
Router(config)# interface type-and-number
Router(config-if)# ip address ip-address subnet-mask
Router(config-if)# no shutdown
Router(config-if)# exit
Router# show ip interface brief
Router# show ip interface
```

#### Commandes de diagnostic pour le routage :
```bash
Router# ping ip-address
Router# traceroute ip-address
Router# show ip route
Router# show running-config
```

#### Désactivation de la recherche DNS :
```bash
Router(config)# no ip domain-lookup
```

### 2.2 Routage statique
```bash
Router(config)# ip route adresse-reseau masque adresse-IP
Router(config)# ip route adresse-reseau masque exit-interface
Router(config)# ip route 0.0.0.0 0.0.0.0 [exit-interface | ip-address ]
```

### 2.3 Services d'adressage IP

#### 2.3.1 Protocole DHCP
##### Configuration d'un serveur DHCP :
```bash
Router(config)# service dhcp
Router(config)# ip dhcp excluded-address low-address [high-address ]
Router(config)# ip dhcp pool pool-name
Router(dhcp-config)# network network-number [mask | /prefix-length ]
Router(dhcp-config)# default-router address
Router(dhcp-config)# dns-server address
Router(dhcp-config)# domain-name domain
Router(dhcp-config)# lease {days [hours] [minutes] | infinite}
```
##### Configuration d'un relais DHCP :
```bash
Router(config-if)# ip helper-address server-address
```

##### Visualisation et dépannage DHCP :
```bash
Router# show ip dhcp binding
Router# debug ip dhcp server events
```

---

## 3. Commutateurs et Commutation

### 3.1 Configuration de base d'un commutateur
```bash
Switch(config)# interface vlan vlan-id
Switch(config-if)# ip address ip-address subnet-mask
Switch(config-if)# no shutdown
Switch(config)# ip default-gateway ip-address
```

### 3.2 Agrégation de liens
```bash
Switch(config)# interface range fa0/1 - 4
Switch(config-if-range)# channel-group 1 mode active
Switch(config-if-range)# exit
```

### 3.3 VLANs
```bash
Switch(config)# vlan vlan-id
Switch(config-vlan)# name vlan-name
Switch# show vlan brief
Switch(config)# interface type-port
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan vlan-id
```

### 3.4 Routage inter-VLAN
```bash
Router(config)# interface type-and-number.vlan-id
Router(config-subif)# encapsulation dot1q vlan-id
Router(config-subif)# ip address ip-address subnet-mask
```

### 3.5 Spanning Tree Protocol (STP)
```bash
Switch(config)# spanning-tree mode rapid-pvst
Switch(config)# spanning-tree vlan vlan-id root primary
Switch# show spanning-tree detail
```

---

## 4. Sécurité du réseau

### 4.1 Sécurisation des accès à un équipement

#### Sécurisation de l'accès console :
```bash
Router(config)# line console 0
Router(config-line)# password password
Router(config-line)# login
```

#### Sécurisation du mode d'accès privilégié :
```bash
Router(config)# enable secret password
```

#### Chiffrement des mots de passe :
```bash
Router(config)# service password-encryption
```

#### Configuration de SSH :
```bash
Router(config)# ip domain-name domain-name
Router(config)# username username secret password
Router(config)# crypto key generate rsa modulus 1024
Router(config)# line vty 0 4
Router(config-line)# transport input ssh
Router(config-line)# login local
```

---

## 4.2 Récupération après la perte de mots de passe

### 4.2.1 Sur un routeur
```bash
rommon> confreg 0x2142
rommon> reset
Router> enable
Router# copy startup-config running-config
Router(config)# enable secret password
Router(config)# config-register 0x2102
Router# reload
```

### 4.2.2 Sur un commutateur
```bash
switch: flash_init
switch: rename flash:config.text flash:config.text.old
switch: boot
Switch> enable
Switch# copy flash:config.text system:running-config
Switch(config)# enable secret password
Switch# reload
