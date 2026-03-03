#!/bin/bash 
  
greet(){
if (( $# == 0 )) 
then
	echo "name is requred!" >&2
fi 
}

read -p "what is your name: " name
while $name 
do 
	greet
done
