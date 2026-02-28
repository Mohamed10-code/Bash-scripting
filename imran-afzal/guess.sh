#!/bin/bash 

age=28
wife=mu
printf "guess my age\n"
read age_input
printf "guess my wife\n"
read wife_input 

if [[ $age_input -eq $age ]] && [[ $wife_input == $wife ]]
then
	echo "You know me very well."
else
	echo "habibi try again later."
	exit 
fi
