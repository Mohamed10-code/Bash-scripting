#!/bin/bash 

command=htop
if command -v $command 
then
	echo "the $command is available. lets run it."
else
	echo "the $command is not available. installing it."
	sudo dnf update && sudo dnf install -y htop
fi 

which $command 
