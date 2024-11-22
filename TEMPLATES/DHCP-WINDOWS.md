# INSTALLATION ET CONFIGURATION DE DHCP SOUS WINDOWS SERVER 2022

## 1. Installation du rôle DHCP
- Ouvrez le **Gestionnaire de serveur**.
- Cliquez sur **Ajouter des rôles et fonctionnalités**.
- Dans l'assistant, sélectionnez **Rôle de serveur DHCP** et cliquez sur **Suivant**.
- Suivez les étapes pour installer le rôle, puis cliquez sur **Installer**.
  
## 2. Configuration du serveur DHCP
- Après l'installation, ouvrez l'outil **Gestion DHCP**.
- Dans le **Gestionnaire DHCP**, cliquez avec le bouton droit sur votre serveur et sélectionnez **Configurer le serveur DHCP**.

### Modifications :
- Définissez la **plage d'adresses** pour le serveur DHCP. Par exemple, pour distribuer des adresses entre 192.168.1.100 et 192.168.1.200 :
  - Plage : ``192.168.1.100 - 192.168.1.200``.
  - Option de passerelle (routeur) : ``192.168.1.1``.
  - Option de serveurs DNS : ``8.8.8.8, 8.8.4.4``.

## 3. Activer le serveur DHCP
- Une fois la configuration terminée, assurez-vous que le serveur est activé :
  - Cochez l'option pour **activer le serveur DHCP** dans l'assistant de configuration.
  - Cliquez sur **Terminer**.
  
## 4. Vérification du statut du serveur DHCP
- Pour vérifier si le serveur DHCP fonctionne correctement, vous pouvez exécuter la commande suivante dans **PowerShell** :

``Get-Service -Name DHCPServer``

- Cette commande vous indiquera si le service DHCP est en cours d'exécution.

## 5. Dépannage (si nécessaire)
- Si vous rencontrez des problèmes, vous pouvez consulter les logs dans l'outil **Observateur d'événements** de Windows Server :
- Allez dans **Applications et services > Microsoft > Windows > DHCP-Server**.
- Vérifiez les erreurs ou les avertissements qui pourraient expliquer les dysfonctionnements.
- Assurez-vous que le serveur est connecté au bon réseau et que les paramètres de routage sont corrects.
