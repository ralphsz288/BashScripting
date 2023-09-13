# Scrieti un script test.sh ce primeste 3 argumente la executie:
# Printeaza continutul primului argument intr-un fisier numit f1
# Printeaza ultimele 10 caractere din primele 5 randuri aflate in continutul argumentul 2 intr-un fisier numit f2.
# Printeaza
# concaterea fisierelor f1 si f2 si numarul de linii si de caractere
# intr-un fisier numit f3.Erorile ce pot aparea vor fi redirectate in
# fisierele respective.


#a
touch f1.txt
> f1.txt
echo "$1" > f1.txt

#b
touch f2.txt
> f2.txt
argument2=$2
if [[ -f $2 ]];
then
var=$(cat $2)
i=0
while read line;
do
if [ $i -ne 5 ]; then
((i++))
linie=${line: -10}
#echo $linie
echo -n $linie >> f2.txt
echo >>f2.txt
else
break
fi
done <<< $var
else
echo $2 nu ii fisier
fi

touch f3.txt
> f3.txt

#c
j=0
car=0
cat f1.txt f2.txt > f3.txt
fisier3=$(cat f3.txt)
while read line;
do
((j++))
echo $line
car=$[car+${#line}]
done <<< $fisier3
echo -n $j >> f3.txt
echo >> f3.txt
echo -n $car >> f3.txt