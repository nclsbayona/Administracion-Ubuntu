#!/bin/bash
let total=0
for NUMERO in $(cat Numeros.txt);
    do
        echo $total $NUMERO
        let total=$(($total+$NUMERO))
    done
echo $total
