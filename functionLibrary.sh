##################################################################
# Purpose: Use in Trap
# Arguments:
#  No Argument
##################################################################
ctrl_c(){
        echo "** No CTRL-C allowed."
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
echo $1
}

##################################################################
# Purpose: check the validity of email addresses, based on each particular data format.
# Argument:
#   $1 -> email addresses
##################################################################
check_email(){
# Check only for allowed characters in email addresses
regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$" 
email=$1
if [[ "$email" =~ $regex ]] ; then
   echo "'$email' is a valid email."
else
   echo "'$email' is not a valid email."
fi
}

##################################################################
# Purpose: check the validity of telephone numbers, based on each particular data format.
# Argument:
#   $1 ->telephone numbers
##################################################################
check_pn(){
# Phone number can be international format or just US - your choice.
echo "pn"
} 

##################################################################
# Purpose: check the validity of credit card numbers, based on each particular data format.
# Argument:
#   $1 ->credit card numbers
##################################################################
check_ccn(){
# Credit card number should match all major cards - VISA, Mastercard, Discover, AMEX
echo "ccn"
}