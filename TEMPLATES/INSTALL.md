# Guide d'Installation et de Configuration

## Machines Virtuelles Requises

- **Serveur Principal** : Détails de l’OS requis
- **Client** : Détails de l’OS requis
- Autres machines si nécessaires...

### Configuration Réseau
Chaque machine virtuelle doit être configurée avec :
- Une carte réseau **PONT** pour les mises à jour et l'accès internet.
- Une carte réseau **Interne** pour la communication directe entre les systèmes.

---

## Étape 1 : Création des Machines Virtuelles

### 1.1 Serveur Principal
Créez une VM avec les paramètres suivants :

| **Paramètre**       | **Valeur**                   |
|---------------------|------------------------------|
| **Nom**             | Nom du Serveur               |
| **OS**              | Type et Version de l'OS      |
| **CPU**             | Nombre de cœurs requis       |
| **RAM**             | Mémoire vive recommandée     |
| **Disque**          | Capacité de stockage         |
| **Carte réseau 1**  | PONT                         |
| **Carte réseau 2**  | Interne (nom : `Intnet`)     |

Configurez :
- **Utilisateur administrateur** : Nom de l'utilisateur principal
- **Mot de passe** : Mot de passe recommandé
- **Adresse IP fixe** : Exemple, `192.168.x.x/24`

Démarrez la VM avec l’ISO approprié, suivez les étapes d’installation de l’OS, configurez l’adresse IP statique et les paramètres réseau.

---

### 1.2 Client
Créez une VM avec les paramètres suivants :

| **Paramètre**       | **Valeur**                   |
|---------------------|------------------------------|
| **Nom**             | Nom du Client                |
| **OS**              | Type et Version de l'OS      |
| **CPU**             | Nombre de cœurs requis       |
| **RAM**             | Mémoire vive recommandée     |
| **Disque**          | Capacité de stockage         |
| **Carte réseau 1**  | PONT                         |
| **Carte réseau 2**  | Interne (nom : `Intnet`)     |

Configurez ensuite :
- **Utilisateur** : Nom de l'utilisateur principal
- **Mot de passe** : Mot de passe recommandé
- **Adresse IP fixe** : Exemple, `192.168.x.y/24`

Suivez les étapes d’installation de l’OS et configurez l’adresse IP statique pour la communication réseau.

---

## Étape 2 : Configuration des IPs Statiques

### Configuration des IPs sur les Systèmes Linux
1. **Ouvrez le fichier de configuration réseau** :
   ```bash
   sudo nano /etc/network/interfaces

Modifier les paramètres IP en ajoutant :

`auto eth0 iface eth0 inet static`<br> 
`address 172.16.10.x` # Remplacer x par l'IP de la machine<br> 
`netmask 255.255.255.0`


---

# Étape 3 : Configuration SSH et Accès Sans Mot de Passe

## 3.1 Configuration SSH sur les Machines Linux (Debian et Ubuntu)

### Vérification de l'installation de SSH
1. **Vérifiez si OpenSSH est installé :**
   - Vérifier la version de SSH :
     ```bash
     sshd -V
     ```
   - Si OpenSSH n'est pas installé, installez-le avec la commande suivante :
     ```bash
     sudo apt install openssh-server
     ```
   - Vérifiez l'installation après :
     ```bash
     sshd -V
     ```

2. **Activation et démarrage du service SSH :**
   - Activez SSH pour qu'il démarre automatiquement au démarrage :
     ```bash
     sudo systemctl enable ssh
     ```
   - Démarrez le service SSH :
     ```bash
     sudo systemctl start ssh
     ```
   - Vérifiez le statut du service :
     ```bash
     sudo systemctl status ssh
     sudo systemctl status sshd
     ```

### Configuration réseau pour les connexions
1. **Vérification de la connectivité réseau** :
   - Mettez les machines sur le même réseau (VM en mode pont) et redémarrez le service réseau :
     ```bash
     sudo systemctl restart networking  # ou sudo systemctl restart NetworkManager
     ```
   - Vérifiez l'IP de la machine :
     ```bash
     ip a
     ```
   - Testez la connectivité réseau entre les machines :
     ```bash
     ping <adresse_ip>
     ```

### Déploiement des Clés SSH pour un Accès Sans Mot de Passe
1. **Sur le serveur Linux : Générer une clé SSH** :
   - Exécutez la commande suivante pour générer une clé SSH :
     ```bash
     ssh-keygen -t ecdsa
     ```
     - Acceptez les paramètres par défaut, pas de passphrase nécessaire.

2. **Vérification de la clé générée** :
   - Vérifiez que la clé est présente :
     ```bash
     ls -a ~/.ssh  # Vérifier si id_ecdsa.pub est bien là
     ```

3. **Déployer la clé SSH publique du serveur vers le client** :
   - Copiez la clé publique vers le client avec la commande suivante :
     ```bash
     ssh-copy-id -i ~/.ssh/id_ecdsa.pub client@<ip_client>
     ```
     Vous devrez entrer le mot de passe du client une dernière fois.

4. **Vérification sur les deux machines** :
   - Vérifiez que la clé publique est présente sur le serveur :
     ```bash
     cat ~/.ssh/id_ecdsa.pub  # Sur le serveur
     ```
   - Vérifiez sur le client :
     ```bash
     cat ~/.ssh/authorized_keys  # Sur le client
     ```

5. **Connexion SSH sans mot de passe** :
   - Testez la connexion SSH sans mot de passe :
     ```bash
     ssh client@<ip_client>
     ```
   - Si tout est configuré correctement, la connexion ne vous demandera pas de mot de passe.

---

## 3.2 Configuration SSH sur Windows (Client et Serveur Windows)

### Vérification des Services SSH
1. **Vérification du service SSH sur le client Windows :**
   - Vérifiez si le service SSH est installé :
     ```powershell
     get-service sshd
     ```

2. **Installation et activation de SSH sur le client Windows :**
   - Activez la fonctionnalité client SSH sur Windows via les **Fonctionnalités facultatives** dans les paramètres.
   - Si le serveur SSH n'est pas installé, installez-le via **Paramètres > Applications > Fonctionnalités facultatives > Ajouter une fonctionnalité > Serveur OpenSSH**.

3. **Activation du service OpenSSH sur Windows (client) :**
   - Exécutez PowerShell en tant qu'administrateur et activez OpenSSH :
     ```powershell
     get-service sshd | Set-Service -StartupType Automatic
     ```
   - Démarrez le service SSH :
     ```powershell
     Restart-Service sshd
     ```

4. **Vérification que le service fonctionne :**
   - Vérifiez le statut du service SSH :
     ```powershell
     get-service sshd
     ```

### Connexion SSH et Déploiement des Clés SSH entre Windows et Linux

1. **Vérification de la connexion SSH depuis le serveur :**
   - Testez la connexion SSH du serveur vers le client Windows :
     ```bash
     ssh client@<ip_client> powershell
     ```
     Entrez le mot de passe si demandé, puis tapez `exit`.

2. **Sur le serveur Windows, générer une clé SSH :**
   - Ouvrez PowerShell et générez une clé SSH :
     ```powershell
     ssh-keygen -t ecdsa
     ```

3. **Vérification de la clé générée sur Windows :**
   - Vérifiez où se trouve la clé et si elle a été générée :
     ```powershell
     Set-Location c:\Users\client\.ssh\
     Get-ChildItem
     ```

4. **Déploiement de la clé SSH publique de Windows vers le client :**
   - Copiez la clé publique depuis le serveur Windows vers le client Windows :
     ```powershell
     Get-Content -path .\.ssh\id_ecdsa.pub | ssh client@<ip_client> "echo $(cat >> ~/.ssh/authorized_keys)"
     ```

5. **Désactivation de la demande de mot de passe sur le client Windows :**
   - Ouvrez le fichier de configuration du service SSH sur le client Windows :
     ```powershell
     notepad C:\ProgramData\ssh\sshd_config
     ```
   - Commentez la ligne suivante :
     ```plaintext
     Match Group administrators
     ```
   - Sauvegardez et redémarrez le service SSH :
     ```powershell
     Restart-Service sshd
     ```

6. **Testez la connexion SSH sans mot de passe :**
   - Testez la connexion sans mot de passe :
     ```powershell
     ssh client@<ip_client>
     ```

---

## 3.3 Connexions SSH Inter-Systèmes (Linux ↔ Windows)

### Déploiement de clés entre Linux (Ubuntu) et Windows

1. **Depuis Ubuntu vers Windows :**
   - Copiez la clé publique depuis Ubuntu vers Windows :
     ```bash
     ssh-copy-id -i ~/.ssh/id_ecdsa.pub client@<ip_windows_client>
     ```

2. **Depuis Windows vers Ubuntu :**
   - Copiez la clé publique de Windows vers Ubuntu :
     ```powershell
     Get-Content -path .\.ssh\id_ecdsa.pub | ssh client@<ip_ubuntu_client> "echo $(cat >> ~/.ssh/authorized_keys)"
     ```

3. **Vérification de la connexion SSH :**
   - Testez la connexion SSH depuis Ubuntu vers Windows ou vice versa :
     ```bash
     ssh client@<ip_windows_client>  # ou pour Ubuntu
     ```

Si tout est configuré correctement, vous pourrez vous connecter sans mot de passe.
