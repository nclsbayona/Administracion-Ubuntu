#!/bin/bash
let x=0
for NUM in $(cat random-numbers.txt);
do
    if [[ $NUM == $(factor $NUM | cut -d" " -f2) ]]
    then
        let x=$(($x+1))
        fi
done
echo "${x}"
