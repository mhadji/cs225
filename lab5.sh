#Authot = majid hadji , 4/19/2017 , lab5 cs225 edmonds CC
#Loop through data and act on each entry
# 

#!/bin/bash

#loop through the items in medialist.txt
LIST=$(cat medialab/medialist.txt)  
search() {
  echo $1
}

for i in $LIST ;do
   #echo"$i"
   search "$i"
  done

#Check to see if each item exists in the medialab directory search() {   echo"$1"}


#If it does output the name to a new file called foundfiles.txt

#if it doesn't output the name to a new file called lostfiles.txt
