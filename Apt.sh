#!/bin/bash
if [[ "${UID}" -eq 0 ]]
    then
        echo "update && upgrade"
        sudo apt-get -y update
        sudo apt -y update
        sudo apt-get upgrade -y
        sudo apt upgrade -y
        #Check everything is ok, and do cleaning
        echo "Cleaning..."
        sudo apt-get -y autoremove
        sudo apt -y autoremove
	sudo apt-get -y autoremove --purge
        sudo apt-get -y clean
        sudo apt -y clean
        sudo apt-get -y autoclean
        sudo apt-get check
        rm -rf ~/.cache/thumbnails/*
	echo 1 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'
    else
        echo "Root missing"
fi
