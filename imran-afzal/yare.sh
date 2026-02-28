#!/bin/bash 

num=6
echo "welcome to guessing game"
printf "what is your number\n"
read user_input
if [[ $user_input -eq $num ]]
then 	
	echo "the number is correct"

else
	echo "please try again"
	exit 
fi
