#!/bin/bash 
secret_number=20 
echo "Welcome to guessing game"
printf "please enter a number\n"
read user_guess

if [[ ! "$user_guess" =~ ^[0-9]+$ ]]
then
	echo "error! '$user_guess' is not a valid"
	exit 
fi 

if [ "$user_guess" -eq "$secret_number" ]
then
	echo "success! $user_guess is the correct number"
else
	echo "sorry! $user_guess is incorrect."
fi 
