#!/bin/bash 

count_up(){
myvar=1
while [[ $myvar -le 10 ]]
do
	echo $myvar
	((myvar ++))	
	sleep 0.5
done
} 

if [[ "$count_up" -le "10" ]]
then
 	count_up	
	echo "the count is over"
else
	echo "the count will continue"
fi


