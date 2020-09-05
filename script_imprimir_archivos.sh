#!/bin/bash
for FILE in $(find . -type f | tr ' ' '_');
    do
        cat "${FILE//_/ }"
    done
