# 4. Folosind script-ul de la punctul 3, modificati optiunea EX4 astfel incat sa se genereze toate numerele 
# prime dintr-un interval X si Y.
# Numerele prime vor fi salvate intr-un fisier al carui nume va fi citit de la tastatura. X si Y deasemenea, 
# vor fi citite de la tastatura.

echo Introduceti 2 numere si calea catre un fisier:

read a b file
re='^[0-9]+$'

if [[ ! $a =~ $re ]] || [[ ! $b =~ $re ]] || [[ ! -f $file ]]
then
echo Argumente gresite >&2
exit 1
fi

> $file

for i in $(seq $a $b)
do
k=0
for j in $(seq 2 $(expr $i - 1))
do
if [[ $(expr $i % $j) -eq 0 ]]
then
k=1
break
fi
done
if [[ $k -eq 0 ]]
then
echo $i >> $file
fi
done

cat $file