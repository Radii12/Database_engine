#!/bin/bash
array=(`ls`)

if [ -n array ]
then
	echo"thire is on tables"

else
	echo " .....>>  all tables  <<....."
	array=(`ls`)
fi

