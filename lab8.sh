#Authot = majid hadji , 4/28/2017 , lab8 cs225 edmonds CC
#using the last line of /var/share/CS225/addresses.csv gather each field into the following variables using bash pattern substitution.  Echo the results back onto the screen all in lower case. Do NOT use awk or tr for this!

#!/bin/bash

LIST=$(cat addresses.csv)


unset lastline


while read line; do
    if  [  -z "$lastline" ]; then
   
        echo "$lastline" 
    
fi
       lastline=$line
done <<< "$LIST"

     lastline=${lastline//'"'/} 
     lastline=${lastline//' '/} 
#echo $lastline

OLDIFS=$IFS
IFS=" , "
while read FNAME  LNAME COMPANY STREET CITY  STATE  STATEABR ZIP HPHONE WPHONE  EMAIL WEBURL

 do
   echo -e "FNAME :\t $FNAME\n\
LNAME :\t $LNAME\n\
COMPANY :\t $COMPANY\n\
STREET :\t $STREET\n\
CITY :\t $CITY\n\
STATE  :\t $STATE\n\
STATEABR :\t $STATEABR\n\
ZIP :\t $ZIP\n\
HPHONE :\t $HPHONE\n\
WPHONE :\t $WPHONE\n\
EMAIL :\t $EMAIL\n\
WEBURL :\t $WEBURL\n"

 done <<< $lastline
IFS=$OLDIFS

