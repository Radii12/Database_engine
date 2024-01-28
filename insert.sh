#!/bin/bash
while true
do
read -p "Enter table Name : "  table_name
if [ ! -f $table_name ]
then 
	echo "Not exists pls enter again"
else
break
fi
done
IFS=$'\t' read -ra col_name< <(awk '{ if(NR==1) print $0}' "$table_name")
IFS=$'\t' read -ra kind_type< <(awk '{ if(NR==2) print $0}' "$table_name")
newrecord=""
old_valueforPK=($(awk  'NR>=4 {print $1}' "$table_name"))
for ((i=0; i<${#col_name[@]}; i++))
do
	
	        flag=1
	        dublicated_val=1
		while (( dublicated_val==1 || flag==1 ))
		do
                        dublicated_val=0
                        flag=0		
			read -p "Enter data  for column = ${col_name[i]} :" answer
			if [[   ${kind_type[i]}  ==  "integer"   ]]
			then
				if [[  !  $answer  =~  ^[0-9]*$  ]]
				then
					flag=1
					echo "You choice that column is integer you should enter integer  value"
				fi
			elif [[  ${kind_type[i]} == "string" ]]
			then 
				if [[  !  $answer  =~  ^[a-zA-Z_][a-zA-Z0-9_]*$  ]]
				then
					flag=1
					echo "You choice that column is integer you should enter integer  value"
				fi		
			fi
			for ((j=0; j<${#old_valueforPK[@]}; j++))
			do
				if [[ "$answer" == "${old_valueforPK[j]}" ]]
				then
					dublicated_val=1
					echo "primary key duplicated pls enter different value "
					break
				fi
			done
		done
		
		
   newrecord+="$answer\t"
   		
done
echo -e "$newrecord" >> $table_name
