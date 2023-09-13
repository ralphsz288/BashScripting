# 8. Scrieti un script shell ce indeplineste urmatoarele cerinte: 
# a. asteapta un argument pe linia de comanda, in caz contrar afiseaza un mesaj de eroare la stderr si opreste executia
# b. valideaza ca argumentul primit este calea catre un director (folder) existent, 
# in caz contrar afisand un alt mesaj de eroare la stderr si opreste executia
# c. valideaza existenta drepturilor de citire si scriere asupra folder-ului primit ca argument 
# d. verifica existenta si dreptul de citire asupra unui fisier numit `sample.S’ in directorul primit ca argument, 
# in caz contrar afisand un mesaj de eroare la stderr si opreste executia
# e. creeaza o lista cu toate fisierele obisnuite (regular files) din directorul primit ca argument cu 
# extensia ‘.c’ (de ex 01.c, 02.c, orice_text.c etc)
# f. apeleaza executabilul gcc pentru fiecare fisier C gasit in directorul ‘tests’, 
# si genereaza fisier assembler pentru fiecare dintre ele (generarea fisierului assembler se face prin optiunea -S. 
# Pentru `02.c’ se va genera `02.S', pentru `orice_text.c’ se genereaza `orice_text.S').
# ex apel: gcc O2.c -S -o O2.S va genera fisierul assembler O2.S din fisierul c O2.c

arg=$@

if [[ $# -ne 1 ]]
then
echo "Numar gresit de argumente" >&2
exit 1
fi

if [[ ! -d $1 ]] || [[ ! -w $1 ]] || [[ ! -r $1 ]]
then
echo "Fisierul nu exista sau nu este executabil" >&2
exit 1
fi

val=$(find $1 -type f -name "sample.S")
if [[ ${#val} = 0 ]] || [[ ! -r $val ]]
then 
echo sample.S nu exista sau nu are drepturi de citire >&2
fi

val2=$(find $1 -type f -name "*.c")
for i in $val2
do
newFile=${i:0:-2}.S
gcc $i -S -o $newFile
done

val3=$(find $1 -type f -name "*.S")
count=0
for i in $val3
do
a=$(diff $i sample.S)
echo $a
if cmp -s $i sample.S
then
continue
else
((count++))
fi
done

echo $count