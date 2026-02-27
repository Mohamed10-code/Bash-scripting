#!/bin/bash
a=top

if command -v $a
then	
	echo "the $a command is available. running it"
else 
	echo"the $a command is not availbale. installing it."
	sudo dnf install procps-ng -y 
fi 
$a
