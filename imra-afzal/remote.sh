#!/bin/bash 

host="192.168.122.1"
ping -c1 $host  &> /dev/null 

if [[ $? -eq 0 ]]
then
	echo "$host it ok"
else
	echo "$host not available."
fi
