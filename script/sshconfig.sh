#!/bin/sh

ssh_copy_id(){
	cd $HOME/.ssh
	read -p "which host? " host	
	ssh-copy-id -i id_rsa.pub $host
}

ssh_simple_config(){
    	cd $HOME/.ssh
	read -p "Host ?? " host
	echo "Host "$host >> config
	read -p "Hostname ?? " hostname
	echo "Hostname "$hostname >> config
	read -p "User ?? " user
	echo "User "$user >> config
	echo 'ForwardX11 yes' >> config
}

cd $HOME/.ssh
while true; do
    read -p "Do ssh-keygen? [Y/N] : " yn
    case $yn in
        [Yy]* ) ssh-keygen; break;;
        [Nn]* ) break;;
        * ) echo "Please answer Y/N ";;
    esac
done
echo "done ssh-keygen"
while true; do
    read -p "Do ssh config? [Y/N] : " yn
    case $yn in
        [Yy]* ) ssh_simple_config; break;;
        [Nn]* ) break;;
        * ) echo "Please answer Y/N ";;
    esac
done
echo "done config"
while true; do
    read -p "Do ssh-copy-id? [Y/N] : " yn
    case $yn in
        [Yy]* ) ssh_copy_id; break;;
        [Nn]* ) break;;
        * ) echo "Please answer Y/N ";;
    esac
done
echo "done ssh-copy-id"
echo "done sshconfig.sh"
