#!/bin/bash 

my="/home/moha/ips"

for ip in $(cat $my) 
do
	ping -c2 $ip &> /dev/null
	if [ $? -eq 0 ]
	then
		echo the $ip is ok
	else
		echo the $ip is not 
fi
done
