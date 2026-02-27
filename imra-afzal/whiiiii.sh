#!/bin/bash 


printf "what is the number. "
read user_input

if [[ $num == $user_input ]]
then
	echo "you have got the number. "
else
	echo  "try agin" 
fi
