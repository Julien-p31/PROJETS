# Plan de Mise en Place de l'Infrastructure Réseau

## Étape 1 : Analyse et Préparation Initiale
### Matériel nécessaire :
- Routeurs.
- Switchs (gestionnaires si possible).
- Points d’accès Wi-Fi professionnels pour remplacer les répéteurs existants.
- Serveur pour gérer les utilisateurs (contrôleur de domaine) et fichiers.
- Solution NAS ou serveur avec stockage redondant (RAID).
- Proxmox (hyperviseur) pour virtualiser les serveurs nécessaires.

### Organisation des utilisateurs :
- Créer 167 comptes utilisateurs dans un fichier préparatoire pour importation dans Active Directory.
- Associer chaque utilisateur à un groupe selon son département (ex. : Service communication, Service finance, etc.).

---

## Étape 2 : Conception du Réseau
### Adresse réseau :
- Maintenir ou ajuster la plage d’adresses actuelle `172.18.1.0/24` :
  - Réserver une plage pour les serveurs (ex. : `172.18.1.1 - 172.18.1.50`).
  - Attribuer une plage dédiée aux points d’accès et équipements réseau.
  - Définir une plage DHCP pour les utilisateurs finaux (PC, mobiles).

### Schéma réseau :
- Concevoir un schéma avec :
  - Un routeur principal gérant la connexion à Internet.
  - Un ou plusieurs switchs pour distribuer les connexions filaires.
  - Des points d’accès Wi-Fi professionnels.
  - Un serveur Active Directory (contrôleur de domaine).
  - Un serveur de fichiers.

### Convention de nommage :
- Définir un format de nommage standard :
  - Comptes utilisateurs : `prenom.nom`.
  - Machines : `DEP-NomPC-Num` (exemple : `DEV-PC-01` pour le département développement).

---

## Étape 3 : Configuration Initiale de l'Infrastructure
### Serveurs virtuels :
- Déployer Proxmox.
- Créer les VMs nécessaires :
  - Serveur Active Directory avec Windows Server.
  - Serveur de fichiers avec une solution de partage (ex. : Samba).
  - Serveur pour les outils de monitoring ou de gestion (Nagios, Zabbix).

### Réseau physique :
- Installer le routeur, switchs et points d’accès.
- Configurer le routage pour garantir la connectivité des sous-réseaux.
- Activer un serveur DHCP pour les utilisateurs finaux.

---

## Étape 4 : Mise en Place des Utilisateurs et Groupes
### Création des utilisateurs dans l’Active Directory :
- Importer les 167 comptes utilisateurs via un fichier CSV.
- Associer chaque utilisateur à un groupe correspondant à son département.
- Définir des règles de mot de passe (complexité, expiration).

### Accès réseau :
- Configurer des partages réseau spécifiques par département sur le serveur de fichiers.
- Appliquer des permissions basées sur les groupes Active Directory.

---

## Étape 5 : Sécurisation et Sauvegarde
### Sécurité réseau :
- Installer et configurer un pare-feu pour sécuriser le trafic entrant et sortant.
- Activer le chiffrement WPA3 pour le Wi-Fi.
- Mettre en place une solution antivirus sur le réseau.

### Sauvegarde :
- Configurer un système de sauvegarde automatique pour le NAS/serveur de fichiers.
- Définir une politique de rétention des sauvegardes (ex. : 30 jours).

---

## Étape 6 : Tests et Validation
### Tests techniques :
- Vérifier la connectivité réseau.
- Tester l’accès utilisateur (connexion, permissions, etc.).
- Simuler une panne pour tester la reprise des sauvegardes.

### Validation finale :
- Présenter un rapport au formateur (DSI).
- Documenter les configurations et procédures (plan de maintenance).

---

## Synthèse du Matériel à Prévoir
### Machines et équipements :
- 1 serveur physique (ou plus si besoin).
- Routeurs, switchs, points d’accès Wi-Fi.
- 1 NAS professionnel (ou serveur avec stockage RAID).

### Logiciels et outils :
- Windows Server (Active Directory).
- Samba pour les partages réseau.
- Proxmox pour la virtualisation.
- Antivirus et solution de monitoring.

### Ressources humaines :
- Créer et gérer les 167 comptes utilisateurs.
- Former les utilisateurs sur les nouvelles pratiques (connexions, partages).
