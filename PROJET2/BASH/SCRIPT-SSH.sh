#!/bin/bash

PASSWORD="Azerty1*"
PS3="Sur qu'elle client voulez-vous, vous connecter ? "
options=("Client Ubuntu : 1" "Client Windows 10 Pro : 2" "Quitter : 3")

select choix in "${options[@]}"; do
    case $REPLY in
        1)
            echo "Connexion effectué !"
            sshpass -p "$PASSWORD" ssh wilder@172.16.10.30      
           ;;

         2)
            echo "Connexion effectué !"
            sshpass -p "$PASSWORD"  ssh wilder@172.16.10.20
           ;;

          3)
            echo "Exit"
            break
            ;;
        *)
            echo "Option invalide, veuillez réessayer !"
            ;;
    esac
done
