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
while [ ‐n "$1" ]
do
   case "$1" in
   ‐a) echo "Found the ‐a option" ;;
   ‐b) echo "Found the ‐b option";;
   ‐c) echo "Found the ‐c option" ;;
   *) echo "$1 is not an option";;
   esac
   shift
done