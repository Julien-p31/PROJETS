# CONFIGURATION
---
=> AJOUTER UN DEUXIÈME DISQUE AVANT TOUT (8GO C'EST OK)
=> LE METTRE EN PONT

------------------------------------------------------------------
## EXERCICE

- ON VEUT PARTIONNER LE DEUXIÈME DISQUE : UNE SVG ET UNE SWAP
- SE CONNECTER EN ROOT
  `blkid` comme `lsblk -f` pour obtenir l'UUID

------------------------------------------------------------------
## ÉTAPE

### - VÉRIFIER LE PARTIONNEMENT AVEC `lsblk` :
On voit que le disque principal est en 3 partitions, dont une déjà SWAP => system  
On voit le `sdb` pas partitionné, ni rien

### 1. On partitionne avec `cfdisk /dev/sdb` :
  - Choisir `DOS = MBR`
  - Le partitionner en deux avec Entrée :
    - Une partition de 6 Go en **Primary**
    - La deuxième partition avec le reste en **Primary** également
  - Cliquer sur **Write** puis quitter

### 2. On vérifie avec `lsblk` que tout est ok

### 3. On formate les deux partitions en **ext4** et **SWAP** :
  - `mkfs.ext4 -L BACKUP /dev/sdb1`  # On renomme avec `-L`, la partition récupère un UUID, identifiant unique
  - `mkswap -L SWAP /dev/sdb2`  # Partitionner en SWAP et renommé

### 4. On vérifie avec `lsblk -f` pour avoir des informations sur les UUID  
  MAINTENANT, on va désactiver le `sda5` en SWAP et passer sur le nouveau :

  - `swapoff /dev/sda5`  # Désactive le SWAP de `sda5`
  - On vérifie que le SWAP de `sda5` a été désactivé
  - `swapon /dev/sdb2`  # Active `sdb2` en tant que SWAP
  - On vérifie que `sdb2` est bien en mode SWAP

### 5. On vérifie avec `ls /mnt` pour voir les points de montage.  
  Crée un dossier pour les montages de backup puis monte :

  - `mkdir /mnt/backup`
  - `mount /dev/sdb1 /mnt/backup`

### 6. On vérifie avec `lsblk` si le disque est bien dans `/mnt/backup`

### 7. On configure les points de montage au démarrage dans `/etc/fstab` :
On fait un `cat` dans `/etc/fstab` pour vérifier :
On récupère l'autre avec `blkid | grep LABEL` >> `/etc/fstab` ou en SSH `root@adresseip` sur deux fenêtres (revoir SSH)
    - Faire `lsblk -f` sur la première et `nano /etc/fstab` sur la seconde
    - On commente un nouvel argument et on copie-colle une autre ligne du fichier
    - Remplacer avec celle dans l'autre page => faire ça pour les deux disques (penser à mettre le dossier `/mount/backup/` pour le `sdb1`)
    - Modifier la ligne en remplaçant après UUID `sdb1` et `sdb2` :
      - `ext4   default   0   0`
      - `swap   sw       0   0`
  On désactive celui de `sda`

### On vérifie avec la commande `mount -a`
### On vérifie avec `lsblk` que tout est ok
### On redémarre avec `reboot`
### On vérifie avec `fstab`
