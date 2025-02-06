# Nikto : Outil de Sécurité Web

**Nikto** est un outil libre et open-source codé en langage Perl. Il permet de scanner un serveur web et d'afficher toutes les failles potentielles. Nikto fait partie des outils embarqués dans la distribution **Kali Linux**.

Nikto vérifie les versions obsolètes des logiciels de serveur web, les erreurs de configuration du serveur et les éventuelles vulnérabilités qu'elles pourraient avoir introduites. **Wikto** est la version de Nikto pour Windows.

## Fonctionnalités de Nikto
Nikto vérifie des failles de sécurité liées à des configurations manquantes ou incorrectes dans les **en-têtes HTTP**, essentiels pour la sécurité et la confidentialité de ton site web. Ces en-têtes ont pour objectif de :

- **Protéger contre les attaques** (comme Man-in-the-Middle) en forçant l'utilisation de **HTTPS** (HSTS) et en contrôlant les informations envoyées à des tiers (Referrer-Policy).
- **Empêcher l'exécution de contenu malveillant**, comme du JavaScript non autorisé, grâce à des mécanismes comme le **Content-Security-Policy** et le **X-Content-Type-Options**.
- **Limiter l'accès aux fonctionnalités sensibles** du navigateur (comme la caméra ou la géolocalisation) via **Permissions-Policy**.
- **Renforcer la confidentialité et la sécurité des données des utilisateurs** en contrôlant ce qui peut être partagé ou exécuté, ce qui réduit les risques d'attaques.

## En Résumé
Ces en-têtes sont conçus pour :
- Bloquer des attaques courantes
- Protéger la vie privée des utilisateurs
- Assurer que ton site fonctionne dans un environnement sécurisé.

----

# PSScriptAnalyzer

**PSScriptAnalyzer** est un outil d'analyse statique pour les scripts PowerShell. Il analyse ton code pour détecter les problèmes potentiels, comme les mauvaises pratiques, les erreurs de syntaxe et les incohérences de style. Cela t’aide à améliorer la qualité de tes scripts en respectant les bonnes pratiques de PowerShell.

L'utilisation de Write-Host est souvent déconseillée parce qu'elle ne permet pas de rediriger ou de capturer la sortie, ce qui peut être problématique dans des environnements automatisés ou des processus de gestion des logs. Write-Output est plus flexible et permet de mieux gérer les informations de sortie de ton script, ce qui est plus adapté à des scénarios variés et professionnels.

Si tu as besoin de faire des logs ou de rediriger la sortie ailleurs, utilise Write-Output au lieu de Write-Host.

---

# Lynis - Outil d'Audit de Sécurité

Lynis est un outil d’audit de sécurité open-source pour les systèmes Unix et dérivés, tel que Linux, macOS, FreeBSD, etc. Il aide à analyser et renforcer la sécurité des systèmes en vérifiant leur configuration et en identifiant les vulnérabilités.

## Fonctionnalités principales

- **Utilisateurs et groupes** : Vérification des comptes inactifs, des privilèges et des mots de passe faibles.
- **Services et processus** : Analyse des services en cours et leur configuration de sécurité.
- **Noyau** : Vérification des paramètres du noyau pour détecter des configurations vulnérables.
- **Permissions** : Vérification des permissions des fichiers critiques.
- **Logs** : Contrôle de la sécurité et de la gestion des fichiers journaux.
- **Applications et logiciels** : Recherche de logiciels obsolètes ou vulnérables.
- **Chiffrement** : Vérification des configurations de chiffrement (SSL/TLS, disque).
- **Sécurité réseau** : Analyse des ports ouverts et des règles de pare-feu.
- **Politiques de sécurité** : Vérification de la conformité avec les politiques de sécurité de base.

## Rapport généré

Lynis produit un rapport détaillé avec :

- **Score de sécurité** : Évalue la sécurité globale du système.
- **Recommandations** : Conseils pour améliorer la sécurité.
- **Vulnérabilités** : Liste des failles de sécurité détectées.

Conclusion
Lynis est un outil puissant pour l’audit et le durcissement de la sécurité des systèmes Unix, aidant les administrateurs à identifier et corriger les vulnérabilités.
