#!/bin/bash 

clear
printf "what is your name\n"
read a
	echo hello $a sir 
printf "do you like working in IT? (y/n)"
read like 
if [ $like == y ]
then
	echo "you are cool"
elif [ $like == n ]
then
	echo "you should try IT, its very good field"
fi 

