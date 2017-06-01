#!/bin/bash

check_ccn(){
    # if [[ $1 =~ ^[0-9]{16,16}|([0-9]{4,4} ?){4,4}$ ]]; then
    #echo "CREDIT CARD NUMBER"
    # remove spaces from credit card number
   #cn=${1// /}
ln=${#1}
if [[ "$ln" -eq "16" && ($1 =~ ^4[0-9]{6,}$  || $1 =~ ^5[1,5][0-9]{5,}$) ]]; then
    # echo ""
    if [[ $1 =~ ^4[0-9]{6,}$ ]]; then
	 echo "$1 - PROBABLE VISA CARD (VISA CARD START WITH 4 and has 16 digits) -$ln"
    fi
    if [[ $1 =~ ^5[1,5][0-9]{5,}$ ]]; then
	 echo "$1 - PROBABLE MASTER CARD  (MASTER CARD START WITH 51 0r 55 and has 16 digits) -$ln"
    fi
else
   if [[ "$ln" -eq "15" && $1 =~ ^3[4,7][0-9]{5,}$ ]]; then
        if [[ $1 =~ ^3[4,7][0-9]{5,}$ ]]; then
            echo "$1 - PROBABLE AMEX  (AMEX START WITH 34 or 37 and has 15 digits) -$ln"
        fi
   else
    echo "$1 - NOT AN ACEPTABLE CREDIT CARD NUMBER - $ln"
  fi
 fi     
}
visa4=1234123412341234
MS51=5113231212341233
MS55=5413231212341234
AMEX=141323121234123
crs=( $visa4 $MS51 $MS55 $AMEX )
  
      for i in "${crs[@]}"
      do
             check_ccn $i 
            
      done   
# echo $visa4
# echo $ln
#       check_ccn $visa4
         