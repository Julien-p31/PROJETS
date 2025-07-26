# Tutoriel : Mettre en place un honeypot basique pour détecter les attaquants

## 🎯 Objectif
Déployer un honeypot HTTP interactif en 30 minutes pour observer les tentatives d’attaque sur votre machine.

## 🧠 Scénario d’ancrage émotionnel
Imaginez que vous êtes responsable sécurité dans une startup. Vous suspectez des scans réseau répétés. Plutôt que d'attendre passivement, vous installez un honeypot pour **piéger les attaquants** et comprendre leur méthode.

---

## 🛠️ Prérequis techniques

- OS : Linux (Debian/Ubuntu)
- Accès `sudo`
- Python 3.7+
- Connexion internet

---

## Étape 1 – Préparer votre environnement

```bash
sudo apt update && sudo apt install python3 python3-pip -y
pip3 install cowrie


⸻

Étape 2 – Installer Cowrie, un honeypot SSH/Telnet

# Cloner le dépôt Cowrie
git clone https://github.com/cowrie/cowrie.git
cd cowrie

# Créer un utilisateur dédié (optionnel mais recommandé)
sudo adduser --disabled-password cowrie
sudo chown -R cowrie:cowrie cowrie/

# Activer l'environnement virtuel Python
sudo -u cowrie -H bash
cd cowrie
python3 -m venv cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt


⸻

Étape 3 – Configurer Cowrie

cp etc/cowrie.cfg.dist etc/cowrie.cfg
nano etc/cowrie.cfg

Modifications recommandées :
	•	hostname = myhoneypot
	•	listen_endpoints = tcp:2222:interface=0.0.0.0 (pour éviter le port 22)
	•	auth_class = HoneyPotAuthRandom (pour laisser l’accès ouvert)

⸻

Étape 4 – Lancer le honeypot

bin/cowrie start

Vérification :

ss -tuln | grep 2222
# Vous devez voir un service en écoute sur le port 2222


⸻

🧪 Étape 5 – Test d’attaque manuelle (depuis un autre terminal)

ssh -p 2222 root@localhost
# Mettez n'importe quel mot de passe, il sera accepté

Vous verrez :
	•	Une fausse shell
	•	Des commandes apparemment exécutées
	•	Un log complet dans var/log/cowrie

⸻

📁 Étape 6 – Lire les logs d’attaques

tail -f var/log/cowrie/cowrie.log

Fichiers importants :
	•	cowrie.json: format structuré pour ingestion SIEM
	•	tty/: enregistrements en mode « keylogger »

⸻

🖼️ Illustration du flux Honeypot


⸻

🧠 Pièges à éviter
	•	Ne jamais exposer un honeypot sur une machine de production
	•	Rediriger le port 22 vers 2222 avec iptables si nécessaire
	•	Protéger les logs (certains attaquants essaient de les effacer)

⸻

💡 Cas d’usage concrets
	•	Capturer les mots de passe les plus testés
	•	Observer les commandes automatisées des bots
	•	Générer des alertes via un script de parsing

⸻

📊 Bonus : visualiser les attaques avec Kippo-Graph (optionnel)

# Kippo-Graph fonctionne aussi avec les logs de Cowrie
# https://github.com/ikoniaris/kippo-graph


⸻

🧠 Quiz de consolidation
	1.	Pourquoi utiliser le port 2222 au lieu de 22 ?
	2.	Que contient le fichier cowrie.json ?
	3.	Quelle est la différence entre un honeypot de basse et haute interaction ?
	4.	Quel est le risque principal si on ne segmente pas le réseau d’un honeypot ?
	5.	Que faire si l’attaquant lance un scan massif depuis le honeypot ?

⸻

🔄 Étape de nettoyage (si besoin)

cd cowrie
bin/cowrie stop
cd ..
sudo rm -rf cowrie
sudo deluser cowrie


⸻

✅ Résultat attendu
	•	Honeypot opérationnel sur :2222
	•	Logs d’attaques SSH/Telnet
	•	Compréhension des vecteurs d’attaque utilisés par des bots ou humains

