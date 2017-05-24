#Authot = majid hadji , 5/23/2017 , lab12 cs225 edmonds CC
# Create a script with a pseudo multi-dimensional array

#!/bin/bash
 source  functionLibrary.sh
 trap ctrl_c SIGINT SIGTERM
LIST=$(cat addresses.csv)
lineCount=$(cat addresses.csv |wc -l)

declare -a FNAME_arr
declare -a LNAME_arr
declare -a COMPANY_arr
declare -a ADDRESS_arr
declare -a CITY_arr
declare -a COUNTY_arr
declare -a STATE_arr
declare -a ZIP_arr
declare -a PHONE_arr
declare -a FAX_arr
declare -a EMAIL_arr
declare -a WEBURL_arr
   
 OLDIFS=$IFS
# reading each line
while read line; do
       line=$line
        # erasing "
        #  line=${line//' '/} 
        # reading each line and  
        while IFS=,  read  FNAME  LNAME COMPANY ADDRESS CITY COUNTY STATE  ZIP PHONE FAX  EMAIL WEBURL
        do       
        #    echo ${FNAME} 
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
        done <<< $line
done <<< "$LIST"
IFS=$OLDIFS
COUNT=0
while [ $COUNT -lt $lineCount ] ;do
  echo "${FNAME_arr[$COUNT]},${LNAME_arr[$COUNT]},${COMPANY_arr[$COUNT]},${ADDRESS_arr[$COUNT]},${CITY_arr[$COUNT]},${COUNTY_arr[$COUNT]},${STATE_arr[$COUNT]},${ZIP_arr[$COUNT]},${PHONE_arr[$COUNT]},${FAX_arr[$COUNT]},${EMAIL_arr[$COUNT]},${WEBURL_arr[$COUNT]}" 
 
 COUNT=$[$COUNT + 1]

 done

