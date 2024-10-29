# Documentation : Commandes PowerShell avec Options

## 1. Commandes de navigation et de gestion des fichiers

- **`Get-Location`** : Affiche le répertoire de travail actuel.
  
- **`Set-Location -Path <Chemin>`** : Change de répertoire.

- **`Get-ChildItem [OPTIONS] -Path <Chemin>`** : Liste les fichiers et dossiers.
  - `-Recurse` : Liste tous les sous-dossiers récursivement.
  - `-File` : Affiche uniquement les fichiers.
  - `-Directory` : Affiche uniquement les dossiers.
  
- **`New-Item -Path <Chemin> -ItemType Directory`** : Crée un nouveau dossier.
  
- **`Remove-Item -Path <Chemin>`** : Supprime un fichier ou dossier.
  - `-Recurse` : Supprime de manière récursive.
  - `-Force` : Supprime sans demander de confirmation.

- **`Copy-Item -Path <Source> -Destination <Destination>`** : Copie un fichier ou dossier.
  - `-Recurse` : Copie tout le contenu récursivement.

- **`Move-Item -Path <Source> -Destination <Destination>`** : Déplace ou renomme un fichier ou dossier.

- **`New-Item -Path <Chemin> -ItemType File`** : Crée un fichier vide.

---

## 2. Commandes d'affichage du contenu de fichiers

- **`Get-Content -Path <Fichier>`** : Affiche le contenu d'un fichier.
  - `-TotalCount <N>` : Affiche les `<N>` premières lignes.
  - `-Wait` : Suit le fichier en temps réel (utile pour les logs).
  
- **`Select-String -Path <Fichier> -Pattern <Motif>`** : Recherche un motif dans un fichier.
  - `-CaseSensitive` : Recherche sensible à la casse.
  - `-AllMatches` : Affiche toutes les correspondances.

---

## 3. Commandes de gestion des permissions

- **`Get-Acl -Path <FichierOuDossier>`** : Affiche les permissions d'un fichier ou dossier.
  
- **`Set-Acl -Path <FichierOuDossier> -AclObject <Acl>`** : Définit les permissions.

---

## 4. Commandes de recherche

- **`Get-ChildItem -Path <Chemin> -Recurse`** : Recherche des fichiers dans les sous-dossiers.

- **`Select-String -Path <Fichier>`** : Recherche des motifs dans des fichiers.
  
---

## 5. Commandes de gestion des processus

- **`Get-Process [Nom]`** : Liste les processus en cours.
  - `-Id <ID>` : Affiche un processus par son ID.
  - `-Name <Nom>` : Affiche un processus par son nom.

- **`Stop-Process -Id <ID>`** : Arrête un processus avec son identifiant.
  - `-Force` : Force l'arrêt.

- **`Start-Process -FilePath <Chemin>`** : Lance un processus.

---

## 6. Commandes de gestion des archives

- **`Compress-Archive -Path <Source> -DestinationPath <Archive.zip>`** : Archive et compresse des fichiers.
  - `-CompressionLevel Optimal` : Définir le niveau de compression optimal.
  
- **`Expand-Archive -Path <Archive.zip> -DestinationPath <Destination>`** : Extrait une archive.

---

## 7. Commandes réseau

- **`Test-Connection -ComputerName <Adresse>`** : Teste la connectivité réseau (similaire à `ping`).
  - `-Count <N>` : Définit le nombre de paquets.

- **`Invoke-WebRequest -Uri <URL>`** : Télécharge du contenu depuis une URL.
  - `-OutFile <Fichier>` : Enregistre le contenu dans un fichier.

---

## 8. Commandes d’administration système

- **`Get-Service`** : Affiche les services.
  - `-Name <Nom>` : Affiche un service spécifique.
  
- **`Start-Service -Name <Nom>`** : Démarre un service.
  
- **`Stop-Service -Name <Nom>`** : Arrête un service.
  
- **`Set-ExecutionPolicy <Policy>`** : Définit la politique d'exécution des scripts.
  - `-Scope <Scope>` : Définit le niveau de la politique (`Process`, `CurrentUser`, etc.).

---

## 9. Commandes de gestion des utilisateurs

- **`Get-LocalUser`** : Liste les utilisateurs locaux.
  
- **`New-LocalUser -Name <Nom>`** : Crée un nouvel utilisateur.
  
- **`Remove-LocalUser -Name <Nom>`** : Supprime un utilisateur.
  
- **`Add-LocalGroupMember -Group <Groupe> -Member <Utilisateur>`** : Ajoute un utilisateur à un groupe.

---

## 10. Commandes de redirection et de pipes

- **`|`** : Envoie la sortie d'une commande comme entrée d'une autre.
- **`>`** : Redirige la sortie d'une commande vers un fichier, en écrasant le contenu.
- **`>>`** : Redirige la sortie en ajoutant au contenu existant.

---

## 11. Commandes de gestion des variables et scripts

- **`$Variable = <Valeur>`** : Déclare une variable.

- **`Write-Host <Message>`** : Affiche un message à l’écran.
  - `-ForegroundColor` : Change la couleur du texte.
  - `-NoNewline` : Supprime le saut de ligne final.
  
- **`Write-Output <Valeur>`** : Envoie une valeur en sortie (utilisé pour les scripts et les fonctions).

- **`function <NomFonction> { <Commandes> }`** : Définit une fonction.

- **Boucles :**
  - **`For ($i=0; $i -lt 10; $i++) { <Commandes> }`** : Boucle `for`.
  - **`ForEach ($item in $collection) { <Commandes> }`** : Boucle `foreach`.
  - **`While (<Condition>) { <Commandes> }`** : Boucle `while`.
  - **`Do { <Commandes> } While (<Condition>)`** : Boucle `do-while`.

- **Conditions :**
  - **`if (<Condition>) { <Commandes> } elseif (<Condition>) { <Commandes> } else { <Commandes> }`** : Condition `if`.
