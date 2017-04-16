#Authot = majid hadji , 4/13/2017 , lab3 cs225 edmonds CC
#Check a users ID and if they're root then display a message saying it's insecure to run this script as root. If they are not root then get their home directory from the /etc/password file and display the size of the contents of it. 
 
#!/bin/bash

#Get the users ID exit if it is root 
if [[ EUID -eq 0 ]]; then
   echo "You cannot run this script as root"
   exit
else
#If the user is not root make sure their userid is larger than 500
   if [[ EUID -gt 500 ]]; then
#Check to see if /etc/password exists and is readable
      if [ ! -e /etc/passwd ] || [ ! -r /etc/passwd ] ; then
        echo "/etc/passwd not found or it is not readable!!! "
      else
#Get the users home directory from /etc/passwd
        userhome=$(awk -v uid=$UID -F":" '{ if($3==uid){print $6} }' /etc/passwd)
 #Display the size of their home directory
        userhomesize=$(du --max-depth=0  $userhome | cut -f1 )        
        echo "user home directory size is $userhomesize kb " 
      fi 
   else 
      echo "You cannot run this script with UID = $UID "
      exit
 
   fi

   
fi
  
#Display the size of their home directory
