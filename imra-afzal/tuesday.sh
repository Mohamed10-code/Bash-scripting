#!/bin/bash 

a=`date | awk '{print $1}'`
if [ $a == Tue ]; then
	echo " today is $a "
else
	echo " today is not $a "
fi 


