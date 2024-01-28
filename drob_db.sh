#!/bin/bash
cd ../Database_engine/my_data
echo"  Type your table number to drob : "
echo
echo "------> Select Your DataBase to Drob it <------"
echo
array=(`ls -F | grep / `)
echo

#echo ${array[*]}
select choice in ${array[@]}
do
	if [ $REPLY -gt ${#array[@]} ]
	then
		echo "$REPLY Not in the Menu"
		continue 
	else
	#echo ${array[$((REPLY-1))]}
	rm -r  ${array[$((REPLY-1))]}
	echo "----your ${array[$((REPLY-1))]} deleted from database seccessfly----"
        break
	fi
	break
done
cd -&> ~/../../dev/null

