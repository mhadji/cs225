#Authot = majid hadji , 4/28/2017 , lab7 cs225 edmonds CC
#script  takes one argument and duplicates the functionality of the basename command exactly using pattern matching.

#!/bin/bash
#take first argument 

#if for handeling /
echo "Using Basename - "$(basename $1) 
if [ "$1" = "/" ] ; then
echo  "using pattern matching -" "$1"
else
i=$(echo "$1" |sed 's#/*$##;s#^/*##') ; i=${i##*/}
echo  "using pattern matching -" "$i"
fi