#Author = majid hadji , 5/31/2017 , lab13 cs225 edmonds CC
# Objective: Create a script with four functions using BASH's in process
# regular expressions to check the validity of email addresses, telephone numbers, IP addresses and credit card numbers 
#based on each particular data format.

#!/bin/bash

# Each function will return a message and a 1 or 0 depending on the outcome of the comparison
# Make sure the script traps control-c and exits
source  functionLibrary.sh
trap ctrl_c SIGINT SIGTERM
#help and checking for argument
if [ -z $1 ]; then
 myHelp 'This script check the validity of email addresses, telephone numbers, IP addresses and credit card numbers.'
 exit 0
fi
#function in library
checkPoints=( check_email check_ccn check_ip check_pn )   
 for f in "${checkPoints[@]}"
   do
      if  ($f $1);then 
         :         
       fi       
 done  
      

