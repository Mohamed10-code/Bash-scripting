#!/bin/bash

num=20

printf what is your number  
read user_input 

if  [[ $user_input -eq 5 ]]
then
	echo "the number is correct. your answers matchs $user_input" 
else
	echo "the number is incorrect"
fi  

