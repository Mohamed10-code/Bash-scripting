#!/bin/bash 

host="/home/moha/my"

for ip in $(cat $host)
do

ping -c1 $ip  &> /dev/null 

if [[ $? -eq 0 ]]
then
	echo "$ip it ok"
else
	echo "$ip not available."
fi
done
