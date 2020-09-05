#!/bin/bash
let CUENTA=20
until [  $CUENTA -lt 10 ];
    do
            echo iterador $CUENTA
            let CUENTA-=1
    done

let CUENTA=0
while [ $CUENTA -lt 10 ];
    do
        echo El numero es $CUENTA
        let CUENTA=CUENTA+1 
    done

for i in $(seq 1 10);
    do
        echo $i
    done  

VEGETAL="plátano"

case "$VEGETAL" in
    "manzana")
        echo "Una al día, qué alegría.";;
    "plátano")
        echo "Chí cheñol." ;;
    "zanahoria")
        echo "NO es el día del plátano." ;;
    *)
        echo Eso no se come.;;
esac

echo ingresaste $# argumentos.
let NUMERO=0
for i in $@;
    do
        let NUMERO+=1
        echo Este es el argumento $NUMERO $i
    done

read -ep "Dame un numero: " NUMERO
echo Tecleaste:  $NUMERO
if  [ $NUMERO -lt 5 ];
    then
        echo $NUMERO es menor que 5.
    elif [ $NUMERO -gt 5 ];
        then
            echo $NUMERO es mayor que 5.
    else
        echo El número es 5.
fi
