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
# if no command line arg given
# set rental to Unknown
if [ -z $1 ]; then
  echo "Script take argument.Here is some help"
  arg=-h
else
  arg=$1
fi

   case "$arg" in
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
        -h - prints out a help message with the name of the script (and no path information) plus the options
        -n <name> - takes a name argument and prints a message on the screen
        -l <dir> - have it list the directory using a for loop or ls (ask yes/no before proceeding)";;
   -n)  echo "Heloo $2";;
   #-n <name> - takes a name argument and prints a message on the screen
        
   -l) echo "option -l "
   # -l <dir> - have it list the directory using a for loop or ls (ask yes/no before proceeding)
  ls "$2" ;;
   *) echo "$1 is not an option";;
   esac
 