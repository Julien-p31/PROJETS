# Calcul d’Adresses IPv4, IPv6 et CIDR

## Adresses IPv4

Une adresse IPv4 est composée de 4 octets (32 bits) et est généralement représentée sous forme décimale (ex. : `192.168.1.1`).

### Calcul du Masque de Sous-Réseau (CIDR)

- **CIDR (Classless Inter-Domain Routing)** : Notation pour définir le nombre de bits utilisés dans le masque de sous-réseau (ex : `/24` pour un masque de 255.255.255.0).
- La notation CIDR représente la longueur du préfixe, ou le nombre de bits à 1 dans le masque de sous-réseau.
  
| CIDR | Masque de sous-réseau     | Nombre d’adresses IP | Commentaires |
|------|----------------------------|-----------------------|--------------|
| /8   | 255.0.0.0                  | 16 777 216           | Classe A     |
| /16  | 255.255.0.0                | 65 536               | Classe B     |
| /24  | 255.255.255.0              | 256                  | Classe C     |
| /32  | 255.255.255.255            | 1                    | Adresse unique |

### Calcul des Adresses de Sous-Réseau

1. **Adresse de Réseau** : Première adresse du sous-réseau, identifiant le réseau (tous les bits d'hôte à 0).
2. **Adresse de Diffusion (Broadcast)** : Dernière adresse, identifiant toutes les machines du sous-réseau (tous les bits d'hôte à 1).
3. **Adresses Utilisables** : Adresses entre l’adresse de réseau et l’adresse de diffusion.

**Exemple pour une adresse `192.168.1.0/24`** :
- Masque de sous-réseau : `255.255.255.0`
- Adresse de réseau : `192.168.1.0`
- Adresse de diffusion : `192.168.1.255`
- Adresses utilisables : `192.168.1.1` à `192.168.1.254`

### Calcul du Nombre d’Hôtes

Le nombre d’hôtes possibles dans un sous-réseau est :  
- \( 2^{(32 - \text{CIDR})} - 2 \)
  
Exemple pour `/24` :
- \( 2^{(32 - 24)} - 2 = 254 \) adresses utilisables.

## Adresses IPv6

Une adresse IPv6 est composée de 128 bits, souvent représentée en hexadécimal (ex. : `2001:0db8:85a3:0000:0000:8a2e:0370:7334`).

### Notation CIDR en IPv6

Le CIDR pour IPv6 fonctionne de la même manière que pour IPv4 :
- Exemple : `2001:db8::/64`
  - Cela signifie que les 64 premiers bits identifient le réseau, les 64 suivants les hôtes.
  
### Format d'Adresse IPv6

1. **Parties d'une adresse IPv6** :
   - **Préfixe Global** : Identifie le fournisseur et la région (`2001:db8` dans l'exemple).
   - **ID de Sous-Réseau** : Identifie un sous-réseau spécifique.
   - **ID d'Interface** : Identifie l'interface d'un hôte.

2. **Exemple de Calcul d'un Sous-Réseau IPv6** :
   - Adresse de base : `2001:0db8:85a3::/64`
   - Sous-réseau : `2001:0db8:85a3:0001::/64` pour le sous-réseau suivant.
  
3. **Abbréviations** :
   - Les zéros consécutifs peuvent être omis : `2001:0db8:0000:0000:0000:0000:0000:0001` devient `2001:db8::1`.

### Calcul du Nombre d’Hôtes en IPv6

Le nombre d’hôtes possibles dans un sous-réseau IPv6 dépend de la taille du préfixe :
- Pour un sous-réseau `/64` : \( 2^{(128 - 64)} = 2^{64} \) adresses.

## Exemples de Calculs avec CIDR

1. **IPv4** : Calculer pour une adresse `192.168.1.0/24`  
   - **Masque** : 255.255.255.0
   - **Nombre d’hôtes** : \( 2^{(32-24)} - 2 = 254 \)

2. **IPv6** : Calculer pour une adresse `2001:db8::/64`  
   - **Nombre d’hôtes** : \( 2^{64} \)
