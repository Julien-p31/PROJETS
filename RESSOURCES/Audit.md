# 📌 Analyse et Corrections des Problèmes Détectés

## 🔹 Image 1 : Analyse de Script PowerShell (`Invoke-ScriptAnalyzer`)
### **Problème détecté :**
- Utilisation de `Write-Host` (mauvaise pratique).
- Problèmes :
  - Non compatible avec tous les environnements.
  - Ne peut pas être capturé, redirigé ou supprimé avant PowerShell 5.0.

### ✅ **Solution recommandée :**
- Remplacer `Write-Host` par :
  - `Write-Output` (redirigeable).
  - `Write-Verbose` (utile pour le débogage).
  - `Write-Information` (gestion des logs).

---

## 🔹 Image 2 : Analyse de Sécurité Web (`Nikto`)
### **Problèmes détectés :**
1. **En-têtes HTTP de sécurité manquants** (`X-Content-Type-Options`, `Strict-Transport-Security`, `Content-Security-Policy`, etc.).
2. **Version Apache obsolète** (`2.4.62`, alors que la dernière version est `2.4.63`).
3. **Méthodes HTTP ouvertes** (`OPTIONS`, `POST`, `HEAD`, `GET`).
4. **9 vulnérabilités signalées** sur l'hôte.

### ✅ **Solutions recommandées :**
- **Configurer les en-têtes HTTP de sécurité** dans Apache :
  ```apache
  Header always set X-Content-Type-Options "nosniff"
  Header always set Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
  Header always set Referrer-Policy "no-referrer"
  Header always set Permissions-Policy "default-src 'none'"
  Header always set Content-Security-Policy "default-src 'self'"
Mettre à jour Apache vers la dernière version (2.4.63 ou plus).
Limiter les méthodes HTTP autorisées :

<LimitExcept GET POST>
  deny from all
</LimitExcept>
Auditer et corriger les autres vulnérabilités détectées.
