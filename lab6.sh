#Authot = majid hadji , 4/19/2017 , lab6 cs225 edmonds CC
#script will check to see if each media file in the medialab directory is in medialab/media.xml.


#!/bin/bash
#delete files if they exist
FILELIST="lab6_result.txt medialistfromxml.txt medialistfromfolder.txt "   
for FILE in $FILELIST ; do 
   if [ -f $FILE ]; then
   rm -f $FILE
   fi 
done
#list the media filenames in the medialab folder and XML file in two seprate files  
LISTFROMMEDIAFOLDER=$(find medialab)
LISTFROMXML=$(grep -E '.mp3|.mpg' medialab/media.xml )  

for i in $LISTFROMXML ;do
    i=${i%<*};  i=${i#*>}
    #if [[ $i  ]];then
    echo "$i" >>"medialistfromxml.txt"
    #fi
done
for i in $LISTFROMMEDIAFOLDER ;do
     i=${i#*/} 
     echo "$i" >>"medialistfromfolder.txt"
done


#first step

#Display the number of files in the medialab directory that are not in media.xml

if [ -f "medialistfromfolder.txt" ]; then
 n=0
 if [ -f "lab6_result.txt" ] ;then
     if  ! grep -Fxq "Files not in media.xml:" lab6_result.txt ;then
      echo "Files not in media.xml:" >> "lab6_result.txt"
     fi
   else
      echo "Files not in media.xml:" >> "lab6_result.txt"
  fi

  medial=$(cat medialistfromfolder.txt)
  for i in $medial ;do
     if ! grep -Fxq "$i" medialistfromxml.txt  ;then
         echo "$i"  >>"lab6_result.txt"
	 let n+=1
    fi
  done
   echo "$n media files in medialab directory that are NOT listed in media.xml"  >>"lab6_result.txt"
else
   echo"error in progrom - medialistfromfolder.txt"
   exit 1
fi

#second step
#Display the number of files that are in the media.xml that do not exist in the medialab directory


if [ -f "medialistfromxml.txt"  ]; then
n=0
 if [ -f "lab6_result.txt" ] ;then
     if  ! grep -Fxq "Files not in medialab directory:" lab6_result.txt ;then
      echo "Files not in medialab directory:" >> "lab6_result.txt"
     fi
   else
      echo "Files not in medialab directory:" >> "lab6_result.txt"
   fi

  medial=$(cat medialistfromxml.txt)
  for i in $medial ;do
    if ! grep -Fxq "$i"  medialistfromfolder.txt  ;then
         echo "$i"  >>"lab6_result.txt"
         let n+=1
    fi
  done
   echo "$n media files in media.xml that are NOT in medialab directory"  >>"lab6_result.txt"
  else
   echo "error in progrom - medialistfromxml.txt "
   exit 1

fi

