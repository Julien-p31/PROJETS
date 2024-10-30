# Documentation : Installation et Configuration DHCP

## Partie 2 : Serveur DHCP sous Windows Server avec Client Windows

Prérequis

	1.	Windows Server configuré avec rôle d’administrateur.
	2.	Client Windows connecté au même réseau.
	3.	IP statique pour le serveur.

Étape 1 : Installation du Serveur DHCP sous Windows Server

	1.	Ouvrir le Gestionnaire de Serveur et aller à Ajouter des rôles et fonctionnalités.
	2.	Sélectionner Rôle DHCP et installer.
	3.	Configurer le DHCP après installation en cliquant sur Terminer la configuration DHCP.

Étape 2 : Configuration du DHCP

	1.	Ouvrir la Console DHCP (Outils administratifs > DHCP).
	2.	Créer une nouvelle étendue :
	•	Clic droit sur IPv4 > Nouvelle étendue.
	•	Nommer l’étendue et définir la plage d’adresses (ex : 192.168.1.100 à 192.168.1.200).
	•	Définir le masque de sous-réseau et les options de l’étendue (ex : passerelle 192.168.1.1 et DNS 8.8.8.8).
	3.	Activer l’étendue pour que le serveur commence à distribuer des IP.

Étape 3 : Configuration du Client Windows

	1.	Accéder aux paramètres réseau :
	•	Panneau de configuration > Centre Réseau et Partage > Modifier les paramètres de la carte.
	2.	Configurer l’interface en DHCP :
	•	Clic droit sur l’interface réseau > Propriétés.
	•	Sélectionner Protocole Internet Version 4 (TCP/IPv4) > Propriétés.
	•	Choisir Obtenir une adresse IP automatiquement et Obtenir les adresses de serveur DNS automatiquement.
	3.	Vérifier l’adresse IP obtenue :
	•	Ouvrir l’invite de commandes et taper :

ipconfig /all



Étape 4 : Tests et Dépannage

	•	Utiliser ipconfig /renew sur le client pour forcer une nouvelle demande DHCP.
	•	Vérifier les logs DHCP dans l’Observateur d’événements de Windows Server pour des erreurs potentielles.

Remarques Finales

	1.	Firewall : Assurez-vous que les ports DHCP (67/UDP pour le serveur et 68/UDP pour le client) sont ouverts sur les deux types de serveur.
	2.	Logs : Sur Debian, les logs DHCP sont dans /var/log/syslog. Sur Windows Server, utilisez l’Observateur d’événements.
	3.	Réseau isolé pour déployer un serveur DHCP sur Debian avec un client Ubuntu et Windows Server avec un client Windows. Adaptez les plages d’adresses et les paramètres réseau en fonction de votre infrastructure.
