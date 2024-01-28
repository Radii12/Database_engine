#!/bin/bash

while true
do
    read -p "Enter table name: " table_name
    if [ ! -f "$table_name" ]
    then
        echo "Table not found with this name."
    else 
        break
    fi
done

select choice in  "Delete record"
do    
    case $REPLY in 
        
        1) read -p "Enter value to delete record: " delete_value
            grep -vw "$delete_value" "$(pwd)/$table_name" > temp_file
            mv temp_file "$(pwd)/$table_name"
            echo "Record deleted successfully."
            break;;
        *) echo "Invalid choice. Please choose 1, 2, or 3."
    esac
done
