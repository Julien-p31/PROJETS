# INSTALLATION ET CONFIGURATION DE DNS SOUS WINDOWS SERVER 2022

## 1. Installation du rôle DNS
- Ouvrez le **Gestionnaire de serveur**.
- Cliquez sur **Ajouter des rôles et fonctionnalités**.
- Dans l'assistant, sélectionnez **Rôle de serveur DNS** et cliquez sur **Suivant**.
- Suivez les étapes pour installer le rôle, puis cliquez sur **Installer**.

## 2. Configuration du serveur DNS
- Une fois le rôle DNS installé, ouvrez l'outil **Gestion DNS**.
- Dans le **Gestionnaire DNS**, cliquez avec le bouton droit sur votre serveur DNS et sélectionnez **Configurer un serveur DNS**.

### Modifications :
- Choisissez le type de configuration que vous souhaitez. Par exemple, pour configurer un serveur DNS principal, sélectionnez **Serveur DNS principal**.
- Configurez une **zone de recherche directe** pour votre domaine :
  - Nom de la zone : ``example.local``.
  - Type de zone : **Zone primaire**.
- Ajoutez des **enregistrements DNS** pour les hôtes dans cette zone, par exemple :
  - Enregistrement A : ``www.example.local`` -> ``192.168.1.10``.
  - Enregistrement CNAME : ``dns.example.local`` -> ``www.example.local``.

## 3. Activer et configurer la résolution inverse (facultatif)
- Vous pouvez également configurer une **zone de recherche inversée** pour résoudre les adresses IP en noms de domaine.
  - Allez dans **Zone de recherche inversée** et créez une nouvelle zone pour le réseau correspondant (par exemple, ``192.168.1.x``).
  - Ajoutez des enregistrements PTR pour les adresses IP.

## 4. Vérification du statut du serveur DNS
- Pour vérifier que le serveur DNS fonctionne correctement, ouvrez **PowerShell** et exécutez la commande suivante :

``Get-Service -Name DNS``

- Cette commande vous indiquera si le service DNS est en cours d'exécution.

## 5. Tester la configuration DNS
- Depuis un autre ordinateur sur le réseau, testez la résolution DNS en utilisant la commande suivante dans **PowerShell** ou **Invite de commandes** :

nslookup www.example.local

- Vous devriez recevoir l'adresse IP associée à l'enregistrement A du serveur DNS.

## 6. Dépannage (si nécessaire)
- Si vous rencontrez des problèmes, vous pouvez consulter les logs dans l'outil **Observateur d'événements** de Windows Server :
- Allez dans **Applications et services > Microsoft > Windows > DNS-Server**.
- Vérifiez les erreurs ou les avertissements qui pourraient expliquer les dysfonctionnements.
- Assurez-vous que le serveur DNS est correctement configuré et que les autres clients peuvent atteindre le serveur via le réseau.
