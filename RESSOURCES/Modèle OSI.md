# 🌐 Le modèle OSI expliqué simplement

Le modèle OSI (**Open Systems Interconnection**) est un **modèle en 7 couches** qui explique comment les données circulent dans un réseau. Il sert de **référence** pour comprendre le fonctionnement des communications réseau.

---

## 🏗 **Les 7 couches du modèle OSI**
On va descendre du plus **abstrait** (logiciel) au plus **concret** (matériel).

### **7️⃣ Couche Application (Utilisateur)**
📌 **Rôle** : Interface avec l’utilisateur, permet aux applications de communiquer entre elles via le réseau.

- **Protocoles** : HTTP, HTTPS, FTP, SMTP (mail), POP3, IMAP, DNS  
- **Équipements** : Ordinateur, smartphone, serveur web  

---

### **6️⃣ Couche Présentation (Format des données)**
📌 **Rôle** : Convertit les données pour qu’elles soient compréhensibles par l’application (codage/décodage, chiffrement/déchiffrement, compression/décompression).

- **Protocoles** : SSL/TLS (chiffrement), JPEG, MP3, ASCII, Unicode  
- **Équipements** : Logiciels (navigateur, lecteur vidéo)  

---

### **5️⃣ Couche Session (Gestion des connexions)**
📌 **Rôle** : Établit, maintient et termine une session de communication entre deux machines.

- **Protocoles** : NetBIOS, RPC, PAP  
- **Équipements** : Serveurs d’application  

---

### **4️⃣ Couche Transport (Fiabilité des données)**
📌 **Rôle** : Assure le **transport des données** entre deux machines en gérant les erreurs, la segmentation et le contrôle de flux.

- **Protocoles** :  
  - **TCP** : Fiable, contrôle des erreurs, utilise l'ACK (ex: navigation web, email)  
  - **UDP** : Rapide mais pas de vérification d’erreur (ex: streaming, VoIP, jeux vidéo)  
- **Équipements** : Routeurs, pare-feu  

---

### **3️⃣ Couche Réseau (Adressage & Routage)**
📌 **Rôle** : Gère l’adressage IP et le routage des paquets d’un point A à un point B.

- **Protocoles** : IP (IPv4, IPv6), ICMP (ping), RIP, OSPF, BGP  
- **Équipements** : Routeurs  

---

### **2️⃣ Couche Liaison de Données (Communication locale)**
📌 **Rôle** : Permet la transmission des données sur un **réseau local** (LAN), détecte et corrige certaines erreurs.

- **Sous-couches** :
  - **LLC** (gestion des flux)
  - **MAC** (adressage physique avec adresse MAC)
- **Protocoles** : Ethernet, Wi-Fi (802.11), PPP  
- **Équipements** : Switch, carte réseau, pont (bridge)  

---

### **1️⃣ Couche Physique (Matériel)**
📌 **Rôle** : Transmet les **bits** sous forme de signal électrique, optique ou radio.

- **Moyens de transmission** : Câbles Ethernet, fibre optique, Wi-Fi, Bluetooth  
- **Équipements** : Câbles, prises RJ45, répéteurs, hubs  

---

## 🧠 **Astuces pour mémoriser facilement**  

### **Phrase mnémotechnique (de la couche 1 à 7) :**
- **"Petit Lapin Roux Transporte Ses Petites Affaires"**  
  (**Physique, Liaison, Réseau, Transport, Session, Présentation, Application**)  

---

## 🎯 **Exemple concret (Chargement d’une page web)**

1. **Physique** : Le signal passe par le câble ou le Wi-Fi 📡  
2. **Liaison** : La carte réseau échange les trames Ethernet 🔌  
3. **Réseau** : Les paquets IP sont envoyés au serveur 🌍  
4. **Transport** : TCP assure que tous les paquets arrivent 📨  
5. **Session** : Une connexion HTTP est ouverte 🌐  
6. **Présentation** : Le texte HTML est interprété par le navigateur 🖥️  
7. **Application** : La page s’affiche 🎉  

