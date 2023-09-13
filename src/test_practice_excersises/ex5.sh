# 5.Folosind script-ul de la punctul 4, modificati optiunea EX5 astfel incat sa rezolve urmatoarea problema:
# Gasiti suma tuturor numerelor formate din 5 cifre (de la 10000 pana la 99999) ce contin exact 2 cifre dintr-un set de 
# cifre citit de la tastatura. 
# Citirea cifrelor se va face pana la intalnirea caracterului ".".
# Daca exista cifre ce se repeta in interiorul aceluiasi numar, vor fi luate in considerare doar o singura data pentru 
# fiecare aparitie.
# Validarea datelor de intrare presupune asigurarea:
# -existentei a cel putin unei valori ce reprezinta o cifra (interval 0 - 9)
# -unicitatii fiecarei cifre (va fi luata in considerare doar prima cifra cu o anumita valoare).

lista=()
re='[0-9]'
while read a
do
if [[ $a == $re ]] 
then
if [[ ! $lista[*] =~ $a ]]
then
lista+=($a)
fi
elif [[ $a == "." ]]
then
break
else
echo Input gresit >&2
exit 1
fi
done


for((i=10000;i<=99999;i++))
do
c=0
for j in ${lista[@]}
do
expr=$(echo $i | grep $j)
if [[ ${#expr} != 0 ]]
then
((c++))
fi
if [[ $c -gt 2 ]]
then
break
fi
done
if [[ $c -eq 2 ]] && [[ ${#expr} != 0 ]]
then
echo $expr
fi
done