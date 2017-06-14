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
# Purpose: Copy or move each file to the appropriate directory
# Arguments:
#  individual file name
##################################################################
 
copy(){
#check if file exists
  # if [ $(find  "$1") ];then
  #    DATE=$(stat -c%y  $1 )
  #    ts $DATE # $YEAR , $MONTH and $DAY will be created in ts function from last modified date on file
  #     if [ -z "$MONTH" ] && [ -z "$DAY" ] ;then
  #         echo "Somthing went wrong.No date found"
  #         exit
  #     else 
  #         DES=final/$YEAR/$MONTH/$DAY
  #         mkdir -p $DES
  #     fi
  # else
  #     echo "$1 not found"
  # fi 

    if [ "$3" = "ts" ];then
        DATE=$(stat -c%y  $1 )
        ts "$DATE" # $year , $month and $day will be created in ts function from last modified date on file
          if [ -z "$month" ] && [ -z "$day" ] ;then
              echo "Somthing went wrong.No date found"
              exit
          else
            :
          fi
    fi
    if [ "$3" = "ms" ];then
       ms "$1" # $year , $month and $day will be created in ms function(from metadata) 
    fi
        if [ -z "$make" ] ;then
            make="Unknown"
        fi
        DES="Photos/$year/$month/$day/"
        NewFileName="$year-$month-${day}_${hour}-$minute-${second}_${make}-${model// /}.jpg"
        # echo "Photos/$year/$month/$day/"
        #  echo "$year-$month-${day}_${hour}-$minute-${second}_${make}-${model// /}.jpg"
        mkdir -p $DES
      if [ "$2" -eq 0 ];then
        #Copy each file to the appropriate directory 
         echo " 1 - $1"
         echo "new name - $NewFileName"
         echo "DES - $DES"
        # cp -r $1 $NewFileName $DES
        # echo  "copy $NewFileName to $DES"
      elif [ "$2" -eq 1 ];then
        #moves each file to the appropriate directory if -f (force) is set
        mv $1 $NewFileName $DES
        echo "move $NewFileName to $DES"  
      else 
        echo "somthing went wrong"
        exit
      fi
    }
 
##################################################################
# Purpose: sen file for copy or move to copy function 
# Arguments:
#  individual file name
##################################################################
 beforecopy(){
    if ! which exiv2 > /dev/null; then
      echo "Obviously, exiv2 has not been installed therefore script cannot use file metadata.Do you want to use file Timestamp instead? Please Enter y for yes and n for no ."
      read response
        if [ "$response" = "y" ]; then
          list finalfiles
          for i in $LIST ;do
            if [ "$1" = "-z" ];then
              copy $i 0 ts
              # echo $i >> finallist.txt
            else
              copy $i 1 ts
                  # echo $i >> finallist.txt
            fi
          done
        elif [ "$response" = "n" ]; then
          echo "Good Bye"
        else 
          echo "Y or N allowed."
        fi 
    else
    list finalfiles
          for i in $LIST ;do
            if [ "$1" = "-z" ];then
              copy $i 0 ms
              # echo $i >> finallist.txt
            else
              copy $i ms
                  # echo $i >> finallist.txt
            fi
          done    
    fi
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
    day=$(date -d "$1" '+%d')
    month=$(date -d "$1" '+%m')
    year=$(date -d "$1" '+%Y')
    hour=$(date -d "$1" '+%H')
    minute=$(date -d "$1" '+%M')
    second=$(date -d "$1" '+%S')
fi
#  echo $1
#  echo $DAY
# echo $MONTH
# echo $hour
# echo $minute
# echo $second
}

##################################################################
# Purpose:  get the creation time, date and camera make/model from the embedded metadata data
# Arguments:
#   $1 -> file name 
##################################################################

ms() {  
     IFS=': '
     set $(exiv2 -g Exif.Image.DateTime -Pv "$1")
     unset IFS
     year=$1 month=$2 day=$3 hour=$4 minute=$5 second=$6
     make=$(exiv2 -g Exif.Image.Make -Pv "$1")
     model=$(exiv2 -g Exif.Image.Model -Pv "$1")
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



