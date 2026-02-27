#!/bin/bash 
package=htop
sudo dnf install $package >> result.log
if [ $? -eq 0 ]
then
	echo "the installation of $package is read"
	echo "the new command is available"
	which $package 
else
	echo "the $package failed to install" >> failed.log
fi 

