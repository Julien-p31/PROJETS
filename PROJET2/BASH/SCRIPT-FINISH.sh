#!/bin/bash

# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

# Mot de passe pour la connexion SSH
PASSWORD="Azerty1*"

# Fonction pour la gestion de pare-feu
function gestion_pare_feu() {
    while true; do
        echo -e "${GREEN}------ MENU GESTION PARE-FEU ------\n"
        echo -e "${GREEN}[1]${NC} Définir les règles de pare-feu"
        echo -e "${GREEN}[2]${NC} Activer le pare-feu"
        echo -e "${GREEN}[3]${NC} Désactiver le pare-feu"
        echo -e "${GREEN}[4]${NC} Retour au menu principal"
        echo -e "${GREEN}Veuillez choisir une option : ${NC}"
        read choix

        case $choix in 
            1)
                # Sous-menu pour les règles de pare-feu
                while true; do
                    echo -e "${GREEN}------ MENU DES RÈGLES PARE-FEU ------\n"
                    echo -e "${GREEN}[1]${NC} Ajouter une règle"
                    echo -e "${GREEN}[2]${NC} Supprimer une règle"
                    echo -e "${GREEN}[3]${NC} Afficher les règles actuelles"
                    echo -e "${GREEN}[4]${NC} Retour au menu précédent"
                    echo -e "${GREEN}Veuillez choisir une option : ${NC}"
                    read choix_regles

                    case $choix_regles in
                        1)
                            echo -e "${GREEN}Entrer la règle à ajouter (ex: allow 22/tcp) : ${NC}"
                            read regle
                            sudo ufw $regle
                            echo -e "${GREEN}Règle ajoutée : $regle${NC}"
                            ;;
                        2)
                            echo -e "${GREEN}Entrer la règle à supprimer (ex: allow 22/tcp) : ${NC}"
                            read regle
                            sudo ufw delete $regle
                            echo -e "${GREEN}Règle supprimée : $regle${NC}"
                            ;;
                        3)
                            echo -e "${GREEN}Règles de pare-feu actuelles :${NC}"
                            sudo ufw status
                            ;;
                        4)
                            echo -e "${YELLOW}Retour au menu principal.${NC}"
                            break
                            ;;
                        *)
                            echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
                            ;;
                    esac
                done
                ;;
        
         # Activation du pare-feu          
           2)
	       # Bloc pour activer le pare-feu
               echo -e "${GREEN}Voulez-vous activer le pare-feu ? : oui/non ${NC}"
               read oui

                # Tant que l'entrée n'est pas "oui" ou "non", on redemande une saisie valide
                while [[ "$oui" != "oui" && "$oui" != "non" ]]; do
                      echo -e "${RED}[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'.${NC}"
                      read -p "Entrer votre choix : " oui
                done

                if [ "$oui" = "oui" ]; then
                   sudo ufw enable
                   echo "Le pare-feu a bien été activé."
                else
                    echo "Le pare-feu n'a pas été activé."
                fi
                ;; 
            3)
	        # Bloc pour désactiver le pare-feu
                echo -e "${GREEN}Voulez-vous désactiver le pare-feu ? : oui/non ${NC}"
                read oui

                # Tant que l'entrée n'est pas "oui" ou "non", on redemande une saisie valide
                while [[ "$oui" != "oui" && "$oui" != "non" ]]; do
                      echo -e "${RED}[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'.${NC}"
                      read - p "Entrer votre choix : " oui
                done

                if [ "$oui" = "oui" ]; then
                   sudo ufw disable
                   echo "Le pare-feu a bien été désactivé."
                else
                    echo "Le pare-feu n'a pas été désactivé."
                fi
                ;;
            4)
                echo -e "${YELLOW}Retour au menu principal.${NC}"
                break
                ;;
            *)
                echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
                ;;
        esac
    done
}

# Fonction pour la gestion de logiciel
function gestion_logiciel() {
    while true; do
        echo -e "${GREEN}------ MENU GESTION LOGICIEL ------\n"
        echo -e "${GREEN}[1]${NC} Installer un logiciel"
        echo -e "${GREEN}[2]${NC} Désinstaller un logiciel"
        echo -e "${GREEN}[3]${NC} Retour au menu principal"
        echo -e "${GREEN}Veuillez choisir une option : ${NC}"
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
                echo -e "${YELLOW}Retour au menu principal.${NC}"
                break
                ;;
            *)
                echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
                ;;
        esac
    done
}

# Fonction pour les informations système
function information_systeme() {
    while true; do
        echo -e "${GREEN}------ MENU INFORMATION SYSTEME ------\n"
        echo -e "${GREEN}[1]${NC} Type de CPU, nombre de coeurs, etc.."
        echo -e "${GREEN}[2]${NC} Mémoire RAM totale"
        echo -e "${GREEN}[3]${NC} Utilisation de la RAM"
        echo -e "${GREEN}[4]${NC} Utilisation du disque"
        echo -e "${GREEN}[5]${NC} Utilisation du processeur"
        echo -e "${GREEN}[6]${NC} Retour au menu principal"
        echo -e "${GREEN}Veuillez choisir une option : ${NC}"
        read choix

        case $choix in
            1)
                lscpu
                ;;
            2)
                free -h | grep Mem | awk '{print $2}'
                ;;
            3)
                free -h
                ;;
            4)
                df -h
                ;;
            5)
                top
                ;;
            6)
                echo -e "${YELLOW}Retour au menu principal.${NC}"
                break
                ;;
            *)
                echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
                ;;
        esac
    done
}

# Fonction pour la connexion à des clients
function connexion_client() {
    PS3="Sur quel client voulez-vous vous connecter ? "
    options=("Client Ubuntu : 1" "Client Windows 10 Pro : 2" "Retour au menu principal : 3")

    select choix in "${options[@]}"; do
        case $REPLY in
            1)
                echo "Connexion effectuée !"
                sshpass -p "$PASSWORD" ssh wilder@172.16.10.30
                ;;
            2)
                echo "Connexion effectuée !"
                sshpass -p "$PASSWORD" ssh wilder@172.16.10.20
                ;;
            3)
                echo -e "${YELLOW}Retour au menu principal.${NC}"
                break
                ;;
            *)
                echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
                ;;
        esac
    done
}

# Menu principal
while true; do
    echo -e "${GREEN}------ MENU PRINCIPAL ------\n"
    echo -e "${GREEN}[1]${NC} Gestion Pare-Feu"
    echo -e "${GREEN}[2]${NC} Gestion Logiciel"
    echo -e "${GREEN}[3]${NC} Information Système"
    echo -e "${GREEN}[4]${NC} Connexion Client"
    echo -e "${GREEN}[5]${NC} Quitter"
    echo -e "${GREEN}Veuillez choisir une option : ${NC}"
    read main_choix

    case $main_choix in
        1)
            gestion_pare_feu
            ;;
        2)
            gestion_logiciel
            ;;
        3)
            information_systeme
            ;;
        4)
            connexion_client
            ;;
        5)
            echo "${YELLOW}Exit${NC}"
            break
            ;;
        *)
            echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
            ;;
    esac
done
