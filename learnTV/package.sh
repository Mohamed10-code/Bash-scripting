#!/bin/bash 
package=htop
sudo dnf update && sudo dnf install -y  $package >> package_installed.log
if [ $? -eq 0 ]
then
	echo "the installatio of $package"
	echo "$package available"
	which $package
else	
	echo "the $package failed." >> package_failed.log
fi 

