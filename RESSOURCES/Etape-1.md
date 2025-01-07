## 1 - Sécurisation des équipements d'interconnexions

<p align="right"><a href="README.md">(Retourner au sommaire)</a></p>

**Description de l'étape :**  
Nous utiliserons un switch pour cet exemple et nous essaierons de réaliser les étapes dans un ordre chronologique logique.

**1 - Nommer l'équipement :**  
`Switch> enable`  
`Switch# configure terminal`  
`Switch(config)# hostname newNameSwitch`

**2 - Attribuer le domaine à l'équipement :**  
**Obligatoire pour créer une clé RSA nécessaire pour utiliser le SSH quu'on implémentera lus tard.**  
`Switch(config)# ip domain-name nonDedomaine.local`

**3 - Créer un VLAN aléatoire pour sortir toutes les interfaces du vlan par défaut :**  
`Switch(config)# vlan 399`  
`Switch(config-if)# exit`

**4 - Eteindre toutes les interfaces de l'équipement :**  
**Profitons-en avant de commencer la configuration des interfaces pour n'oublier aucune interface.**  
`Switch(config)# interface range FastEthernet 0/1-24`  
`Switch(config-if-range)# shutdown`  
`Switch(config-if-range)# exit`  
`Switch(config)# interface range GigabitEthernet 0/1-2`  
`Switch(config-if-range)# shutdown`  
`Switch(config-if-range)# exit`  

**5 - Créer un VLAN d'administration pour accéder depuis le réseau à l'équipement :**  
`Switch(config)# vlan 99`  
`Switch(config-vlan)# name NomVlan99`  
`Switch(config-vlan)# exit`  
`Switch(config)# interface vlan 99`  
`Switch(config-if)# ip address 192.168.100.250 255.255.255.0`  
`Switch(config-if)# no shutdown`  
`Switch(config-if)# exit`  
`Switch(config)# ip default-gateway 192.168.100.254`  

`Suite à venir...`
