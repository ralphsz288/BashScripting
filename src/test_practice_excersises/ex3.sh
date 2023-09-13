
# 3. Folosind script-ul de la punctul 2, modificati optiunea EX3 astfel incat sa rezolve urmatoarea problema:
# Sa se afiseze, pentru fiecare fisier citit de la tastatura, 
# numarul de cuvinte care au lungimea mai mare decat un numar K (tot citit de la tastatura).
# Citirea fisierelor se va face pana la intalnirea caracterului "$". Apoi va urma citirea numarului K.
# Se va verifica existenta fisierelor si drepturile acestora.


lista=()

echo "Introduceti un fisier"
echo "Scrie $ pentru a opri citirea"

while read line
do
clear
if [[ $line == "$" ]]
then
echo "Introduceti k:"
read k
break
fi
echo "Introduceti un fisier"
echo "Scrie $ pentru a opri citirea"
if [[ ! -f $line ]] || [[ ! -w $line ]] || [[ ! -r $line ]]
then
echo "FIsier inexistent sau permisiuni incorecte"
exit 1
else
lista+=($line)
fi
done

clear

for i in ${lista[@]}
do
var=$(cat $i)
while read -r line
do
for j in $line
do
if [[ ${#j} -gt $k ]]
then
echo $j : ${#j} caractere
fi
done
done <<< $var
done