## Étape 1 : Créer une Unité d'Organisation

1. **Ouvrir le Gestionnaire Active Directory**
   - Aller dans le **Gestionnaire de serveur** et sélectionner **Outils** > **Utilisateurs et ordinateurs Active Directory**.

2. **Créer l'Unité d'Organisation**
   - Dans le panneau de gauche, sélectionner le domaine **wilders.lan**.
   - Faire un clic droit sur le domaine **wilders.lan**, sélectionner **Nouveau** > **Unité d'Organisation**.
   - Nommer l'Unité d'Organisation **Wilders_students**.
   - Cocher la case **Protéger contre la suppression accidentelle** pour sécuriser l'Unité d'Organisation.
   - Cliquer sur **OK** pour confirmer.

---

## Étape 2 : Créer un Groupe d'Utilisateurs

1. **Accéder à l'Unité d'Organisation Wilders_students**
   - Dans le panneau de gauche, sous **wilders.lan**, développer l'arborescence et sélectionner **Wilders_students**.

2. **Créer le Groupe**
   - Dans **Wilders_students**, faire un clic droit, puis sélectionner **Nouveau** > **Groupe**.
   - Nommer le groupe **Students**.
   - Choisir le type de groupe : **Sécurité** (Security).
   - Sélectionner la portée du groupe : **Global**.
   - Cliquer sur **OK** pour créer le groupe.

---

## Étape 3 : Créer un Utilisateur dans le Groupe Students

1. **Créer l'Utilisateur**
   - Dans **Wilders_students**, faire un clic droit et sélectionner **Nouveau** > **Utilisateur**.
   - Remplir les champs :
     - **Prénom** : Nom au choix (par exemple, **wilder**).
     - **Nom** : Nom de famille (par exemple, **wcs**).
     - **Nom d'ouverture de session** : Utiliser un identifiant unique (ex. : **wcs.wilder**).
   - Cliquer sur **Suivant**.

2. **Configurer le Mot de Passe**
   - Saisir et confirmer le mot de passe de l'utilisateur.
   - Cliquer sur **Suivant** puis **Terminer**.

3. **Ajouter l'Utilisateur au Groupe Students**
   - Dans **Wilders_students**, faire un clic droit sur le nouvel utilisateur créé (ex. : **wcs.wilder**).
   - Sélectionner **Propriétés** > **Membre de** > **Ajouter**.
   - Dans le champ de recherche, saisir **Students** et cliquer sur **Vérifier les noms**.
   - Sélectionner le groupe **Students** et cliquer sur **OK**.
   - Valider en cliquant sur **OK** dans les fenêtres ouvertes.

