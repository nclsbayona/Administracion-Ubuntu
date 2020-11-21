#!/bin/bash
if [[ $UID = 0 ]]
    then
        #Need username
        USERNAME=$1
        USERD=$(eval echo "~$USERNAME")
        GTKTHEME=$(gtk-launch --version)
        #Gtk theme optimization
        if [[ $GTKTHEME == 3* ]]
            then
                echo "GLOBAL? (Y/N)"
                read GLOBAL
            if [[ "$GLOBAL" == Y ]] || [[  "$GLOBAL" == y ]]
                then
                    GTKFOLDER=/etc/gtk-3.0/settings.ini
            else
                GTKFOLDER=$USERD/.config/gtk-3.0/settings.ini
            fi
        elif [[ $GTKTHEME == 2* ]]
            then
                GTKFOLDER=$USERD/.gtkrc-2.0
        fi
        #Necesarios
	    SYSCTLFOLDER=/etc/sysctl.conf
        SALIDAS=/dev/null
	    FSTABFILE=/etc/fstab
        #Solo para probar
	    GTKFOLDER=$USERD/Desktop/Pruebas/gtk.txt
        SYSCTLFOLDER=$USERD/Desktop/Pruebas/sysctl.txt
	    FSTABFILE=$USERD/Desktop/Pruebas/fstab.txt
        echo -e "gtk-menu-popup-delay = 0\ngtk-menu-popdown-delay = 0\ngtk-menu-bar-popup-delay = 0\ngtk-enable-animations = 0\ngtk-timeout-expand = 0\ngtk-timeout-initial = 0\ngtk-timeout-repeat = 0\ngtk-enable-event-sounds=1\ngtk-enable-input-feedback-sounds=1\ngtk-xft-antialias=1">$GTKFOLDER 
        echo -e "vm.swappiness=1\nvm.vfs_cache_pressure=50\nvm.dirty_writeback_centisecs=1500\nvm.dirty_expire_centisecs=4500\nvm.dirty_ratio=30\nvm.dirty_background_ratio=15" > $SYSCTLFOLDER
        sudo apt -qq update
        sudo apt -qqy install preload 
        echo -e "tmpfs /tmp tmpfs noatime,nodiratime,nodev,nosuid,mode=1777,defaults 0 0\ntmpfs /var/tmp tmpfs noatime,nodiratime,nodev,nosuid,mode=1777,defaults 0 0" > $FSTABFILE
        echo "Cambie el timeout a 5 y GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash noresume\"" 
        sleep 10s
        nano /etc/default/grub
        sleep 15s
        sudo update-grub
        sudo apt -qq install git
        git clone https://github.com/foundObjects/zram-swap.git
        cd zram-swap
        sudo ./install.sh
        cd ..
        rm -rf zram-swap
        sudo apt -y -qq install irqbalance
        echo -e "[Desktop Entry]\nEncoding=UTF-8\nVersion=0.9.4\nType=Application\nName=irqbalance\nComment=Equilibrar las interrupciones en varias CPU\nExec=/usr/sbin/irqbalance\nOnlyShowIn=XFCE;\nRunHook=0\nStartupNotify=false\nTerminal=false\nHidden=false" < irqbalance.desktop
        sudo chmod 755 irqbalance.desktop
        sudo mv irqbalance.desktop /etc/xdg/autostart
else
        echo "Root missing"
fi
