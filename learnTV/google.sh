#!/bin/bash 
ping -c 3 google.com >> try.log
if [ $? -eq 0 ] 
then
	echo "the internet is up"
else
	echo "the internet is down"
fi 
