#!/bin/bash 
  
greet(){

read -p "what is your name: " name 

if [[ "$name" == "farah" ]]
then
	echo "the name is found. and its is $name: "
else
	echo "please try again: "
fi


}

while [[ "$name" != "farah" ]]
do 
	greet 
done
