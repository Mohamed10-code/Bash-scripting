#!/bin/bash

host="git"
printf "what have you learn\n"
read user_input
if [[ "$user_input" == "$host" ]]
then
	echo "you have committed git"
else
	echo "learn more about $host"
fi
