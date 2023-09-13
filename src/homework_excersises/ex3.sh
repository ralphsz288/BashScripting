# Sa se creeze un shell script ce primeste ca si argumente o cale de director si 1 sir de caractere.
# Se va verifica existenta folderului, in caz contrar se va genera mesaj de eroare
# Se cere sa se caute in interiorul folderului toate fisierele ce contin cel putin una dintre literele sirului de caractere.

folder=$1
var=$@

if [[ $# -lt 2 ]]
then
echo "Prea putine argumente" >&2
exit 1
fi

if [[ -d $1 ]]
then
array=('cevaaa')	#setam o valoare in array ca sa functioneze array[-1] la primul pas
for d in $1/*
do
for i in $@
do
val=$(grep -l $i $d)
if [[ $val != ${array[-1]} ]]	   #evitam sa adaugam duplicate in array
then
array+=($val)
fi
done
done

unset array[0]
for i in ${array[@]}
do
echo $i
done

else
echo "Primul argument nu este un director" >&2
exit 1
fi
