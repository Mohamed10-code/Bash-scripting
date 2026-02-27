#!/bin/bash 

for ((i=1; i<=100; i+=5))
do 
	printf "%d\n" "$i"
	sleep 0.5
done
