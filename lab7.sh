#Authot = majid hadji , 4/28/2017 , lab7 cs225 edmonds CC
#script  takes one argument and duplicates the functionality of the basename command exactly using pattern matching.

#!/bin/bash
#take first argument 
echo "Using Basename - "$(basename $1) 
 i=${1%/}; i=${i##*/}
echo  "using pattern matching -" "$i"
echo "1\2"
