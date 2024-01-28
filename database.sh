#!/bin/bash
while true
do
select choice in CREATE_DB LIST_DB CONNECT_DB DROB_DB EXIT
do
case $choice in 
	CREATE_DB )
	echo "creating database..."
        source ./create_db.sh	
	break
	;;
LIST_DB )
	echo "listing database..."
	source ./list_db.sh
        break
	;;
CONNECT_DB )
	echo "connecting database..."
	source ./connect_db.sh
        break
	;;
DROB_DB )
	echo " drope database..."
	source ./drob_db.sh
        break
	;;
EXIT ) exit
esac
done
done



