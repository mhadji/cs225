#!/bin/bash

# trap ctrl-c and call ctrl_c()

 D=$(stat -c%y timefiles/file-83.txt )
ts() {    
DAY=$(date -d "$D" '+%d')
MONTH=$(date -d "$D" '+%m')
YEAR=$(date -d "$D" '+%Y')

}

ts
echo "$YEAR/$MONTH/$DAY"
echo $D

