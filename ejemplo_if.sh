#!/bin/bash
let N1=12
let N2=13
let NA=-1
let NB=5
Hm="hola"
HM="Hola"
let N3=$(("${N1}+${N2}"))
if [[ Hm == HM ]];
    then
        echo "${Hm} igual a ${HM}"
    else
        echo "${Hm} diferente a ${HM}"
fi
if [[ N1 -lt N2 ]];
    then
        echo "${N1} menor a ${N2}"
    else
        echo "${N2} mayor a ${N1}"
fi
if [[ !(NA+NB -eq 0) ]];
    then
        echo "$((${NA}+${NB}))"
    else
        echo "${NA}+${NB}==0"
fi
echo "Valor de N3 es: ${N3}"
