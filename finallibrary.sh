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
  if [ $(find  "$1") ];then
     DATE=$(stat -c%y  $1 )
     ts $DATE # $YEAR , $MONTH and $DAY will be created in ts function from last modified date on file
      if [ -z "$MONTH" ] && [ -z "$DAY" ] ;then
          echo "Somthing went wrong.No date found"
          exit
      else 
          DIS=final/$YEAR/$MONTH/$DAY
          mkdir -p $DIS
      fi
  else
      echo "$1 not found"
  fi 
      if [ "$2" -eq 0 ];then
        #Copy each file to the appropriate directory 
        cp -r $1  $DIS
        echo  "copy $1 to $DIS"
      elif [ "$2" -eq 1 ];then
        #moves each file to the appropriate directory if -f (force) is set
        mv $1 $DIS
        echo "move $1 to $DIS"  
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
  list finalfiles
  for i in $LIST ;do
      if [ "$1" = "-z" ];then
        copy $i 0
        # echo $i >> finallist.txt
      else
        copy $i 1
            # echo $i >> finallist.txt
      fi
  done
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
DAY=$(date -d "$1" '+%d')
MONTH=$(date -d "$1" '+%m')
YEAR=$(date -d "$1" '+%Y')
fi
#  echo $1
#  echo $DAY
# echo $MONTH
}

##################################################################
# Purpose:  get the creation time, date and camera make/model from the embedded metadata data
# Arguments:
#   $1 -> file name 
##################################################################

ms() {  
if [ ! -z "$1" ];then
DAY=$(date -d "$1" '+%d')
MONTH=$(date -d "$1" '+%m')
YEAR=$(date -d "$1" '+%Y')
fi
#  echo $1
#  echo $DAY
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



