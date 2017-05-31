#Author = majid hadji , 4/19/2017 , lab5 cs225 edmonds CC
#Loop through data and act on each entry
# 

#!/bin/bash
#delete old  the files if they exist
FILELIST="foundfiles.txt lostfiles.txt"   
for FILE in $FILELIST ; do 
   if [ -f $FILE ]; then
   rm -f $FILE
   fi 
done
#search function - search through media folder and add result to two files
search() {
if [[ $(find medialab -name "$1" |wc -l) -gt 0 ]] ;then
   echo "$i" >>"foundfiles.txt"
else
    echo "$i" >> "lostfiles.txt"
fi
}
#loop through the items in medialist.txt and pass each line to search function
LIST=$(cat medialab/medialist.txt)  
for i in $LIST ;do
   search "$i"
  done

