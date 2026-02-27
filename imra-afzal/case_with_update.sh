#!/bin/bash 

clear
printf "please choice number.\n"

echo "1 = update the system."
echo "2 = if you dont wanna update press 2"
read choice 

case $choice in
	1) sudo dnf  update && sudo dnf upgrade -y;;
	2) echo "NO Thansk";;
	*) echo idk;;
esac
