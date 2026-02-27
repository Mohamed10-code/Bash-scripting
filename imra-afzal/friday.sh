a=`date |awk '{print $1}'`
if [[ "$a" == "Thu" ]]
then
	echo "today is $a"
else
	echo "today is not Friday"
fi 

