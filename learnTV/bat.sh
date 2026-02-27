#!/bin/bash

command=bat
if command -v $command 
then 
	echo "the $command is availabe"
else
	echo"the command is not available. installing it."
	sudo dnf update && sudo dnf install $command 
fi

which bat 
