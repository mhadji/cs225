#Authot = majid hadji , 4/28/2017 , lab8 cs225 edmonds CC
#using the last line of /var/share/CS225/addresses.csv gather each field into the following variables using bash pattern substitution.  Echo the results back onto the screen all in lower case. Do NOT use awk or tr for this!

#!/bin/bash
LIST=$(cat addresses.csv)
unset lastline
#reading last line
while read line; do
       lastline=$line
done <<< "$LIST"
# erasing "
lastline=${lastline//'"'/} 

OLDIFS=$IFS
# reading last line and assigining values to variables 
while IFS=,  read  FNAME  LNAME COMPANY STREET CITY  STATE  STATEABR ZIP HPHONE WPHONE  EMAIL WEBURL
 do
   echo -e "FNAME:   ${FNAME,,}\n\
LNAME:   ${LNAME,,}\n\
COMPANY: ${COMPANY,,}\n\
STREET:  ${STREET,,}\n\
CITY:    ${CITY,,}\n\
STATE:   ${STATE,,}\n\
STATEABR:${STATEABR,,}\n\
ZIP:     ${ZIP,,}\n\
HPHONE:  $HPHONE\n\
WPHONE:  $WPHONE\n\
EMAIL:   ${EMAIL,,}\n\
WEBURL:  ${WEBURL,,}\n"
 done <<< $lastline
IFS=$OLDIFS

