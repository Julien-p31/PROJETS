# EXÉCUTER TERMINAL ET POWERSHELL EN ADMIN SUR LES MACHINES RESPECTIVES

## 1. On vérifie si on peut se connecter en SSH :
`ssh client@ip`  # Si tout est ok, on quitte<br>
`exit`

## 2. On déploie la clé depuis Windows vers Ubuntu :
`get-content -path .\.ssh\id_ecdsa.pub`  # On copie<br>
`ssh client@ip`  # On se connecte en SSH au client<br>
`nano .ssh/authorized_keys`  # On colle

## 3. On se connecte en SSH et normalement pas de mot de passe :
`ssh client@ip`
