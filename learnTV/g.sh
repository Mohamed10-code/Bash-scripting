#!/bin/bash 
command=htop
if command -v $command 
then
	echo "$command is available. lets run it."
	
else
	echo "the $commad is not available. installing it."
	sudo dnf update && sudo dnf install -y $command 
fi 
$command 
