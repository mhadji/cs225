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
source  finalLibrary.sh
trap ctrl_c SIGINT SIGTERM
#Copy or move each file to the appropriate directory 
copy(){
        #Getting modified timestamp of each file in timefiles
       #check if file exists
         if [ $(find  "$1") ];then
            DATE=$(stat -c%y  $1 )
            ts $DATE # $MONTH and $DAY will be created in ts function
          if [ -z "$MONTH" ] && [ -z "$DAY" ] ;then
            echo "Somthing went wrong.No date found"
            exit
         else 
          DIS=lab11/$MONTH/$DAY
          mkdir -p $DIS
         fi
       else
            echo "$1 not found"
       fi 
    
        if [ "$2" -eq 0 ];then
            #Copy each file to the appropriate directory 
            cp -r $1 $DIS
            echo  "copy $1 to $DIS"
        elif [ "$2" -eq 1 ];then
           #moves each file to the appropriate directory if -f (force) is set
           mv $1 $DIS
           echo "move $1 to $DIS"  
        else 
           echo "wrong"
           exit
        fi
    }
 
 list(){
    #make list of files in timefiles directory
    #check if directory exists and has content
    if find "timefiles" -mindepth 1 -print -quit | grep -q .; then
      LIST=$(find timefiles -name "*.*")
    # echo $LIST >test.txt 
    #loop through the items in timefiles and pass each line to copy function
        for i in $LIST ;do
            if [ "$1" = "-z" ];then
            copy $i 0
            else
            copy $i 1
            fi
        done
    else
     echo "original folder is empty or not exist."
    fi
}

if [ -z "$1" ];then
   echo "No -f fource option. Copy each file to the appropriate directory."
   list -z
fi

while getopts ":f,:h" opt; do
   case "$opt" in
      f)  confirm "Are you sure.All files will be moved ? Please Enter y for yes and n for no - "  list -f ;;      
      #moves each file to the appropriate directory if -f (force) is set
      h) myHelp "script name- $0" "Script creates a directory structure for the month and day in your home directory,copies each file
       to the appropriate directory, or moves each file to the appropriate directory if -f \(force) is set.";;
           #-h - prints out a help message 
      \?) myHelp "You entered wrong argument. Here is some help you can use."
        bash $0 -h
        ;;    
   esac
  done
   shift $(($OPTIND -1))

