echo -e "Must run AddDocker.sh before...\n" && sleep 20;
sudo add-apt-repository ppa:gns3/ppa && sudo apt-get update && sudo apt-get -y install gns3-gui gns3-server;
sudo usermod -aG ubridge ${USER} && sudo usermod -aG libvirt ${USER} && sudo usermod -aG kvm ${USER} && sudo usermod -aG wireshark ${USER};
echo -e "Must reboot to apply...\n" && sleep 10 && reboot;

