#!/bin/bash

# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Aucune couleur

# Boucle while true pour faire un menu sur les informations systèmes
while true; do
    echo -e "\n${GREEN}------ MENU INFORMATION SYSTEME HARDWARE ------\n"
    echo -e "${CYAN}[1]${NC} Type de CPU, nombre de coeurs, etc.."
    echo -e "${CYAN}[2]${NC} Mémoire RAM totale"
    echo -e "${CYAN}[3]${NC} Utilisation de la RAM"
    echo -e "${CYAN}[4]${NC} Utilisation du disque"
    echo -e "${CYAN}[5]${NC} Utilisation du processeur "
    echo -e "${CYAN}[6]${NC} Retour au menu principal\n"
    read -p "Veuillez choisir une option : " choix
    
    # Case pour faire un bloc avec les choix correspondants au menu 
    case $choix in

       # Type de CPU, nombres de coeurs, etc..
       1)
            echo ""
            inxi -C
            echo ""
            ;;

        # Mémoire totale de la RAM
        2)
            echo ""
            totalRam=$(free -b | grep Mem | awk '{printf "%.1f Go\n", $2 / (1024^3)}')
            echo "La mémoire totale de la RAM est de $totalRam"
            ;;

        # Utilisation de la RAM
        3)
            echo ""
            free -h
            echo ""
            ;;
            
        # Utilisation du disque
        4)
            echo ""
            df -h
            echo ""
            ;;
            
        # Utilisation du processeur
        5)
            echo ""
            htop
            echo ""
            ;;
            
        # Retour au menu principal
        6)
            break
            ;;

        # Inique si erreur de saisie et relance le script
        *)
            echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}\n"
            ;;
    esac
done 
# Fin du script
