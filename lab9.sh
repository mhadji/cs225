#Authot = majid hadji , 4/30/2017 , lab9 cs225 edmonds CC
#sCreate a script that parses commandline arguments and options

# 1-Create a script named lab9.sh
# 2-The script should take these options
# -d - turns on debugging (set -x)
# -v - sets the VERBOSE variable to true
# -h - prints out a help message with the name of the script (and no path information) plus the options
# -n <name> - takes a name argument and prints a message on the screen
# -l <dir> - have it list the directory using a for loop or ls (ask yes/no before proceeding)
# any other options - prints the help message and exits
# 3-Puts all additional arguments in $1 $2 etc

#!/bin/bash

   case "$1" in

   -d) echo "Option -d turns on debugging" 
    # -d - turns on debugging (set -x)
       set -x;;
   -v) echo "option -v sets the VERBOSE variable to true"
   #-v -sets the VERBOSE variable to true
       set -v;;
   -h) echo "Script name - $0"
   #-h - prints out a help message with the name of the script (and no path information) plus the options
        echo -e "the options:\n\
        -d - turns on debugging
        -v - sets the VERBOSE variable to true
        -h - prints out a help message with the name of the script 
        -n <name> - takes a name argument and prints a message on the screen
        -l <dir> - have it list the directory ";;
   -n)  echo "Heloo $2";;
   #-n <name> - takes a name argument and prints a message on the screen
        
   -l)  echo "Are you sure? Please Enter y for yes and n for no - "
      read response
   # -l <dir> - have it list the directory using a for loop or ls (ask yes/no before proceeding)
     if [ "$response" = "y" ]; then
       ls "$2";
       exit ;
     else 
       exit ;
     fi ;;
 
   *) echo "You entered wrong argument or maybe no argument at all.
    Here is some help you can use."
     bash $0 -h
     ;;
   esac
