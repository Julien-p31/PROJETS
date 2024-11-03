# SOMMAIRE : 

- [Remarques générales/précautions](#remarques-généralesprécautions)
- [Avant de travailler dans les dépôts](#avant-de-travailler-dans-les-dépôts)
- [Cas de figure 1 : Créer un dépot git depuis un répertoire local](#cas-de-figure-1-créer-un-dépôt-git-depuis-un-répertoire-local)
- [Cas de figure 2 : Récupérer un dépot distant vers mon espace local](#cas-de-figure-2-récupérer-un-dépôt-distant-vers-mon-espace-local)
  - [A local copy](#a-local-copy)
  - [Manip des branches](#manip-des-branches)
  - [Lier branche locale et distante](#lier-branche-locale-et-distante)
  - [On push now?](#on-push-now)
  - [Fusion](#fusion)
- [Je veux juste les commandes](#je-veux-juste-les-commandes)
  - [Cas de figure 1](#cas-de-figure-1)
  - [Cas de figure 2](#cas-de-figure-2)
  - [Recap commandes utiles](#recap-commandes-utiles)
- [Pourquoi utiliser Git/GitHub?](#pourquoi-utiliser-gitgithub)
- [Pourquoi utiliser le terminal?](#pourquoi-utiliser-le-terminal)
- [Pourquoi utiliser VS code ? (Ou un autre IDE)](#pourquoi-utiliser-vs-code-ou-un-autre-ide)
- [EN COURS : Quelques spécificités](#en-cours--quelques-spécificités)
- [Ressources](#ressources)

# Remarques générales/précautions : 

<br>

* Ne pas travailler directement dans *main*. Attendre l'aval de l'équipe au complet pour *push* du code dans *main* (communiquer).
* Aussi, bien communiquer qui travaille sur quelle tâche. Les tâches, qui peuvent contenir une ou plusieurs fonctionnalités, sont suffisamment bien découpées et comprises par tout le monde (de manière à ce qu'on puisse les découper par branche).
* Lorsque le *main* est entamé, qu'on travaille sur une nouvelle version, correction de bug, ou nouvelle fonctionnalité : dans votre espace de travail, retourner régulièrement sur la branche principale *git checkout main* pour faire des *git pull*. Ceci permet de toujours partir sur une base à jour et évite des conflits inutiles.
* Avant de faire des *Pull Request*, tester le code avant (logique, mais bon).
* Parce ce *main* se rapproche du livrable, trancher sur ce qui va dedans ou à l'inverse ce qui doit être revu/corrigé est à la charge du PO
* Trancher sur comment les tâches se découpent et se répartissent est à la charge du SM. La logique ne veut pas forcément 1 branche = 1 personne, même si c'est plus safe ainsi au départ. Il peut être plus efficace de travailler à deux ou plus sur la même branche, il s'agit de communiquer et de comprendre les commandes git.

<p align="center">
<img src="https://github.com/Eulsi/Basic-gitGithub-manip-pour-TSSR/blob/main/imgGuide/BrancheDecoupExemple2.svg" alt="Pictures" width="400" >
</p>

<p align="center">
<i>Exemple d'une découpe en branches pour du git et d'une répartition des tâches</i>
</p>



* Ce guide souhaite transmettre de bonnes pratiques assez générales, il ne s'agit pas de la meilleure procédure pour chaque cas. Les remarques et corrections sont les bienvenues.

<br>

#  Avant de travailler dans les dépôts

<br>

***Git*** = logiciel de gestion de versions installé localement

***Github*** = plateforme de dépot de fichiers à distance, managée par git.

***Workspace*** != ***Local-repository*** != ***Remote-repository***
>*il est important de comprendre que votre espace de travail est un espace différent du dépot local, ce dernier est censé faire mirroir avec le dépot distant*

<br>

Tester si votre connexion ssh a bien été établie entre votre machine locale et github :

```ssh -T git@github.com```

 On vous demandera probablement un mot de passe ou la "passphrase" que vous avez du fournir lors du partage de votre clé ssh
entre votre compte et la machine locale.

Si la connexion est bien établie, vous recevrez un msg dans le terminal du genre "*Hi User ! You've successfully authenticated, but GitHub does not provide shell access.*"

Si vous avez besoin de générer une clé ssh sur votre machine, suivre ce tuto : [générer une paire de clés ssh à la main](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

<br>

# Cas de figure 1 : Créer un dépot git depuis un répertoire local

<br>

<ins>Situation</ins> : J'ai un dossier, un espace de travail sur ma machine que je veux pouvoir gérer avec git. Je souhaite qu'il soit disponible depuis mon compte github.

:small_orange_diamond:  ```cd``` dans mon espace de travail.

```git init```

```git add . ```

``` git commit -m "toujours préciser un commentaire, ici, bon, 'start' suffit" ```

<br>

:small_orange_diamond: Sur github : créer un dépot en ligne, lui donner un nom, pas besoin de readme car on a déjà initialisé le dépot en local.
Récupérer son lien ssh.

<p align="center">
<img src="https://github.com/Eulsi/Basic-gitGithub-manip-pour-TSSR/blob/main/imgGuide/recupSSHGit.gif" alt="Pictures" width="600" >
</p>

<br>

:small_orange_diamond: Reprendre le terminal du dépôt local

```git remote add origin git@github.com:username/nom-du-depot.git```

``` git push -u origin main.```

>*git remote va vous faire le lien entre votre espace de travail et le nom du dépôt github*
> 
>*-u est en réalité la contraction de "--set-upstream" , qui va lier votre branche locale à la branche distante*

<br>

Par défaut, la branche active est la branche principale *main*. La bonne pratique veut que nous n'ajoutions pas directement de modifications dans *main*, pour des questions de sécurité, mais aussi selon l'organisation de l'équipe. Le *main* doit être la branche considérée comme le résultat final, le plus proche du livrable et ce qui est *push* dessus devrait idéalement ne plus être modifié et prêt à l'emploi.

<br>

# Cas de figure 2 : Récupérer un dépot distant vers mon espace local

<br>

<ins>Situation </ins> : Je n'ai pas encore travaillé dans mon dossier local, je souhaite récupérer le contenu du dépot distant (de mon équipe ou de qqun d'autre) pour travailler dessus en local.

>*Pour avoir les droits d'accès et de manipulation d'un dépot dont on est pas propriétaire, il faut s'assurer que l'administrateur/propriétaire de ce dépot ajoute notre clé ssh au dépot, et nous ajoute en tant que collaborateur.*

### A local copy


<p align="center">
<img src="https://github.com/Eulsi/Basic-gitGithub-manip-pour-TSSR/blob/main/imgGuide/get-alocalcopy.png" alt="Pictures" width="300" >
</p>

:small_orange_diamond: Cloner le dépot distant sur son espace de travail en local :

```cd ``` dans mon espace de travail

```git clone <url ou lien ssh dépot> ```

Attention, en général on ne souhaite pas que vous modifiez directement le travail existant de quelqu'un d'autre.
C'est pourquoi il est important de travailler sur une autre branche, celle qui vous a été attribuée ou que vous allez créer.

<br>

### Manip des branches

Bien qu'on soit dans le terminal, une aide visuelle sur les branches peut être utile.

:small_orange_diamond:  Faites ```git branch -a```

La branche active est signalée avec une astérisque devant son nom. En l'occurence ca devrait être \*main 

:small_orange_diamond:  Créons notre nouvelle branche.

```git branch ma-nouvelle-fonctionnalité```

Si vous tentez à nouveau ```git branch -a``` vous remarquerez que votre nouvelle branche a été créée, mais il ne s'agit pas de la branche active.
A ce moment toute modification effectuée dans votre espace de travail se fera directement dans *main*.

:small_orange_diamond:  Changez de branche avec 

``` git checkout ma-nouvelle-fonctionnalité``` ou ```git switch ma-nouvelle-fonctionnalité```

*git checkout* permet de se déplacer à un endroit, et ici rendra la branche choisie active.

> *A savoir, ```git checkout -b ma-nouvelle-fonctionnalité``` réalise les deux dernières commandes en une seule*

<p align="center">
<img src="https://github.com/Eulsi/Basic-gitGithub-manip-pour-TSSR/blob/main/imgGuide/chmntBranch.png" alt="Pictures" width="600" >
</p>

<br>

### Lier branche locale et distante

:small_orange_diamond: ```git push -u origin ma-nouvelle-fonctionnalité``` ( -u pour --set-upstream)

Si la connexion a bien été établie au préalable, cette commande ajuste l'arboresence de votre dépot distant github avec votre nouvelle branche.
Pourquoi la réaliser à ce moment ? 
* Elle notifie l'équipe qu'une nouvelle branche a été créée et qu'une fonctionnalité est en cours de travail.
* Aussi tous vos nouveaux *git add . git commit git push* permettront de sécuriser votre travail en ayant une copie distante. 
* Un coéquipier peut se permettre de visualiser/tester vos modif en l'état et communiquer avec vous s'il voit quelque chose à dire (prévenir bug ou proposer de nouvelles choses).

<p align="center">
<img src="https://github.com/Eulsi/Basic-gitGithub-manip-pour-TSSR/blob/main/imgGuide/localDistantBranch.png" alt="Pictures" width="700" >
</p>

<br>

La suite, vous la connaissez, on envoie les passagers en vacances.

:small_orange_diamond: Après avoir réalisé vos modifs dans vos fichiers,

```git add . ```

```git commit -m "le commentaire que j'ai pas oublié"```

>*L'importance de spécifier un commentaire à chaque commit est autant une question de collaboration que de conserver l'utilité de github.*
>
>*Imaginons que je souhaite revenir au commit "15" réalisé il y a une semaine. Je peux vérifier la liste des commits, mais sur les 40 que me propose github je n'ai aucun souvenir duquel a modifié quoi. Je suis obligé de retourner dans le code à chaque commit pour le relire et retrouver cette maudite modification qui pose problème. Faisable mais pas rapide.*
>
>*Si je réalise la bonne description, fidèle à la modification enregistrée, je peux facilement retrouver à quoi correspond quoi. Mais j'aide aussi grandement mes équipiers à comprendre l'évolution de mon code, comme dans le cas où ce serait à eux de passer en revue le code en mon absence.*

<br>

### On push now?

Attenzione...

Avant de push votre travail, pendant que vous travailliez quelqu'un a peut être déjà modifié le tronc commun, le *main*.

(Normalement non. Mais peut être).

Il est important de récupérer le dépot distant tel qu'il est en état actuel pour ensuite placer votre ajout ou votre modification. Ceci permettant d'éviter des erreurs de conflits supplémentaires ou de se battre inutilement avec une version obsolète du code commun :expressionless:

Cette remarque prend pour exemple le *main*, mais il peut très bien s'agir d'une arborescence plus chargée.

<ins>Exemple</ins> : une branche nommée "gestion-utilisateurs" parente de votre branche "attribution-droits-ecriture"; avant de *push* votre branche "attribution-droits-ecritures" restez attentif à ce que "gestion-utilisateur" n'aie pas été modifiée pendant votre travail sur l'attribution de droit, et pour s'assurer de cela on peut tout simplement pull la dernière version de la branche parente. Il se peut que cela ne change rien du tout, il s'agit d'une précaution.


<p align="center">
<img src="https://github.com/Eulsi/Basic-gitGithub-manip-pour-TSSR/blob/main/imgGuide/git-mess.png" alt="Pictures" width="300" >
</p>

<br>

:small_orange_diamond: Dans notre cas, retour dans la branche principale *main*

```git checkout main```

```git pull origin main``` (à faire fréquemment pour maintenir le code en commun à jour)

```git checkout ma-nouvelle-fonctionnalité```

```git push```

> dans ``` git pull origin main ``` "origin" spécifie à git que c'est depuis le dépot distant que nous voulons la récupération du *main*.

<br>

### Fusion

Si à un moment donné dans votre travail, la fonctionnalité que vous créez sur votre branche est estimée sufisamment fonctionnelle, vous pouvez décider après la triade *add-commit-push* de faire une *Pull Request* depuis github. Ce n'est pas toujours très utile. Mais c'est très fair-play.

La *Pull Request* envoie une notification aux collaborateurs et surtout à la personne responsable de l'administration du dépot distant, par exemple le PO.
C'est avec celle-ci, ou le responsable de la branche parente, que le travail de collaboration se poursuit. En général on fait une revue du code ensemble pour anticiper les conflits s'il y en a et approuver l'ajout de cette nouvelle portion de code dans le *main* (ou la branche à fusionner).

:small_orange_diamond: Avec ou sans *Pull Request*, fusionner la branche quand on est prêt.
Se placer dans la branche de destination = la branche qui va recevoir les modifs d'une autre branche.

```git checkout main```

```git merge ma-nouvelle-fonctionnalité```


C'est à cette étape que git signale si la fusion est possible ou non. Si conflit il y a, on retourne en collaboration sur le code.
Pour la résolution de conflits, deux possibilités.
Réaliser la résolution de conflit depuis le terminal (ou VS code) ou depuis l'interface github qui propose un visuel de gestion de conflits intéressant.
Dans VS code ou Github, les lignes problématiques car différentes d'une branche à l'autre apparaissent en rouge.

Lorsque la fusion est terminée et que les conflits sont résolus, il est préférable de retester le code.
Si ce dernier se comporte comme souhaité, selon que vous ayez géré le conflit depuis un *Pull Request* github ou depuis le terminal en local :

* Si la fusion a été effectuée localement :

:small_orange_diamond: ```git push origin main``` envoyez le résultat du *merge* dans le dépot distant

* Si la fusion a été effectuée sur GitHub :

:small_orange_diamond: ```git pull origin main```  Dans cet autre cas, récupérez le résultat du *merge* effectué sur le dépot distant


De cette manière, dépot local et distant sont synchronisés.

<br>

# Je veux juste les commandes :

<br>

### Cas de figure 1

:small_orange_diamond: Créer un dépot local avec git (dans notre espace de travail)
```
git init
git add .
git commit -m "toujours préciser un commentaire, ici, bon, 'start' suffit"
```

:small_orange_diamond: Créer un dépot en ligne <ins>sur Github</ins>, puis l'associer au local

```
git remote add origin git@github.com:username/nom-du-depot.git
git push -u origin main.
```
:small_orange_diamond: Reproduire cette dernière commande pour la création de nouvelles branches.

:small_orange_diamond: Faire ses modfis *add/commit*

:small_orange_diamond: Poursuivre avec les même étapes du cas de figure 2 à partir de "On push"

 <br>

### Cas de figure 2


:small_orange_diamond: Préparer une copie locale
```
git clone <url ou lien ssh dépot>
git branch ma-nouvelle-fonctionnalité
git checkout ma-nouvelle-fonctionnalité
git push -u origin ma-nouvelle-fonctionnalité
```
:small_orange_diamond: Faire ses modifs

```
git add . 
git commit -m "le commentaire que j'ai pas oublié"
```
:small_orange_diamond: Mettre à jour la branche parente avant *push*

```
git checkout main
git pull origin main
git checkout ma-nouvelle-fonctionnalité
git push
```

:small_orange_diamond: Fusionner

```
git checkout main
git merge ma-nouvelle-fonctionnalité
```
:small_orange_diamond: Remettre à jour distant et local avec *git push* ***ou*** *git pull* selon le choix du *merge*
```
git push origin main
git pull origin main
```

 <br>

### Recap commandes utiles

1. Vérifier l'historique des commits :
   ```bash
   git log
   ```
2. Vérifier l'état du dépôt :
   ```bash
   git status
   ```
3. Créer un dépôt local :
   ```bash
   git init
   ```
4. Ajouter des fichiers :
   ```bash
   git add nom-du-fichier
   ```
   ou pour tous les fichiers :
   ```bash
   git add .
   ```
5. Faire un commit :
   ```bash
   git commit -m "m pour message, commenter son commit"
   ```
6. Lier le dépôt local à GitHub :
   ```bash
   git remote add origin lien-ssh-du-dépôt
   git push -u origin main
   ```
7. Cloner un dépôt distant :
   ```bash
   git clone url ou lien ssh dépôt
   ```
8. Créer une branche :
   ```bash
   git branch nom-branche
   ```
9. Changer de branche :
   ```bash
   git checkout nom-branche
   ```
   ou 
   ```bash
   git switch nom-branche
   ```
10. Pousser une branche :
    ```bash
    git push -u origin nom-branche
    ```
11. Récupérer les dernières modifications :
    ```bash
    git pull origin main
    ```
12. Fusionner une branche :
    ```bash
    git merge nom-branche
    ```

<p align="center">
<img src="https://github.com/Eulsi/Basic-gitGithub-manip-pour-TSSR/blob/main/imgGuide/git-workflow1.png" alt="Pictures" width="800" >
</p>


 <br>
    
 # Avantages utiliser Git/Github (sous entendu le logiciel + la concertation fréquente entre collègues) : 
 
 <br>

* Impossible de perdre le travail de quelqu'un, il y aura toujours une trace
* Le dépôt commun centralise toutes les dernières modifications et fichiers.
* Les gens peuvent bosser sur le même fichier simultanément. Qu'ils soient sur la même branche ou sur deux branches différentes, s'ils se sont compris, il suffit de fusionner (merge) à la fin leur deux versions du même fichier. Mieux ils se sont compris, moins il y aura de conflit. --> gain de temps. C'est LE principe originel de l'outil. Deux collègues ne sont pas obligés d'attendre que l'un ait terminé de travailler sur telle partie pour que l'autre implémente une nouvelle idée dans le même code.
* Si par ailleurs les nouvelles implémentations ne sont finalement pas désirées, ou trop bordélique, ou trop d'erreurs, il est possible de décider de revenir à une version précédente du projet, de la branche ou du commit.
* Qu'on choisisse de travailler en parallèle (différentes branches) ou simultanément sur le même fichier, tout le monde se sent efficace.

<br>

# Pourquoi l'utiliser depuis le terminal ?

<br>

* S'habituer à écrire les commandes permet à la longue de mieux retenir et comprendre ce qu'il se passe dans le versionning.
* Controler ce qu'on fait. Les GUI ne sont pas tous pareils, ils peuvent évoluer, et les actions peuvent sembler moins transparentes.
* Les manip peuvent être plus fine, git propose une quantité de commandes qui dépassent son utilisation basique
* Peut être beaucoup plus rapide à la longue, côté performance machine, mais côté humain également. Certains se créent des alias pour combiner des commandes complexes (on sort du git basique), ou des scripts leur permettant de raccourcir les manip.
* Les lignes de commandes ne changent pas ou très peu avec le temps. (exemple git checkout est devenu git switch, mais checkout fonctionne toujours).
* ! Github reste très pratique pour la partie sociale du code, les *Pull Request*, et la gestion des conflits.

<br>

# Pourquoi utiliser VS code ? (Ou un autre IDE)

<br>

* Très pratique pour gérer les conflits (VS code vous propose des choix de correction en cas de conflits)
* L'intégration de git dans VS code est stable et poussée
* Permet de visualiser directement le terminal, ce qu'on importe (*git pull*), ou ce qui sera "exporté" ou non (*git push* avec .gitignore). On a aussi une vue sur l'arborescence des dossiers de l'espace de travail
* Pour faire du code review, et discuter de vos conflits ou erreurs rencontrées, VS code propose "Live share" permettant à plusieurs utilisateurs de débugger ensemble la même feuille.
* Quantité d'autres plugin à installer offrant des visuels sur l'évolution des branches, des commits etc... 

<br>

## EN COURS : Quelques spécificités :

<br>

* utiliser depuis VS code
* gérer dossier dans le dépot local
* revert à partir d'un commit précédent

    
    <br>

# Ressources
    
* apprendre à manipuler les branches avec git : https://learngitbranching.js.org
    
