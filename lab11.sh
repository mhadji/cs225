#Authot = majid hadji , 5/17/2017 , lab11 cs225 edmonds CC
#building a function library

# looks at the modified timestamp of each file in timefiles
# creates a directory structure for the month and day in your home directory
# copies each file to the appropriate directory
# moves each file to the appropriate directory if -f (force) is set

#!/bin/bash
source  functionLibrary.sh
trap ctrl_c SIGINT SIGTERM
#Copy or move each file to the appropriate directory 
copy(){
        D=$(stat -c%y  $1 | cut -d'.' -f1)
        ts $D
        mkdir -p lab11/$MONTH/$DAY
         if [ "$2" -eq 0 ];then
            #Copy each file to the appropriate directory 
            cp -r $1 lab11/$MONTH/$DAY
            echo  "copy $1 to lab11/$MONTH/$DAY"
        else 
            #moves each file to the appropriate directory if -f (force) is set
            mv $1 lab11/$MONTH/$DAY
            echo "move $1 to lab11/$MONTH/$DAY "
        fi
      
  }
 
 list(){
    #make list of files in timefiles directory
    LIST=$(find timefiles -name "*.*")
    echo $LIST >test.txt 
    #loop through the items in timefiles and pass each line to copy function
    for i in $LIST ;do
        if [ "$1" = "-z" ];then
        copy $i 0
        else
        copy $i 1
        fi
    done
}

if [ -z "$1" ];then
   echo "No option"
   list -z
fi

while getopts ":f,:h" opt; do
   case "$opt" in
      f)  echo "Starting ..."
           list -f;;
      #moves each file to the appropriate directory if -f (force) is set
      h) echo "Script name - $0"
      #-h - prints out a help message 
            echo -e "Script creates a directory structure for the month and day in your home directory,copies each file to the appropriate directory, or moves each file to the appropriate directory if -f (force) is set.";;
     \?) echo "You entered wrong argument. Here is some help you can use."
        bash $0 -h
        ;;    
   esac
  done
   shift $(($OPTIND -1))

