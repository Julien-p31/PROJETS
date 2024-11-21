# EXÉCUTER TERMINAL ET POWERSHELL EN ADMIN SUR LES MACHINES RESPECTIVES

## 1. On vérifie si on peut se connecter en SSH :
`ssh client@ip powershell`  # Si tout est ok, on quitte<br>
`exit`

## 2. On déploie la clé depuis Ubuntu vers Windows :
`cat .ssh/id_ecdsa.pub`  # On copie<br>
`ssh client@ip`  # On se connecte en SSH au client<br>
`add-content -path .ssh\authorized_keys -value "la clé"`  # On colle

## 3. On va dans Programme Data sur le client :
`C:\ProgramData\ssh\sshd_config`  # Élément masqué dans l'affichage classique<br>
On commente la ligne `MATCH group administrator`  
On sauvegarde et on redémarre le service :
`Restart-Service sshd`

## 4. On se connecte en SSH et normalement pas de mot de passe :
`ssh client@ip`
