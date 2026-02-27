#!/bin/bash

age=28
wife=mu
echo "Welcome to Guessing Game"

printf "guess my age. \n"
read age_input
printf "what is the name of my wife.\n"
read wife_input

if [[ $age_input -eq $age ]] &&  [[ $wife_input == $wife ]]
then
	echo " You know me very well"
else
	echo "guess again"
	exit 
fi
