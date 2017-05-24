#!/bin/bash


source  functionLibrary.sh

 D=$(stat -c%y timefiles/file-83.txt )
res="ts $D"
#echo $DAY
#echo $res

