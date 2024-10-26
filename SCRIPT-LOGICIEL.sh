#!/bin/bash

# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

# Boucle while true
while true; do
    echo -e "${YELLOW}MENU GESTION LOGICIEL :"
    echo -e "${GREEN}1) Installer un logiciel"
    echo -e "${GREEN}2) Désinstaller un logiciel"
    echo -e "${GREEN}3) Quitter"
    echo -e "${YELLOW}Veuillez choisir une option : ${NC}"
    read choix

    case $choix in 
        1)
            echo -e "${GREEN}Entrer le nom du logiciel à installer : ${NC}"
	    read logiciel
            sudo apt install $logiciel -y
            ;;
        2)
            echo -e "${GREEN}Entrer le nom du logiciel à désinstaller : ${NC}"
            read logiciel
            sudo apt remove $logiciel -y
            ;;
        3)
            echo "Exit"
            break
            ;;
        *)
            echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
            ;;
    esac
done 
