# Documentation : Commandes Bash sous Linux avec Options

## 1. Commandes de navigation et de gestion des fichiers

- **`pwd`** : Affiche le répertoire de travail actuel.

- **`ls [OPTIONS] [CHEMIN]`** : Liste les fichiers et dossiers.
  - `-l` : Affiche la liste en mode détaillé.
  - `-a` : Affiche tous les fichiers, y compris les fichiers cachés.
  - `-h` : Affiche la taille des fichiers en format lisible (ex. `K`, `M`, `G`).
  - `-R` : Affiche le contenu des sous-dossiers de façon récursive.

- **`echo [OPTIONS] <TEXTE>`** : Affiche un texte à l’écran.
  - `-e` : Active l’interprétation des séquences d’échappement (ex : `\n` pour nouvelle ligne, `\t` pour tabulation).
  - `-n` : Supprime le saut de ligne final.
  - `-E` : Désactive les séquences d’échappement (comportement par défaut).
  - 
- **`cd [CHEMIN]`** : Change de répertoire.
  - `cd -` : Retourne au dernier répertoire visité.

- **`mkdir [OPTIONS] <NOM_DOSSIER>`** : Crée un nouveau dossier.
  - `-p` : Crée les dossiers parents s’ils n’existent pas.

- **`rmdir [OPTIONS] <NOM_DOSSIER>`** : Supprime un dossier vide.
  - `--ignore-fail-on-non-empty` : Ignore les erreurs si le dossier n'est pas vide.

- **`rm [OPTIONS] <FICHIER>`** : Supprime un fichier.
  - `-r` : Supprime de façon récursive.
  - `-f` : Force la suppression sans confirmation.

- **`cp [OPTIONS] <SOURCE> <DESTINATION>`** : Copie un fichier ou dossier.
  - `-r` : Copie les dossiers de façon récursive.
  - `-u` : Copie seulement si la source est plus récente que la destination.

- **`mv [OPTIONS] <SOURCE> <DESTINATION>`** : Déplace ou renomme un fichier ou dossier.
  - `-i` : Demande confirmation avant de remplacer un fichier.

- **`touch [OPTIONS] <NOM_FICHIER>`** : Crée un fichier vide ou met à jour la date de modification.
  - `-a` : Modifie uniquement la date d’accès.
  - `-m` : Modifie uniquement la date de modification.

---

## 2. Commandes d'affichage du contenu de fichiers

- **`cat [OPTIONS] <FICHIER>`** : Affiche le contenu d’un fichier.
  - `-n` : Numérote les lignes.
  - `-E` : Affiche les symboles de fin de ligne (`$`).

- **`head [OPTIONS] <FICHIER>`** : Affiche les premières lignes d’un fichier.
  - `-n <N>` : Affiche les `<N>` premières lignes.

- **`tail [OPTIONS] <FICHIER>`** : Affiche les dernières lignes d’un fichier.
  - `-n <N>` : Affiche les `<N>` dernières lignes.
  - `-f` : Suit le fichier en temps réel (utile pour les logs).

- **`less [OPTIONS] <FICHIER>`** : Affiche le contenu d'un fichier page par page.
  - `-N` : Affiche les numéros de ligne.
  - `/motif` : Recherche un motif dans le fichier.

---

## 3. Commandes de gestion des permissions

- **`chmod [OPTIONS] <PERMISSIONS> <FICHIER>`** : Change les permissions d’un fichier ou dossier.
  - `-R` : Applique les permissions de façon récursive.

- **`chown [OPTIONS] <PROPRIETAIRE>:<GROUPE> <FICHIER>`** : Change le propriétaire et le groupe.
  - `-R` : Applique le changement de façon récursive.

- **`chgrp [OPTIONS] <GROUPE> <FICHIER>`** : Change le groupe d’un fichier.
  - `-R` : Applique le changement de façon récursive.

---

## 4. Commandes de recherche

- **`find <REPERTOIRE> [OPTIONS]`** : Recherche des fichiers selon des critères.
  - `-name <NOM>` : Recherche par nom.
  - `-type <TYPE>` : Filtre par type (`f` pour fichier, `d` pour dossier).
  - `-size <TAILLE>` : Recherche par taille (ex. `+100M` pour les fichiers de plus de 100 Mo).

- **`locate [OPTIONS] <NOM_FICHIER>`** : Recherche rapidement un fichier.
  - `-i` : Ignore la casse.
  - `-n <N>` : Limite le nombre de résultats à `<N>`.

- **`grep [OPTIONS] <MOTIF> <FICHIER>`** : Recherche un motif dans un fichier.
  - `-i` : Ignore la casse.
  - `-r` : Recherche de façon récursive.
  - `-n` : Affiche les numéros de ligne.

---

## 5. Commandes de gestion des processus

- **`ps [OPTIONS]`** : Affiche les processus en cours.
  - `aux` : Affiche tous les processus avec des détails.
  - `-e` : Affiche tous les processus.

- **`top [OPTIONS]`** : Affiche les processus actifs en temps réel.
  - `-u <UTILISATEUR>` : Affiche les processus d'un utilisateur.
  - `-p <PID>` : Suit un processus spécifique.

- **`kill <PID>`** : Arrête un processus avec son identifiant.
  - `-9 <PID>` : Forcer l’arrêt d’un processus.

---

## 6. Commandes de gestion des archives et de compression

- **`tar [OPTIONS] <ARCHIVE> <FICHIERS>`** : Archive et compresse des fichiers.
  - `-c` : Crée une nouvelle archive.
  - `-x` : Extrait une archive.
  - `-v` : Affiche les fichiers traités.
  - `-z` : Compresse avec gzip.
  - `-j` : Compresse avec bzip2.

- **`gzip [OPTIONS] <FICHIER>`** : Compresse un fichier en `.gz`.
  - `-d` : Décompresse un fichier gzip.

- **`zip [OPTIONS] <ARCHIVE.zip> <FICHIERS>`** : Archive en format `.zip`.
  - `-r` : Archive un dossier de façon récursive.

---

## 7. Commandes réseau

- **`ping [OPTIONS] <ADRESSE>`** : Teste la connectivité réseau.
  - `-c <N>` : Définit le nombre de paquets.

- **`ifconfig [OPTIONS]`** : Affiche la configuration réseau.
  - `<INTERFACE>` : Affiche les infos d’une interface spécifique.

- **`ip a`** : Affiche les interfaces réseau et leurs adresses IP.

- **`wget [OPTIONS] <URL>`** : Télécharge un fichier depuis une URL.
  - `-O <FICHIER>` : Enregistre avec un nom spécifique.
  - `-c` : Reprend un téléchargement interrompu.

- **`curl [OPTIONS] <URL>`** : Récupère le contenu d'une URL.
  - `-O` : Télécharge et sauvegarde avec le nom d’origine.
  - `-I` : Affiche uniquement les en-têtes.

---

## 8. Commandes d’administration système

- **`sudo [OPTIONS] <COMMANDE>`** : Exécute une commande avec privilèges élevés.
  - `-i` : Ouvre une session avec les droits root.

- **`apt [OPTIONS] <ACTION>`** : Gestion des paquets sous Debian/Ubuntu.
  - `update` : Met à jour la liste des paquets.
  - `upgrade` : Met à jour les paquets installés.

- **`df [OPTIONS]`** : Affiche l’utilisation du système de fichiers.
  - `-h` : Affiche les tailles en format lisible.

- **`du [OPTIONS] <DOSSIER>`** : Affiche la taille d’un dossier.
  - `-h` : Affiche les tailles en format lisible.
  - `-s` : Résumé de la taille du dossier.

- **`free [OPTIONS]`** : Affiche l’utilisation de la mémoire.
  - `-h` : Affiche les tailles en format lisible.

---

## 9. Commandes de gestion des utilisateurs

- **`adduser <NOM>`** : Ajoute un nouvel utilisateur.

- **`deluser <NOM>`** : Supprime un utilisateur.

- **`usermod [OPTIONS] <NOM>`** : Modifie les informations d’un utilisateur.
  - `-aG <GROUPE>` : Ajoute l’utilisateur à un groupe.

---

## 10. Commandes de redirection et de pipes

- **`>`** : Redirige la sortie d'une commande vers un fichier, en écrasant.
- **`>>`** : Redirige la sortie en ajoutant au contenu existant.
- **`|`** : Envoie la sortie d'une commande comme entrée pour une autre.
- **`<`** : Redirige l'entrée d'un fichier vers une commande.

---

## 11. Commandes de gestion des variables et scripts

- **`export <VARIABLE>=<VALEUR>`** : Déclare une variable d’environnement.
- **`echo $<VARIABLE>`** : Affiche la valeur d’une variable.
- **`alias <NOM>='<COMMANDE>'`** : Crée un alias pour une commande.
  - Exemple : `alias ll='ls -la'`
- **`unset <VARIABLE>`** : Supprime une variable ou un alias.

---

## Conclusion
Ce guide regroupe les commandes et options essentielles en Bash sous Linux, utile pour la navigation et la gestion des systèmes.
