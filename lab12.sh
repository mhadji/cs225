#Authot = majid hadji , 5/23/2017 , lab12 cs225 edmonds CC
# Create a script with a pseudo multi-dimensional array

#!/bin/bash
OLDIFS=$IFS
source  functionLibrary.sh
trap ctrl_c SIGINT SIGTERM
IFS=$'\n'
LIST=($(cat addresses.csv))
lineCount=${#LIST[@]} 
# reading each item/line
for row in ${LIST[@]} ;do
 # reading items from each line   
        while IFS=,  read  FNAME  LNAME COMPANY ADDRESS CITY COUNTY STATE  ZIP PHONE FAX  EMAIL WEBURL; do       
             FNAME_arr+=("${FNAME}") 
             LNAME_arr+=("${LNAME}")
             COMPANY_arr+=("${COMPANY}")
             ADDRESS_arr+=("${ADDRESS}")
             CITY_arr+=("${CITY}")
             COUNTY_arr+=("${COUNTY}")
             STATE_arr+=("${STATE}")
             ZIP_arr+=("${ZIP}")
             PHONE_arr+=("$PHONE")
             FAX_arr+=("$FAX")
             EMAIL_arr+=("${EMAIL}")
             WEBURL_arr+=("${WEBURL}")
        done <<< $row
done 
IFS=$OLDIFS
COUNT=0
while [ $COUNT -lt $lineCount ] ;do
  echo "${FNAME_arr[$COUNT]},${LNAME_arr[$COUNT]},\
${COMPANY_arr[$COUNT]},${ADDRESS_arr[$COUNT]},\
${CITY_arr[$COUNT]},${COUNTY_arr[$COUNT]},\
${STATE_arr[$COUNT]},${ZIP_arr[$COUNT]},\
${PHONE_arr[$COUNT]},${FAX_arr[$COUNT]},\
${EMAIL_arr[$COUNT]},${WEBURL_arr[$COUNT]}"
 
 COUNT=$[$COUNT + 1]
 done

