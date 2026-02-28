#!/bin/bash 

num=20
printf "what is your number\n"
read user_input
if [[ $user_input -ge $num ]]
then	
	echo "the number is correct"
else
	echo "the number is incorrect"
fi 
