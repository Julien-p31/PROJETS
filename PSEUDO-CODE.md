# MODULE GESTION DE PARE-FEU	
--------------------------------------------------------------------------------

- 1- DEFINITION DES REGLES DE PARE-FEU
- 2- ACTIVATION DU PARE-FEU
- 3- DESACTIVATION DU PARE-FEU

      read -p "Que voulez vous faire ? "
      bloc de choix{
		1- Définir les règles de pare-feu
		2- Activer le pare-feu
		3- Désactiver le pare-feu
		4- Retour


      if [ "Définir les règles de pare-feu" = "choix 1" ] 
      then
	  while
    	bloc création{
        	read -p "Adresse IP source : " IP_SOURCE
        	read -p "Adresse IP destination : " IP_DESTINATION
       		read -p "Port : " PORT
        	read -p "Protocole : " PROTOCOLE
        	read -p "Action (ACCEPT/REFUSE/DROP) : " ACTION

		}
	  if [ ]
		then 
		echo ""
	  else 
		echo ""
	  fi

      elif [ "Activer le pare-feu" = "choix 2" ]:
	  while
	  bloc parefeuactif{
		read -p "Voulez-vous activer le pare-feu ? oui/non" FIREWALLENABLE

	  if [ "$FIREWALLENABLE" = "oui" ]
		then 
		(commande qui active le pare-feu)
		echo "Le pare-feu à bien été activé"
	  else
		echo "Le pare-feu n'a pas été activé"
		Exit 0
	  fi

      elif [ "Désactiver le pare-feu" = "choix 3" ]:
	  while
	  bloc parefeuinactif{
		read -p "Voulez-vous désactiver le pare-feu ? oui/non" FIREWALLDISABLE

	  if [ "$FIREWALLDISABLE" = "oui" ] 
		then
		(commande qui désactive le pare-feu)
		echo "Le pare-feu à bien été désactivé"


      [ choix retour ]
	  echo "menu précédant"
      fi
      }

--------------------------------------------------------------------------------
MODULE GESTION LOGICIEL
--------------------------------------------------------------------------------

- 1- INSTALLATION DE LOGICIEL
- 2- DESINSTALLATION DE LOGICIEL


      read -p "Que voulez vous faire ? "
	  bloc de choix{
		1- Installer un logiciel
		2- Désinstaller un logiciel
		3- Retour

      if [ "Installer un logiciel" = "choix 1" ]
    	then
    	while
    	bloc installationlogiciel{
		read -p "Quel logiciel voulez-vous Installer ? " LOGICIELINSTALL

	  if [ -n "$LOGICIELINSTALL" ]
		then
		(commande qui installe le logiciel)
		echo "Le logiciel $LOGICIELINSTALL a bien été installé"
	  else
		echo "Veuillez saisir un nom de logiciel valide"

      elif [ "Désinstaller un logiciel" = "choix 2" ]
    	then
    	while
    	bloc desinstallationlogiciel{
		read -p "Quel logiciel voulez-vous désinstaller ? " LOGICIELPURGE

    	if [ -n "$LOGICIELPURGE" ]
		then
		(commande qui désinstalle le logiciel)
		echo "$LOGICIELPURGE a bien été désinstaller"
    	else
		echo "Veuillez saisir un nom de logiciel valide"

      else [ Choix retour ]
	  echo "menu précédant"
      fi
      }
 

--------------------------------------------------------------------------------
MODULE EXECUTION SCRIPT MACHINE DISTANTE
--------------------------------------------------------------------------------

- 1- EXECUTION DU SCRIPT SUR LA MACHINE DISTANTE	


      read -p "Que voulez vous faire ? "
	  bloc de choix{
		1- Exécuter le script sur la machine distante
		2- Retour
	 
      if [ "Exécuter le script sur la machine distante" = "choix 1" ]
    	then
      bloc executionscript{
	   read -p "Voulez-vous exécuter le script ? oui/non " SCRIPTDISTANT
		
	  if [ "$SCRIPTDISTANT" = "oui" ]
		then
		echo "Le script a bien été exécuté sur la machine distante"
		(Commande pour exécuter le script)
	  elif [ "$SCRIPTDISTANT" = "non" ]
		then		
		echo "Le script n'a pas été exécuté sur la machine distante"
		exit 0
		
      else [ Choix retour ]
	  echo "menu précédant"
      fi
      }
