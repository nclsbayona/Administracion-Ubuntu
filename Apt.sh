#!/bin/bash
if [[ "${UID}" -eq 0 ]]
    then
	printf '\n%s\n' 'Updating and upgrading'
        sudo apt-get -y update
        sudo apt-get upgrade -y
        #Check everything is ok, and do cleaning
	printf '\n%s\n' 'Checking and cleaning'        
        sudo apt-get check
	    sudo apt-get purge -y --auto-remove
	    sudo apt-get -y autoremove --purge
        sudo apt-get -y clean
        sudo apt-get -y autoclean
	printf '\n%s\n' 'Ram-cache and Swap'
        rm -rf ~/.cache/thumbnails/*
	echo 1 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
	else
        echo "Root missing"
fi
