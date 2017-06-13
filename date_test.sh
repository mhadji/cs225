
#!/bin/bash

source  finalLibrary.sh

f="finalfiles/IMG_8098.JPG"
  if ! which exiv2 > /dev/null; then
     DATE=$(stat -c%y  $f )
     ts "$DATE" # $year , $month and $day will be created in ts function from last modified date on file
      if [ -z "$month" ] && [ -z "$day" ] ;then
          echo "Somthing went wrong.No date found"
          exit
      else
         :
      fi
  else
     ms "$DATE" # $year , $month and $day will be created in ms function(from metadata) 
 fi
    if [ -z "$make" ] ;then
        make="Unknown"
    fi

    echo "Photos/$year/$month/$day/"
    echo "$year-$month-${day}_${hour}-$minute-${second}_${make}-${model// /}.jpg"