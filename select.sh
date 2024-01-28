#!/bin/bash
while true
do

read -p "Enter table name :  " table_name
if [ ! -f  $table_name  ]
then
	echo "not found table with this name"

else 
	break
fi
done

select choice in "Show all data of table" "Show with condition " 
do	
	case $REPLY in
	#echo $table_name " " $(pwd)  
	1)  cat   "$(pwd)/$table_name"
		
		break;;
	2) read -p "Enter value you want to select it " value
		grep -w "$value" "$(pwd)/$table_name"
		break;;
esac		
done	
echo "you are know in table menue"


