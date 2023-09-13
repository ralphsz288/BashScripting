# 2. Folosind script-ul de la punctul 1, modificati optiunea EX2 astfel incat sa rezolve urmatoarea problema:
# Se citeste de la tastatura numele a trei fisiere file1, file2, file3. 
# Fisierul file1 poate contine cuvinte ce sunt delimitate de caracterele "<" ">".
# Sa se salveze in fisierul file2 toate cuvintele marcate intre "<" si ">".
# Sa se salveze in fisierul file3 toate cuvintele care nu sunt marcate intre "<" si ">".
# Se va verifica existenta fisierelor si drepturile acestora.

echo Introduceti calea catre un fisier:
read file1
clear
if [[ ! -f $file1 ]] || [[ ! -w $file1 ]] || [[ ! -r $file1 ]]
then
echo "FIsier inexistent sau permisiuni incorecte"
exit 1
fi

echo Introduceti calea catre un fisier:
read file2
clear
if [[ ! -f $file2 ]] || [[ ! -w $file2 ]] || [[ ! -r $file2 ]]
then
echo "FIsier inexistent sau permisiuni incorecte"
exit 2
fi

echo Introduceti calea catre un fisier:
read file3
clear
if [[ ! -f $file3 ]] || [[ ! -w $file3 ]] || [[ ! -r $file3 ]]
then
echo "FIsier inexistent sau permisiuni incorecte"
exit 3
fi

grep '<*>' $file1 > $file2
grep -v '<*>' $file1 > $file3