##################################################################
#Authot = majid hadji , 6/17/2017 , Final cs225 edmonds CC
#this library creted for final assignment 
##################################################################
# Purpose: Use in Trap
# Arguments:
#  No Argument
##################################################################
ctrl_c(){
        echo "Cleaning...."
        rm -rf finalfiles
        rm -rf Photos
        tar -xvzf finalfiles.tar.gz
        exit
}

##################################################################
# Purpose: bulding the name for new files and making directory
# Arguments:2
#  $1= individual file name , $2=ts or ms (using file's timestamp or metadata ) 

##################################################################
naming(){
  if [ "$2" = "ts" ];then
        ts "$1" # $year , $month and $day will be created in ts function from last modified date on file
  fi  
  if [ "$2" = "ms" ];then
       ms "$1" # $year , $month and $day will be created in ms function(from metadata) 
  fi
  if [ -z "$year" ];then
       echo "Somthing went wrong.No date found"
       exit
  fi  
  if [ -z "$make" ];then
       make="Unknown"
  fi
  if [ -z "$model" ];then
        model="Unknown"
  fi
  #making directory
  DES="Photos/$year/$month/$day/"
  mkdir -p $DES
  #bulding file name
  NewFileNameWithNoExt="$year-$month-${day}_${hour}-$minute-${second}_${make}-${model// /}"
  #get the extention and make it lower case
  ext=${1##*.}
  ext=${ext,,}
  #check file with same name exists, if so add postfix (-1,-2 etc) 
  NewFileNameWithExt="$NewFileNameWithNoExt.$ext"
  
  if [ -f "$DES/$NewFileNameWithExt" ];then 
     hash1=$(md5sum $1 | awk '{print $1}')
     hash2=$(md5sum $DES/$NewFileNameWithExt | awk '{print $1}')
    #  echo $hash1
    #  echo $hash2
    if [[ "$hash1" = "$hash2" ]];then
       echo "$DES/$NewFileNameWithExt and $1 are the same. No file will move or copy."
       unset pc
    else
      echo "$DES/$NewFileNameWithExt and $1 are NOT the same. File will move or copy with postfix."
      #adding postfix (-1,-2 etc)
      postfix=$(find $DES -name "$NewFileNameWithNoExt*"|wc -l)
      if [ $postfix -gt 0 ];then
         let postfix+1
         postfix="-$postfix"
      else 
          postfix=""
      fi
       NewFileName="$NewFileNameWithNoExt$postfix.$ext"
      #pc is permission to copy.null for no , 1 for yes.    
      pc="1"
    fi
else
      NewFileName="$NewFileNameWithExt"
      #pc is permission to copy.null for no , 1 for yes.    
      pc="1"
fi  
   
}
##################################################################
# Purpose: Copy or move each file to the appropriate directory
# Arguments:3
# $1= individual file name ,$2 = cp or mv $3 = ts or ms (using file's timestamp or metadata ) 
##################################################################
 
copy(){
  #pc is permission to copy.null for no , 1 for yes. value will be assgined by naming function.   
   naming $1 $3 
   echo""
   if [ "$pc" -eq 1 ];then
    if [ "$2" -eq 0 ];then
        #Copy each file to the appropriate directory  
         cp -r "$1" "$DES/$NewFileName"
        # Echo on the screen the current file being processed, the number of the current file and the total number of files.
        # Example:  Copying file 1 of 2014 - file.jpg to Photos/2014/08/24/2014-8-24_8-30-16_Canon-S80-2.jpg
       echo  "copying  $1 to $DES/$NewFileName" 
                
    elif [ "$2" -eq 1 ];then
        #moves each file to the appropriate directory if -f (force) is set
        mv  "$1" "$DES/$NewFileName"
        echo "moved $NewFileName to $DES"  
    else 
        echo "somthing went wrong"
        exit
    fi
    echo "file copied/moved."
  else 
     echo "files were the same and not copied/moved."
  fi    
  }
 
##################################################################
# Purpose: check exiv2 is installed then send file for copy or move to copy function 
# Arguments:
#  individual file name
##################################################################
 beforecopy(){
  
    if ! which exiv2  2>/dev/null; then
      echo "Obviously, exiv2 has not been installed therefore script cannot use file metadata.Do you want to use file Timestamp instead? Please Enter y for yes and n for no ."
      read response
        if [ "$response" = "y" ]; then
          list finalfiles
           total="0"
          for i in $LIST ;do
            if [ "$1" = "-z" ];then
              copy $i 0 ts
            else
              copy $i 1 ts
            fi
            let total+1
            echo "end of loop- "$total
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
            else
              copy $i 1 ms
            fi
            let total+1 
          done  
        
    fi
 aftercopy $total
    
 }
 aftercopy(){
   # Echo out a summary upon completion that includes
       # The number of total files processed. 
        echo "Totally $1 files had processed."
        # The number of JPEGs copied/moved
        echo "$jpgCopied JPEGs copied/moved"
        # The number of JPEGs that were the same and not copied
         echo "$jpgNotCopied JPEGs copied/moved"
        # The number of movies copied/moved
         echo "$notjpgCopied  movies copied/moved"
        # The number of movies that were the same and were not copied  
         echo "$notjpgNotCopied  movies copied/moved"

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
  fd=$(stat -c%y  $1 )
  if [ ! -z "$fd" ];then
    day=$(date -d "$fd" '+%d')
    month=$(date -d "$fd" '+%m')
    year=$(date -d "$fd" '+%Y')
    hour=$(date -d "$fd" '+%H')
    minute=$(date -d "$fd" '+%M')
    second=$(date -d "$fd" '+%S')
  fi
#  echo $1
  # echo $DAY
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
     f=$1
     unset make
     unset model
     md=$(exiv2 -g Exif.Image.DateTime -Pv "$f" 2>/dev/null )
     make=$(exiv2 -g Exif.Image.Make -Pv "$f" 2>/dev/null )
     model=$(exiv2 -g Exif.Image.Model -Pv "$f" 2>/dev/null )

     if [[ -z "$md" ]];then
       ts "$f"
      #  echo $f
      #  echo "from ts - " $year
     else
        IFS=': '
       set $(exiv2 -g Exif.Image.DateTime -Pv "$f" 2>/dev/null )
       year=$1 month=$2 day=$3 hour=$4 minute=$5 second=$6
       unset IFS
      #  echo $f
      #  echo "from ms - " $year - $month

     fi
    #  echo "from out - " $year - $month -  $day -  $hour - $minute - $second - $make - $model
  
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



