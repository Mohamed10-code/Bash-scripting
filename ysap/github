#!/bin/bash 

printf "do you want to update your machine (y/n)"
read user_input 

if [[ "$user_input" == "y" ]]
then
	echo "updating the systme"
	sudo dnf update -y
elif [[ "$user_input" != "y" ]] && [[ "$user_input" != "n" ]]
then
	echo "invalid"
else
	echo "Thanks"
fi
