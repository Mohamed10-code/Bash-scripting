#!/bin/bash 
ping -c 1 google.com
if [ $? -eq 0 ]
then
	echo "the wifi is up"
else	
	echo "the wifi is down"
fi 
