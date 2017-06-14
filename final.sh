#Authot = majid hadji , 6/17/2017 , Final cs225 edmonds CC

#Script 
#loops through a directory of media files(finalfiles), 
#gets their creation date from their metadata,
#creates new directory structure for year, month and day, 
#renames the file including the camera make, model and the date the photo/video was taken
#then copies or moves(-f) the files based on a parameter passed by the user. 
#If the file already exists
   #check to see if they're exactly the same file, 
   #if not append a counter to the end of the name.
#Keep the current extension but change it to lowercase if necessary.

#!/bin/bash
source  finallibrary.sh
trap ctrl_c SIGINT SIGTERM

if [ -z "$1" ];then
    echo "No -f fource option. Copy each file to the appropriate directory."
    beforecopy -z
fi

while getopts ":f,:h" opt; do
   case "$opt" in
      f)  confirm "Are you sure.All files will be moved ? Please Enter y for yes and n for no - "  beforecopy -f ;;      
      #moves each file to the appropriate directory if -f (force) is set
      h) myHelp "script name- $0" "Script creates a directory structure for the year,month and day in your home directory,copies or moves (if -f option passed) each file to the appropriate directory. it also renames the file including the camera make, model and the date the photo/video was taken.";;
           #-h - prints out a help message 
      \?) myHelp "You entered wrong argument. Here is some help you can use."
        bash $0 -h
        ;;    
   esac
  done
   shift $(($OPTIND -1))

