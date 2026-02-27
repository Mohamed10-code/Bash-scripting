#!/bin/bash 

if [ -f /home/moha/scripts/imran-afzal/myfile ]
then	
	echo "here is the file"
	exit
else 	
	echo "the file is not available"
	echo "creating the file here."
	touch myfile
fi 


