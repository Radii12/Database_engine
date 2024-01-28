#!/bin/bash
##list tables to the users ####
echo "...............already existing tables..............."
ls  -s 

pwd
##.......2 let uaser create a valid table name and not exist in the lest og tables..................##
    while true 
    do 
# read table input 
read -p "enter your table name to create...  " 
table_name=$REPLY
	case $table_name in 

		# user unter empty
' ' )
	echo "the name can not be empty"
	##continue
;;
## the name of the table can not have any space

*[[:space:]] | *[[:space:]]* |[[:space:]]*  )
	echo "the name of the table can not have spaces"	
	#continue
;;
	*[0-9] )
	echo "the name of the table can not have Numbres"
	#continue
;;
*[a-zA-z_]*[a-zA-z_]  | [a-zA-z_] )

	if [[ -f  $table_name ]]
	then 
		echo "the table is exist"
		continue
else
	touch "$table_name"
       echo "your created your table successfully"
       
break
fi
;;

*)
	echo "write a valid name "
	#continue
	;;
	esac
done
#let user insert data to the table

#insert the number of failds 
while true 
do 
	read -p "enter the number of fields fo $table_name table" 
	fields_numb=$REPLY
	case $fields_numb in
		*0 )
			echo "the number of fields can not be $fields_numb"
			continue;;
		*[1-9] | *[1-9] |[0-9])
			echo "your table number of fields is $fields_numb"
			break;;
		*0) 
			echo "pleas write a vaild number"
			continue;;
	esac
done 

############insert column name


let fields_numb=$fields_numb
 
 echo  "insert the  names of column for  $table_name"

 
 for ((i=0;i<$fields_numb;i++))
do
	##chick for validation
	while true
	do	
	if  [[ $i -eq 0 ]]
then 
	echo "enter the name of column that will be primary key" 
fi
#####read the input 
read -p "column number  $(( i+1 )) name is "
col_name=$REPLY
case $col_name in 

' ' )
		echo "the name can not be empty"
		continue;;

 *[[:space:]] | *[[:space:]]* |[[:space:]]* )

		echo "the name can not cotain spaces"
		continue;;
*[0-9])
		echo "the name can not start with numbers"
		continue;;
*[a-zA-z_]*[a-zA-z_]  |  [a-zA-z_] )

			row_name+="$col_name\t"	
		break;;

*) 
		echo "the name can not has spcial character"
		continue;;
esac
done

done
echo -e $row_name >> "$table_name"


#insert type of data 

row_type=""
	echo " second insert the data type of column "
	
	echo "the type of filed 1 is integer"
	row_type=" "

       for ((i=0;i<$fields_numb;i++))
do	
if [[ $i -eq 1 ]]
then
	##row_type+="integer:\t"
	row_kind+="Pk\t"
	
fi
echo "type your $i filed"

select choice in "string" "integer"
do 

	case $choice in 
string)
	echo "string "
	row_type+="string\t"
	if [[  $i -ne 0  ]]
then
	row_kind+="n_null\t"
	fi
break;;

integer)
echo "integer"
	row_type+="integer\t"
	if [[  $i -ne 0  ]]
then
	row_kind+="n_null\t"
	fi

break;;
* )
	echo "only 1 and 2 are available"
	continue;;



esac
done
done
echo  -e $row_type >> "$table_name"
echo  -e $row_kind >> "$table_name"
	echo "your table meta data is  $row_name : $row_type"











