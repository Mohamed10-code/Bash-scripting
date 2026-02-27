#!/bin/bash 

clear

printf "what is your name\n"

read name

printf "do you like IT. (y/n)"

read y

if [ $y == y ]


then 
	echo " you are cool. "

elif [ $y == n ]

then
	echo " you should try IT."
fi	
	
