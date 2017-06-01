#Author = majid hadji , 5/31/2017 , lab13 cs225 edmonds CC
# Objective: Create a script with four functions using BASH's in process
# regular expressions to check the validity of email addresses, telephone numbers, IP addresses and credit card numbers 
#based on each particular data format.


#!/bin/bash

# Each function will return a message and a 1 or 0 depending on the outcome of the comparison
# Make sure the script traps control-c and exits
source  functionLibrary.sh
trap ctrl_c SIGINT SIGTERM

clear
 
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
              if  (check_email $user_s);then 
                echo "$user_s is a valid email."
              else
                 echo "$user_s is a not valid email."
            fi
          fi

#Credit card numbers	     	  
       	 if [ "$user_i" = "2" ];then
             echo "Enter your Credit card number(all numbers, no spaces)."
             read  user_s 
             check_ccn $user_s
                
         fi
#telephone numbers
       if [ "$user_i" = "3" ];then
              echo "Enter your telephone number in this format(xxx)xxx-xxxx."
              read  user_s
              if   (check_pn $user_s );then 
                echo "$user_s is a valid US phone number."
              else
                 echo "$user_s is a not valid US phone number."
              fi
      fi
#IP addresses
       if [ "$user_i" = "4" ];then
              echo "Enter your IP address."
              read  user_s
              if   (check_ip $user_s );then 
                echo "$user_s is a valid IP addresses."
              else
                 echo "$user_s is a not valid IP addresses.IP must be between 0.0.0.0 and 255.255.255.255"
              fi
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






