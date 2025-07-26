# Tutoriel : Créer un simple outil de craquage de mot de passe (brute‑force)

## 🎯 Objectif  
Développer en quelques heures un script Python qui tente toutes les combinaisons possibles pour retrouver un mot de passe court (jusqu’à 6‑7 caractères).

## 🧠 Mise en situation  
Un pentesteur souhaite démontrer comment un mot de passe faible peut être cassé : imaginons un scénario où un hacker agressif essaie de rentrer dans un formulaire local protégé.

---

## 🛠️ Prérequis
- Python 3.7+ installé sur Linux
- Bibliothèque standard (`itertools`, `hashlib`)
- Terminal avec `sudo` non requis ici
- Durée prévue : 3‑4 h

---

## Étape 1 – Comprendre le brute‑force  
- Méthode : génération exhaustive de toutes les combinaisons possibles  [oai_citation:0‡Lumen Blog](https://blog.lumen.com/what-is-a-brute-force-attack/?utm_source=chatgpt.com).
- Limite : combinatoire explosive (26^6 ≈ 300 M essais).
- Tableau temps est illustré par l’image (ici, 6 caractères : secondes à heures) ().

---

## Étape 2 – Script Python basique

```python
import itertools, string, time

def bruteforce_password(target):
    chars = string.ascii_lowercase + string.digits
    for length in range(1, len(target)+1):
        for attempt in itertools.product(chars, repeat=length):
            attempt = ''.join(attempt)
            if attempt == target:
                return attempt

if __name__ == "__main__":
    pwd = input("Mot de passe à casser (max 6 caractères) : ")
    start = time.time()
    found = bruteforce_password(pwd)
    elapsed = time.time() - start

    if found:
        print(f"✔️ Mot trouvé : {found} en {elapsed:.2f} s")
    else:
        print("❌ Échec, mot non trouvé")

📌 Points à retenir :
	•	itertools.product() génère les combinaisons (chaînage intelligent, sans grosse mémoire).
	•	On limite à la longueur cible pour équilibre.

⸻

Étape 3 – Intégrer un hash SHA‑256 (attaque “offline”)

import hashlib

def sha256(s): return hashlib.sha256(s.encode()).hexdigest()

target_hash = sha256(pwd)
print("Hash cible :", target_hash)

# Remplacer la vérification :
if sha256(attempt) == target_hash:
    return attempt

🧠 Objectif : simuler la récupération d’un hash (e‑mail volé, base de données compromise).  ￼

⸻

Étape 4 – Visualiser la progression (effet de génération)

import sys

# Dans la boucle:
if count % 100000 == 0:
    sys.stdout.write(f"\rEssais : {count}, dernière : {attempt}")
    sys.stdout.flush()

Permet à l’apprenant de visualiser l’effort (double-codage texte/visuel).

⸻

Étape 5 – Optimisation simple (threading)

from concurrent.futures import ThreadPoolExecutor

def try_worker(start_letter):
    for length in range(1, max_len+1):
        for attempt in itertools.product(chars, repeat=length):
            s = start_letter + ''.join(attempt)
            if sha256(s) == target_hash:
                return s

with ThreadPoolExecutor(max_workers=4) as ex:
    futures = [ex.submit(try_worker, c) for c in chars[:4]]
    for f in futures:
        if res := f.result():
            print("→ trouvé :", res)
            ex.shutdown(wait=False)
            break

⚠️ Attention : le partage via threading est basique, juste démonstration.

⸻

🧠 Analogies & pièges
	•	🔑 Clé à essayer une à une : brute‑force vs dictionnaire (liste de mots fréquents)  ￼.
	•	⚠️ Ne jamais utiliser en production sans restrictions : délai, lockout, captcha.
	•	Montée cognitive : commencer sans hash, puis ajouter complexité.

⸻

✅ Quiz
	1.	Pourquoi on limite length à la taille du mot à chercher ?
	2.	Pourquoi l’attaque est “offline” après récupération du hash ?
	3.	Avantages/inconvénients du brute-force vs dictionnaire ?
	4.	Pour quoi utiliser ThreadPoolExecutor ?
	5.	Comment ralentir ou bloquer ce script côté serveur ?

⸻

⚡ Cas d’usage
	•	Démonstration en workshop pour sensibiliser à la faiblesse des mots de passe courts.
	•	Test local de robustesse de mot de passe.
	•	Base pour ajouter dictionnaires ou règles (leet, majuscules…).

⸻

🧩 Étapes suivantes
	•	Ajouter argparse pour passer hash et charset depuis CLI.
	•	Intégrer tqdm pour barres de progression.
	•	Ajouter dictionnaire (common_passwords.txt) pour un hybride brute/dico.

⸻

🎓 Résultat attendu
	•	Script fonctionnel capable de retrouver un mot de passe cible via brute‑force et hash comparatif.
	•	Compréhension claire de la complexité et des limites de cette méthode.

---

📚 Sources :
- Exemple de brute‑force w3resource  [oai_citation:3‡ResearchGate](https://www.researchgate.net/figure/Brute-Force-cracking-6-character-Passwords-on-Tesla-C1060-and-C2050_fig2_261347911?utm_source=chatgpt.com) [oai_citation:4‡Simplilearn.com](https://www.simplilearn.com/tutorials/cyber-security-tutorial/how-to-crack-passwords?utm_source=chatgpt.com)  
- Hash SHA‑256 brute‑force sur LinkedIn  [oai_citation:5‡Simplilearn.com](https://www.simplilearn.com/tutorials/cryptography-tutorial/brute-force-attack?utm_source=chatgpt.com)  
- Comparaison brute vs dictionnaire  [oai_citation:6‡ResearchGate](https://www.researchgate.net/figure/Brute-Force-cracking-6-character-Passwords-on-Tesla-C1060-and-C2050_fig2_261347911?utm_source=chatgpt.com)

---

💡 *Charge cognitive* maîtrisée : d’abord le mot clair, puis le hash, puis le threading.  
📌 *Double codage* (texte + images + progression à chaque étape).  
🎯 *Ancrage émotionnel* : scénario de démonstration en pentest.  
🧩 *Effet génération* : l’apprenant construit chaque morceau du code lui-même.  
