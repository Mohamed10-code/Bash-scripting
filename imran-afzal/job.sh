#!/bin/bash 


host="192.168.122.179"

ping -c1 $host &> /dev/null
if [[ $? -eq 0 ]]
then
	echo "the servr is up"
else
	echo "the server is down"
fi
