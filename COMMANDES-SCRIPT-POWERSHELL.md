# Boucles et Conditions pour Script PowerShell

## Conditions en PowerShell  
**Syntaxe de base des conditions**  
`if (condition) {`  
&nbsp;&nbsp;`# instructions si condition est vraie`  
`} elseif (autre_condition) {`  
&nbsp;&nbsp;`# instructions si autre_condition est vraie`  
`} else {`  
&nbsp;&nbsp;`# instructions si aucune condition n'est vraie`  
`}`  

**Exemples de conditions courantes**  
- `-eq` : égal  
- `-ne` : différent  
- `-lt` : inférieur  
- `-le` : inférieur ou égal  
- `-gt` : supérieur  
- `-ge` : supérieur ou égal  
- `-like` : correspondance de motif avec des caractères génériques  
- `-match` : correspondance de motif avec regex  

## Boucles en PowerShell  
**Boucle For**  
`for ($i = 1; $i -le 5; $i++) {`  
&nbsp;&nbsp;`Write-Output $i`  
`}`  

**Boucle While**  
`while (condition) {`  
&nbsp;&nbsp;`# instructions exécutées tant que condition est vraie`  
`}`  

**Boucle Do While**  
`do {`  
&nbsp;&nbsp;`# instructions exécutées tant que condition est vraie`  
`} while (condition)`  

**Boucle Do Until**  
`do {`  
&nbsp;&nbsp;`# instructions exécutées tant que condition est fausse`  
`} until (condition)`  

**Boucle ForEach avec tableau**  
`$tableau = @("valeur1", "valeur2", "valeur3")`  
`foreach ($element in $tableau) {`  
&nbsp;&nbsp;`Write-Output $element`  
`}`  

**Boucle ForEach-Object avec pipeline**  
`$tableau | ForEach-Object {`  
&nbsp;&nbsp;`Write-Output $_`  
`}`  
