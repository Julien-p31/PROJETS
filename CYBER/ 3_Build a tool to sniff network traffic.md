# Tutoriel : Construire un outil simple de sniffing de trafic réseau

## 🎯 Objectif  
Créer un sniffer Python avec Scapy pour capturer et analyser les paquets réseau en direct (offline ou en live) sur Linux.

## 🧠 Scénario d'attaque plausible  
Vous êtes analyste SOC et vous détectez du trafic suspect sur l’interface réseau. Plutôt que d’être juste alerté, vous installez un sniffer pour **capturer les paquets et comprendre l’activité malveillante**, étape par étape.

---

## 🛠️ Prérequis  
- Linux (Debian/Ubuntu) + Python 3.7+  
- `sudo` (pour capture réseau)  
- `pip3 install scapy colorama`  
- Wireshark ou tcpdump toujours utiles

---

## Étape 1 – Installation & import

```bash
sudo apt update
sudo apt install python3-pip
pip3 install scapy colorama

💡 Importez dans sniffer.py :

from scapy.all import sniff, PcapReader
from scapy.layers.http import HTTPRequest
from colorama import init, Fore
import argparse, time


⸻

Étape 2 – Sniffer live

def live_sniff(iface=None, count=0, bpf=None):
    sniff(iface=iface, filter=bpf, prn=process_pkt, store=False, count=count)

Explications :
	•	iface : interface (ex. wlan0 ou eth0)
	•	filter : syntaxe BPF ("ip", "tcp", "port 80")  ￼ ￼ ￼ ￼
	•	prn : callback pour chaque paquet
	•	store=False : pas de stockage en mémoire  ￼

⸻

Étape 3 – Traitement des paquets et affichage (double codage)

init()
GREEN, RED, RESET = Fore.GREEN, Fore.RED, Fore.RESET

def process_pkt(pkt):
    now = time.strftime("%H:%M:%S")
    line = f"{GREEN}[{now}] {pkt.summary()}{RESET}"
    print(line)
    if pkt.haslayer(HTTPRequest):
        ip = pkt[HTTPRequest].Host.decode() + pkt[HTTPRequest].Path.decode()
        method = pkt[HTTPRequest].Method.decode()
        print(f"{RED}[HTTP] {pkt[HTTPRequest].Method.decode()} → http://{ip}{RESET}")

➡️ Exemple : résumé + coloration des lignes HTTP

⸻

Étape 4 – Lecture d’un fichier pcap

def offline_sniff(pcap_file):
    for pkt in PcapReader(pcap_file):
        process_pkt(pkt)

Utile pour analyser du traffic déjà capturé  ￼ ￼

⸻

Étape 5 – Mode asynchrone (facultatif)

from scapy.all import AsyncSniffer

def async_sniff():
    t = AsyncSniffer(iface='eth0', filter='ip', prn=process_pkt, store=False)
    t.start()
    time.sleep(30)
    t.stop()
    print(f"Sniffing done, {len(t.results)} paquets capturés")

Permet démarrer/arrêter par code, utile en automation  ￼

⸻

🧠 Analogies & pièges
	•	🪜 Chaque paquet = lettre d’un message censé être privé
	•	⚠️ Si interface sans surveillance, pas de capture — vérifiez ifconfig
	•	🔒 Ne jamais laisser tourner en production sans contrôle
	•	🧩 Filtrer tôt pour limiter la charge : filter="ip", pas sniff() nu

⸻

🧪 Quiz de consolidation
	1.	Quel rôle joue store=False ?
	2.	Pourquoi utiliser BPF plutôt que capturer tout ?
	3.	Comment détecter uniquement HTTP GET avec Scapy ?
	4.	À quoi sert AsyncSniffer dans un script automatisé ?
	5.	Pourquoi ajouter time.strftime() quand on affiche un paquet ?

⸻

✅ Cas d’usage
	•	Diagnostic live d’une activité suspecte
	•	Détection automatique sur un segment via script
	•	Analyse offline avec export .pcap vers Wireshark

⸻

🔧 Extensions possibles
	•	Ajouter argparse pour options CLI (iface, filter, count)
	•	Enrichir avec export CSV ou base SQLite
	•	Surveiller des flux spécifiques (ARP, DNS, FTP…)
	•	Ajouter détection d’anomalies ou machine learning léger

⸻

🎓 Attendu
	•	Sniffer fonctionnel en ligne de commande
	•	Captures affichées en direct avec résumés lisibles
	•	Hooks HTTP, sauvegarde pcap, mode offline activable

---

### 🔎 Sources & inspirations  
- Sniff BPF, filtre interface, résumé paquet  [oai_citation:8‡thepacketgeek.com](https://thepacketgeek.com/scapy/sniffing-custom-actions/part-1/?utm_source=chatgpt.com) [oai_citation:9‡GeeksforGeeks](https://www.geeksforgeeks.org/python/packet-sniffing-using-scapy/?utm_source=chatgpt.com) [oai_citation:10‡thepythoncode.com](https://thepythoncode.com/article/sniff-http-packets-scapy-python?utm_source=chatgpt.com) [oai_citation:11‡peerdh.com](https://peerdh.com/blogs/programming-insights/implementing-network-packet-sniffing-with-python-and-scapy?utm_source=chatgpt.com) [oai_citation:12‡Scapy](https://scapy.readthedocs.io/en/latest/usage.html?utm_source=chatgpt.com)  
- Mode asynchrone via AsyncSniffer ()  
- Traitement spécifique HTTP + coloration ()

---
