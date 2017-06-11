##################################################################
#Authot = majid hadji , 6/17/2017 , Final cs225 edmonds CC
#this library creted for final assignment 
##################################################################
# Purpose: Use in Trap
# Arguments:
#  No Argument
##################################################################
ctrl_c(){
        echo "** No CTRL-C allowed."
}

##################################################################
# Purpose: make list of files in directory
# Arguments:
#  directory full name
##################################################################

 list(){
    #make list of files in finalfiles directory
    #check if directory exists and has content
    if find $1 -mindepth 1 -print -quit | grep -q .; then
      LIST=$(find $1 -name "*.*")
    
    else
     echo "original folder is empty or not exist."
    fi
}
##################################################################
# Purpose: get the Modified date from file's stats and extract $DAY and $MONTH portion
# Arguments:
#   $1 -> file name 
##################################################################

ts() {  
if [ ! -z "$1" ];then
DAY=$(date -d "$1" '+%d')
MONTH=$(date -d "$1" '+%m')
YEAR=$(date -d "$1" '+%Y')
fi
 echo $1
 echo $DAY
# echo $MONTH
}

##################################################################
# Purpose: get yes or no responce from user
# Arguments:
#   $1 -> greeting message
#   $2 -> yes respons 
##################################################################
confirm(){
 echo "$1"
 read response
 if [ "$response" = "y" ]; then
    $2
 elif [ "$response" = "n" ]; then
         echo "Good Bye"
 else 
         echo "Y or N allowed."
 fi 
}

##################################################################
# Purpose: get yes or no responce from user
# Arguments:
#   $1 -> line 1 message
#   $2 -> line 2 message
##################################################################
myHelp(){
echo "$1"
echo "$2"
}


##################################################################
# Purpose: check the validity of IP addresses, based on each particular data format.
# Argument:
#   $1 ->IP addresses
##################################################################
check_ip(){
# IP address should handle 0.0.0.0 to 255.255.255.255 but nothing else.
if [[ "$1" =~ ^([0-9]|[1-9][0-9]|1([0-9][0-9])|2([0-4][0-9]|5[0-5]))\.([0-9]|[1-9][0-9]|1([0-9][0-9])|2([0-4][0-9]|5[0-5]))\.([0-9]|[1-9][0-9]|1([0-9][0-9])|2([0-4][0-9]|5[0-5]))\.([0-9]|[1-9][0-9]|1([0-9][0-9])|2([0-4][0-9]|5[0-5]))$ ]] ; then
   echo "$1 is a valid IP."
    return 0
 else
#    echo "$1 is Not a valid IP."
   return 1
fi
}


##################################################################
# Purpose: check the validity of email addresses, based on each particular data format.
# Argument:
#   $1 -> email addresses
##################################################################
check_email(){
# Check only for allowed characters in email addresses

if [[ "$1" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]] ; then
    echo "$1 is a valid email address."
    return 0
 else
#    echo "$1 is not a valid email address."
   return 1
fi
}

##################################################################
# Purpose: check the validity of telephone numbers, based on each particular data format.
# Argument:
#   $1 ->telephone numbers
##################################################################
check_pn(){
# Phone number can be international format or just US - your choice.
if [[ "$1" =~ ^(([0-9]( |-))?[0-9]{3,3} +|([0-9]( |-))?\([0-9]{3,3}\) *)?[0-9]{3,3}( |-)[0-9]{4,4}$ ]]; then
   echo "$1 is a valid phone number."
   return 0
 else
    # echo "$1 is not a valid phone number."
   return 1
   
fi

}
##################################################################
# Purpose: check the validity of credit card numbers, based on each particular data format.
# Argument:
#   $1 ->credit card numbers
##################################################################
  
check_ccn(){
 ln=${#1}
if [[ "$ln" -eq "16" && ($1 =~ ^4[0-9]{6,}$  || $1 =~ ^5[1,5][0-9]{5,}$) ]]; then
    # echo ""
    if [[ $1 =~ ^4[0-9]{6,}$ ]]; then
	 echo "$1 - PROBABLE VISA CARD (VISA CARD START WITH 4 and has 16 digits) "
    fi
    if [[ $1 =~ ^5[1,5][0-9]{5,}$ ]]; then
	 echo "$1 - PROBABLE MASTER CARD  (MASTER CARD START WITH 51 0r 55 and has 16 digits) "
    fi
else
   if [[ "$ln" -eq "15" && $1 =~ ^3[4,7][0-9]{5,}$ ]]; then
        if [[ $1 =~ ^3[4,7][0-9]{5,}$ ]]; then
            echo "$1 - PROBABLE AMEX  (AMEX START WITH 34 or 37 and has 15 digits)"
        fi
#    else
#     echo "$1 - NOT AN ACEPTABLE CREDIT CARD NUMBER."
  fi
 fi     
}