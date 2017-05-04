#Authot = majid hadji , 5/3/201 , lab8-Extra cs225 edmonds CC
#Make a shell script that will take two arguments and complain and exit 
#if the first doesn't exist and set a default value of 10 if the second doesn't exist.

#!/bin/bash
 echo  "The first argument is  ${1:?"You need at least one argument."} and the Second argument is ${2:-10}." 


