#!/bin/bash 

count=100
echo what is the count
read count
if [ $count -eq 100 ]
then 
	echo the count is 100
else
	echo the count is not 100
fi
