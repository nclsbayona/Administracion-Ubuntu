#!/bin/bash
for FILE in $(ls -R | egrep  "[0-9].bin");
    do
        if [[ $(cmp base.bin "${FILE}") ]]
            then
                echo "${FILE}"
        fi
    done
