# EXECUTER POWERSHELL EN ADMIN SUR LES DEUX MACHINES => toujours un mot de passe sur le client pour SSH OK sur Windows

### 1. On vérifie les services clients :
`get-service ssh-agent`

### 2. On active la fonctionnalité client-ssh sur nos machines :
=> Système => Fonctionnalités facultatives => On vérifie client SSH

### 3. On vérifie la fonctionnalité serveur-ssh sur le client :
=> Système... => Ajouter une fonctionnalité => Serveur OpenSSH

### 4. On vérifie le service sur le client avec :
`get-service sshd`  # Si pas activé :
`get-service sshd | Set-Service -StartupType automatic`  # Puis on démarre :
`Restart-Service sshd`  # On vérifie :
`get-service sshd`  # Si tout est ok, le service est en running

### 5. On met sur le même réseau IP (VM en pont) :
`ipconfig`  # On récupère l'IP du client

### 6. On teste la connexion SSH depuis le serveur :
`ssh client@ip powershell`  # Si tout est bon, on entre le mot de passe => on précise PowerShell
`exit`

### 7. Sur le serveur, on crée la clé SSH :
`ssh-keygen -t ecdsa`  # On va vérifier où est la clé et si tout est ok :
`Set-Location c:\Users\client\.ssh\`  
`get ChildItem`  # On vérifie la clé

### 8. On déploie la clé SSH publique depuis le serveur vers le client :
On va la copier directement dans le fichier source :  
`get-content -path .\.ssh\id_ecdsa.pub`  # On copie
`ssh client@ip`  # On se connecte en SSH au client
`add-content -path .ssh\authorized_keys -value "la clé"`  # On va vérifier dans le fichier du client

### 9. On va dans Programme Data sur le client :
`C:\ProgramData\ssh\sshd_config`  # Élément masqué dans l'affichage classique
On commente la ligne `MATCH group administrator`  
On sauvegarde et on redémarre le service :
`Restart-Service sshd`

### 10. On se connecte en SSH et normalement pas de mot de passe :
`ssh client@ip`
