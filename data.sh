
#!/bin/bash
source  finalLibrary.sh
     DATE=$(stat -c%y  finalfiles/img_1776.jpg )
     ts $DATE # $YEAR , $MONTH and $DAY will be created in ts function from last modified date on file
      if [ -z "$MONTH" ] && [ -z "$DAY" ] ;then
          echo "Somthing went wrong.No date found"
          exit
      else 
          DIS=final/$YEAR/$MONTH/$DAY
          echo "from ds function - " $DIS
      fi

 

IFS=': '
set $(exiv2 -g Exif.Image.DateTime -Pv finalfiles/img_1776.jpg)
unset IFS
year=$1 month=$2 day=$3 hour=$4 minute=$5 second=$6
echo $year
echo $month
echo $day 
echo $hour
echo $minute
echo $second

echo ""

IFS=' '
set $(exiv2 -g Exif.Image.Make -Pv finalfiles/img_1776.jpg)
unset IFS
var1=$1 var2=$2 var3=$3 var4=$4 var5=$5 var6=$6
echo "var1 = "$var1
echo "var2 = "$var2
echo "var3 = "$var3
echo "var4 = "$var4
echo "var5 = "$var5
echo "var6 = "$var6 
 