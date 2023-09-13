# 9.  Scrieți un script care așteaptă un fișier ca prim argument. 
# Unele linii ale fișierului vor fi formate din patru grupuri de numere de 4 cifre, 
# separate de spațiul alb (whitespace = space/tab).
# Scriptul va selecta doar liniile care corespund criteriilor anterioare, 
# iar apoi va schimba ordinea câmpurilor astfel încât grupurile 1 și 3, 
# precum și 2 și 4 să fie interschimbate; spațiul alb va fi eliminat, 
# iar apoi doar aceste randuri modificate vor fi scrise la stdout. 
# Exemplu de fișier:
# 1234 5678 9012 3456
# 111 2222 33345 888888
# roses are red
# 6666 9999 5555 7777
# <End-of-file>
# Exemplu de ieșire:
# 9012345612345678
# 5555777766669999
# Scriptul va face verificarea erorilor de bază (numărul corect de argumente, fișierul poate fi citit etc.) 
# înainte de procesarea propriu-zisa.

if [[ $# -ne 1 ]]
then
echo "Numar gresit de argumente" >&2
exit 1
fi

if [[ ! -f $1 ]] || [[ ! -r $1 ]]
then
echo "Fisierul nu exista sau nu este citibil" >&2
exit 1
fi

pattern=$(grep -Eo '[0-9]{4}[[:space:]][0-9]{4}[[:space:]][0-9]{4}[[:space:]][0-9]{4}' $1)
var=''

for i in $pattern
do
var=$var$i
done

#echo $pattern
#echo $var

lista=()
n=${#var}
nrSecvente=$(($n/16))
for ((i=0;i<$nrSecvente;i++))
do
val=$((16*i))
lista+=(${var:$val:16})
done

for i in ${lista[@]}
do
echo ${i:8:8}${i:0:8}
done