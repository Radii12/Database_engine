#!/bin/bash 
####usr/bin/bash
echo "select your table from the menue"
array=(`ls`)
select choice in ${array[*]}
do
	if [ $REPLY -gt ${array[*]} ]
	then 
		echo "$REPLY not on the menu "
		continue
	else
		rm ${array[${REPLY}-1]}
		echo "${array[${REPLY}-1]} table dropped successfully"
		echo
		break
	fi
done

