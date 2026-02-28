#!/bin/bash 

file=/etc/os-release
if grep -q "debian" $file || grep -q "parrot" $file  
then	
	#update for parrot os
	sudo apt update 
	sudo apt upgrade
fi 

if grep -q "redhat" $file || grep -q "centos" $file 
then
	#update for rhel and centos 
	sudo dnf update 
	sudo dnf upgrade
fi 
