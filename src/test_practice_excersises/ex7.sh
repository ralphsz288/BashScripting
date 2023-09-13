# 7. Sa se creeze un shell script ce primeste ca si argumente o cale de fisier si 2 siruri de caractere ce reprezinta 
# un nume si un prenume. Se va verifica existenta fisierului, in caz contrar se va genera mesaj de eroare.
# Se cere sa se caute in interiorul fisierului toate aparitiile fiecarui caracter din cele 2 argumente 
# si sa se determine numarul respectivelor aparitii. (Daca exista caractere duplicat, se vor considera o singura data, 
# nu se va tine cont de diferenta dintre majuscule si miniscule.
# Ex: ./script_2.sh file Gaz Ana
# Continut fisier file:
# The following are the graphical (non-control) characters defined by
# Output:
# G = 2
# A = 5
# Z = 0
# N = 4

a=$@

if [[ ${#@} != 3 ]]
then
echo Numar gresit de argumente>&2
exit 1
fi
if [[ ! -f $1 ]]
then
echo NU este un fisier valid>&2
exit 2
fi

var=$2
lista=()
var2=$3

#de la linia 18 la 27 adaugam toate caracterele cuvintelor intr o lista
for (( i=0;i<${#var};i++ ))
do
lista+=(${var:$i:1})
done

for (( i=0;i<${#var2};i++ ))
do
lista+=(${var2:$i:1})
done

#de la linia aceasta pana la 45 adaugam toate caracterele listei intr-un fisier ca sa putem #elimina duplicatele,
# dupa ce am schimbat tot 
#fisierul in lowercase ca sa evitam conflictele mai incolo

> helperFileEx7.txt
for i in ${lista[@]}
do
echo $i >> helperFileEx7.txt
done


var=$(tr '[:upper:]' '[:lower:]' < helperFileEx7.txt)
> helperFileEx7.txt
for i in $var
do
echo $i >> helperFileEx7.txt
done
sort -u -o helperFileEx7.txt helperFileEx7.txt

#reinitializam lista cu val din fisierul modificat
lista=()

continutFisier=$(cat helperFileEx7.txt)
while read -r line
do
lista+=($line)
done <<< $continutFisier


for i in ${lista[@]}
do
cuv=$(grep -o $i $1)
var=${#cuv}
#impart nr de cuvinte din var deoarece #cuv recunoaste si spatiile
var=$((var/2 +1))
if [[ $var = 1 ]]
then
var=0
fi
echo $i = $var
done
