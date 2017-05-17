#!/bin/bash

# trap ctrl-c and call ctrl_c()

 D=$(stat -c%y timefiles/IMG_0528  | cut -d'.' -f1)
ts() {    
DAY=$(date -d "$1" '+%d')
MONTH=$(date -d "$1" '+%m')
YEAR=$(date -d "$1" '+%Y')
echo $YEAR
}

myMkdir(){
    mkdir -p $1
  }
ts
myMkdir lab11/$MONTH/$Day

