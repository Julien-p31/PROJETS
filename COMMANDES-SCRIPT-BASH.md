# Boucles et Conditions pour Script Bash

## Conditions en Bash  
**Syntaxe de base des conditions**  
`if [ condition ]; then`  
&nbsp;&nbsp;`# instructions si condition est vraie`  
`elif [ autre_condition ]; then`  
&nbsp;&nbsp;`# instructions si autre_condition est vraie`  
`else`  
&nbsp;&nbsp;`# instructions si aucune condition n'est vraie`  
`fi`  

**Exemples de conditions courantes**  
- `-f <fichier>` : Vérifie si un fichier existe.  
- `-d <dossier>` : Vérifie si un dossier existe.  
- `-z <variable>` : Vérifie si la variable est vide.  
- `-n <variable>` : Vérifie si la variable n’est pas vide.  
- Comparaisons numériques :  
&nbsp;&nbsp;- `-lt` : inférieur  
&nbsp;&nbsp;- `-le` : inférieur ou égal  
&nbsp;&nbsp;- `-gt` : supérieur  
&nbsp;&nbsp;- `-ge` : supérieur ou égal  
&nbsp;&nbsp;- `-eq` : égal  
&nbsp;&nbsp;- `-ne` : différent  

## Boucles en Bash  
**Boucle For**  
`for i in {1..5}; do`  
&nbsp;&nbsp;`echo $i`  
`done`  

**Boucle While**  
`while [ condition ]; do`  
&nbsp;&nbsp;`# instructions exécutées tant que condition est vraie`  
`done`  

**Boucle Until**  
`until [ condition ]; do`  
&nbsp;&nbsp;`# instructions exécutées tant que condition est fausse`  
`done`  

**Boucle For avec liste**  
`for element in "valeur1" "valeur2" "valeur3"; do`  
&nbsp;&nbsp;`echo $element`  
`done`  

**Boucle For avec un tableau**  
`tableau=("valeur1" "valeur2" "valeur3")`  
`for element in "${tableau[@]}"; do`  
&nbsp;&nbsp;`echo $element`  
`done`  
