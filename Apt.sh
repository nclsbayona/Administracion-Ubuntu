#!/bin/bash
if [[ "${UID}" -eq 0 ]]
    then
        echo "update && upgrade"
        sudo apt-get update
        sudo apt update
        sudo apt-get upgrade -y
        sudo apt upgrade -y
        #Check everything is ok, and do cleaning
        echo "Cleaning..."
        sudo apt-get autoremove
        sudo apt autoremove
	sudo apt-get autoremove --purge
        sudo apt-get clean
        sudo apt clean
        sudo apt-get autoclean
        sudo apt-get check
        rm -rf ~/.cache/thumbnails/*
    else
        echo "Root missing"
fi
