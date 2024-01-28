#!/bin/bash
echo "---------- Already Existing DataBase ----------"
cd ../Database_engine/my_data
ls -F | grep / | tr / ".."

cd -&> ~/../../dev/null
