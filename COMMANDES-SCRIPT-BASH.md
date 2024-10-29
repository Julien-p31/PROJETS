# Documentation : Commandes et Scripting en Bash sous Linux

## 1. Commandes Bash de base

### 1.1 Commandes de navigation et de gestion des fichiers  
- **`pwd`** : Affiche le répertoire de travail actuel.  
- **`ls [OPTIONS] [CHEMIN]`** : Liste les fichiers et dossiers.  
  - `-l` : Mode liste détaillée.  
  - `-a` : Affiche tous les fichiers, y compris les fichiers cachés.  
  - `-h` : Affiche la taille des fichiers dans un format lisible.  
  - `-R` : Affiche le contenu des sous-dossiers de façon récursive.  
- **`cd [CHEMIN]`** : Change de répertoire.  
  - `cd -` : Retourne au dernier répertoire visité.  
- **`mkdir [OPTIONS] <NOM_DOSSIER>`** : Crée un nouveau dossier.  
  - `-p` : Crée les dossiers parents si nécessaires.  
- **`rmdir [OPTIONS] <NOM_DOSSIER>`** : Supprime un dossier vide.  
  - `--ignore-fail-on-non-empty` : Ignore les erreurs si le dossier n’est pas vide.  
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

### 1.2 Commandes d’affichage du contenu de fichiers  
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

## 2. Scripting Bash : Variables, Conditions et Boucles

### 2.1 Variables  
- **Déclaration d’une variable** : `variable="valeur"`.  
- **Afficher une variable** : `echo $variable`.  
- **Lire une entrée utilisateur** : `read variable`.  
- **Export d’une variable** : `export variable`.  

### 2.2 Conditions  
- **Syntaxe de base** :  
  ```bash
  if [ condition ]; then
    # instructions
  elif [ autre_condition ]; then
    # instructions
  else
    # instructions
  fi
