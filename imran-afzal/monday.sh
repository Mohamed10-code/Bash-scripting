#!/bin/bash 

a=`date | awk '{print $1}'`
if [ $a == mon ]
then
	echo "today is monday"
else	
	echo "today is not monday"
fi
