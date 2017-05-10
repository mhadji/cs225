#Authot = majid hadji , 5/10/2017 , lab10 cs225 edmonds CC
#Objective: Create a script that does work and cleans up if forced to exit

# Script should list all files one per line in the entire OS
# The filelist should be stored in a temporary file
# If a user presses control-c a function will clean up the temporary file and exit


#!/bin/bash
#function for deleting file
function clean {
    rm -rf $tempfile
    echo "File has deleted."
    exit 
}
#trap CTRL+C
trap clean SIGINT SIGTERM
echo "Script should list all files one per line in the entire OS ,
      If a user presses control-c a function will clean up the temporary file and exit "
 # creating  temp file
  tempfile=`mktemp lab10_file_list.XXXXXX`
 echo "This script writes to temp file $tempfile"
 #Make list of files in OS
 LIST=$(find .) #for local test
 #LIST=$(find \)
#creat linenumber
 linenumber=1
#reding the list and write it tempfile
while read line; do
     echo File $linenumber : $line >>$tempfile
     linenumber=$[$linenumber + 1]
done <<< "$LIST"
echo "Done creating temp file. The contents are:"
#display the file
cat $tempfile

