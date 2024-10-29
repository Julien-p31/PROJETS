# Initialisation et Configuration

- **`git init`** : Initialise un nouveau dépôt Git dans le dossier courant.
- **`git clone <url>`** : Clone un dépôt distant (GitHub par ex.) dans le dossier courant.
- **`git config --global user.name "Votre Nom"`** : Configure votre nom d'utilisateur global.
- **`git config --global user.email "votre_email@example.com"`** : Configure votre email global.
  
## Gestion des Fichiers

- **`git status`** : Montre l'état des modifications (fichiers modifiés, en attente d'ajout, etc.).
- **`git add <fichier>`** : Ajoute un fichier spécifique à la zone de staging (prêt pour le commit).
- **`git add .`** : Ajoute tous les fichiers modifiés à la zone de staging.
- **`git rm <fichier>`** : Supprime un fichier du suivi Git et de l'index.
- **`git mv <ancien_nom> <nouveau_nom>`** : Renomme un fichier.

## Gestion des Commits

- **`git commit -m "Message du commit"`** : Crée un commit avec un message décrivant les modifications.
- **`git commit -am "Message"`** : Ajoute et commit tous les fichiers suivis en une seule commande.
- **`git log`** : Affiche l'historique des commits.
- **`git log --oneline`** : Affiche l'historique des commits de manière condensée.
  
## Gestion des Branches

- **`git branch`** : Liste les branches locales.
- **`git branch <nom>`** : Crée une nouvelle branche.
- **`git checkout <branche>`** : Change la branche active.
- **`git checkout -b <nouvelle_branche>`** : Crée et change vers une nouvelle branche.
- **`git merge <branche>`** : Fusionne une branche spécifique dans la branche courante.
- **`git branch -d <branche>`** : Supprime une branche locale.

## Synchronisation avec GitHub

- **`git remote add origin <url>`** : Lien entre le dépôt local et le dépôt distant (GitHub par ex.).
- **`git push -u origin <branche>`** : Envoie une branche locale sur GitHub et fixe l'upstream.
- **`git push`** : Envoie les commits locaux vers le dépôt distant.
- **`git pull`** : Récupère les modifications du dépôt distant et les fusionne dans la branche locale.
- **`git fetch`** : Récupère les modifications du dépôt distant sans fusionner.

## Gestion des Tags

- **`git tag <nom_du_tag>`** : Crée un tag sur le dernier commit.
- **`git tag -a <nom_du_tag> -m "Message"`** : Crée un tag annoté.
- **`git push origin <nom_du_tag>`** : Envoie le tag vers GitHub.

## Annulation de Modifications

- **`git reset <fichier>`** : Retire un fichier de la zone de staging.
- **`git reset --hard <commit>`** : Réinitialise complètement à un commit spécifique.
- **`git revert <commit>`** : Annule un commit spécifique en créant un nouveau commit.

## Raccourcis et Commandes Utiles

- **`git stash`** : Sauvegarde temporairement les modifications non commitées.
- **`git stash pop`** : Restaure les modifications précédemment sauvegardées avec `stash`.
- **`git diff`** : Affiche les différences entre les fichiers modifiés et la dernière version commitée.
- **`git diff --staged`** : Affiche les différences des fichiers en zone de staging.

## Exemples Courants

- **Initialiser un dépôt et envoyer le premier commit** :
  ```bash
  git init
  git add .
  git commit -m "Premier commit"
  git branch -M main
  git remote add origin <url_du_dépôt>
  git push -u origin main

	•	Créer une nouvelle branche et l’envoyer sur GitHub :

git checkout -b nouvelle_branche
git push -u origin nouvelle_branche


	•	Mettre à jour la branche locale avec les changements du dépôt distant :

git pull origin main
