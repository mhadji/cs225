#Author = majid hadji , 5/31/2017 , lab13 cs225 edmonds CC
# Objective: Create a script with four functions using BASH's in process
# regular expressions to check the validity of email addresses, telephone numbers, IP addresses and credit card numbers 
#based on each particular data format.


#!/bin/bash

# Each function will return a message and a 1 or 0 depending on the outcome of the comparison
# Make sure the script traps control-c and exits
source  functionLibrary.sh
trap ctrl_c SIGINT SIGTERM

x=1;
clear

while [ $x -gt 0 ]
do 
   echo -e "Select from following menu:"
	 echo -e "-------------------------"
	 echo -e "[1]: Email Addresses"
   echo -e "-------------------------"
	 echo -e "[2]: Credit Card Numbers"
	 echo -e "-------------------------"
	 echo -e "[3]: Telephone Numbers"
	 echo -e "-------------------------"
	 echo -e "[4]: IP addresses"
   echo -e "-------------------------"
   echo -e "[h]:H E L P"
   echo -e "-------------------------"
	 echo -e "[q]: Q U I T"

	 read  user_i
         
#email addresses
         
          if [ "$user_i" = "1" ];then
              echo "Enter your email address."
              read  user_s
              check_email $user_s
          fi

#Credit card numbers	     	  
       	 if [ "$user_i" = "2" ];then
             echo "Enter your Credit card number."
             read  user_s
             check_ccn $user_s
         fi
#telephone numbers
         if [ "$user_i" = "3" ];then
             echo "Enter your telephone number."
             read  user_s
             check_pn $user_s
         fi
#help
          if [ "$user_i" = "h" ];then
             myHelp 'This script check the validity of email addresses, telephone numbers, IP addresses and credit card numbers.'
             exit 0
          fi         
#quit
          if [ "$user_i" = "q" ]; then
              echo "Good Bye!!!"
              exit 0
          fi



done





