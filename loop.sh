#!/bin/bash

# trap ctrl-c and call ctrl_c()

 D=$(stat -c%y timefiles/file-11.txt  | cut -d'.' -f1)
ts() {    
DAY=$(date -d "$D" '+%d')
MONTH=$(date -d "$D" '+%m')
echo "Day: $DAY"
echo "Month: $MONTH"
}

myMkdir(){
    mkdir -p $1
  }
ts
myMkdir lab11/$MONTH/$Day

