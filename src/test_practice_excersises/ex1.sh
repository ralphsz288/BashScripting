# 1. Scrieti un script bash ce implementeaza un meniu interactiv cu urmatoarea structura:
# 1. EX2
# 2. EX3
# 3. EX4
# 4. EX5
# 5. Iesire

# Pentru fiecare optiune selectarea se va face ori prin numarul optiunii ori prin numele optiunii scris cu majuscule. Orice alta valoare va genera un mesaj specifacand valorile suportate si va reincepe iterarea meniului.
# Dupa selectarea oricarei optiuni (1-4), se va printa un mesaj cu numele optiunii, iar apoi se va genera un mesaj interogand utilizatorul daca doreste reintoarcerea in meniu sau terminarea executiei script-ului.

# Selectand optiunii 5 va termina executia scriptului.

# Exemplu:
# ./script.sh va genera:
# Please select your option:
# 1. EX2
# 2. EX3
# 3. EX4
# 4. EX5
# 5. Iesire

# <<EX2

# EX2 selected
# Do you wish to continue: Y/N?

# <<Y

# Please select your option:
# 1. EX2
# 2. EX3
# 3. EX4
# 4. EX5
# 5. Iesire

# <<4

# EX5 selected
# Do you wish to continue: Y/N?

# <<N

# Hint: Pentru a citi de la tastatura, folositi comanda read.

echo Please select your option:
echo 1.EX2
echo 2.EX3
echo 3.EX4
echo 4.EX5
echo 5.Iesire
read var

if [[ $var == 1 ]]
then
clear
echo EX2 selected
echo Do you wish to continue?
read var2
if [[ $var2 == "Y" || $var2 == "y" ]]
then
clear
./ex2.sh
elif [[ $var2 == "N" || $var2 == "n" ]]
then
clear
./ex1.sh
else
clear
echo Wrong command >&2
fi

elif [[ $var == 2 ]]
then
clear
echo EX3 selected
echo Do you wish to continue?
read var2
if [[ $var2 == "Y" || $var2 == "y" ]]
then
clear
./ex3.sh
elif [[ $var2 == "N" || $var2 == "n" ]]
then
clear
./ex1.sh
else
clear
echo Wrong command >&2
fi

elif [[ $var == 3 ]]
then
clear
echo EX4 selected
echo Do you wish to continue?
read var2
if [[ $var2 == "Y" || $var2 == "y" ]]
then
clear
./ex4.sh
elif [[ $var2 == "N" || $var2 == "n" ]]
then
clear
./ex1.sh
else
clear
echo Wrong command >&2
fi

elif [[ $var == 4 ]]
then
clear
echo EX4 selected
echo Do you wish to continue?
read var2
if [[ $var2 == "Y" || $var2 == "y" ]]
then
clear
./ex5.sh
elif [[ $var2 == "N" || $var2 == "n" ]]
then
clear
./ex1.sh
else
clear
echo Wrong command >&2
fi

elif [[ $var == 5 ]]
then
clear
exit 1
else
clear
echo Invalid input >&2
exit 2
fi