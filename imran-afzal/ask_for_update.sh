#!/bin/bash 

clear

printf "do you want to update (y/n)\n"
read user_input
if [[ "$user_input" == "y" ]]; then
	echo "updating the system"
	sudo dnf update -y 
	sudo dnf upgrade -y
elif [[ "$user_input" != "y" ]] && [[ "$user_input" != "n" ]]
then
	echo "Not valid input"
else
	echo "NO Thanks. "
fi

