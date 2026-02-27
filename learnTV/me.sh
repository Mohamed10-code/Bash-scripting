#!/bin/bash

command=bmon
if command -v $command
then
	echo "the $command ls available. let run it."
else
	echo "the command is not available. installing.."
	sudo dnf update && sudo dnf install -y $command 
fi 
$command 
