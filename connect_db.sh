#!/bin/bash
echo "Type your DB to connect with: "
echo
echo "-----> select your DB number from the Menu <-----"
echo
cd ../Database_engine/my_data/
array=(`ls  -F | grep / `)
echo

select choice in ${array[@]}
do
	if [[  $REPLY -gt ${#array[@]}  ]]
	then
		echo
	       	"$REPLY Not in the Menu"
		continue
	else
	#echo ${array[$((REPLY-1))]}
	cd "${array[$((REPLY-1))]}"
	echo "${array[$((REPLY-1))]}"
	pwd
        #echo $pathTodatabase
echo "	---- you are connected to  ${array[$((REPLY-1))]} DB ----"
	echo
        break
	fi
	break
done
#echo $pathTodatabase
flag=1
while (( flag == 1 ))
do
flag=0
select choice in Create_table List_table Drob_table Insert_in_table select_from_table Delete_from_table   EXIT
do
case $choice in 
	Create_table )
	                 pwd
			echo "creating table ..."
			source  ../.././creatTable.sh  
			flag=1
			break 
			;;
	List_table )
                        echo "listing table ..."
                        ls
                        flag=1
                        break
                        ;;
        Drob_table )
                        echo "dropping table ..."
                        source ../.././drop_table.sh 
                        flag=1
                        break
                        ;;
       Insert_in_table )
                        echo "inserting table ..."
                        flag=1
                        source ../.././insert.sh 
                        break
                        ;;
       select_from_table)
                        echo "selecting from table ..."
                        flag=1
                        source ../.././select.sh  
                        ;;
       Delete_from_table)
                        echo "Deleting from table ..."
                        source ../.././delete.sh
                        flag=1
                        ;;
       		EXIT) echo "Good Bye" 
		flag=0
		exit
		;;
		* )
			echo " no a propriate choice try again"
	esac
done
done
##cd -&> ~/../../dev/null
