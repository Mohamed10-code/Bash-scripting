#!/bin/bash 


choice=0
while [[ "$choice" -ne 4 ]]
do 
echo "what is your favorite linux distro"

echo "1 - arch"
echo "2 - centos"
echo "3 - Debian"
echo "4 - ubuntu"

read distro

case $distro in
	1) echo "by the way i use arch";;
	2) echo "centos is like redhat";;
	3) echo "debian is for security guy";;
	4) echo "ubuntu is the best";;
	*) echo "idk know";;

esac
sleep 0.5
done
