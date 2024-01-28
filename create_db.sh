#!/usr/bin/bash

cd ../Database_engine
while true 
do
#-------------reading the input---------------
echo "Write Your DB Name"
read db_name
case $db_name in 
#----------the name is empty------------------
'' )
echo "the name can not be empty"
continue ;;
#----------the name can not have spaces--------
*[[:space:]] | *[[:space:]]* | [[:space:]]* )
echo "the name can not have a spaces"
continue ;;
#----------the name can not be numbers--------
[0-9]* )
echo "the name can not start whith numbers"
continue ;;
*[a-zA-Z_]*[a-zA-Z_] | [a-zA-Z_] )
	if  find "my_data/$db_name" -type d -maxdepth 0 &> /dev/null 
	then
		echo " this DataBase is already exist "
       continue
	else
	mkdir my_data/$db_name
        break
	fi 
	;;
* )
	echo "write avalid name"
	continue ;;
esac
done
echo "Database created succefully"

cd -&> ~/../../dev/null


