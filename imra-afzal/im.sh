#!/bin/bash 

count=0
num=10
while [ $count -lt 10 ]
do 
	echo $num second left to stop this process $1

	sleep 0.5

num=`expr $num - 1 `
count=`expr $count + 1 `
echo "$1 process is stopped!!!!"
done
