#Authot = majid hadji , 4/9/2017 , lab2 cs225 edmonds CC
#Prompt the user for a number and check to see if it's odd or even
 
#!/bin/bash
x=1;
clear
echo -e "This program check to see if the entered number is even or odd"
while [ $x -gt 0 ]
do

# getting the number and check it is number
     echo  "Enter a number or [q] for QUIT:"
     read -r user_e
#quit the program
   if [ "$user_e" = "q" ];then
        exit;

#check for .
   elif [[ $user_e == *.* ]];then
         echo "you entered $user_e. Please enter a number"
         unset n
#check for 0 
   elif [[ $user_e = 0 ]];then
        n=0

#check for + before
   elif [[ $user_e == +* ]];then
#eleminate the +
       m=${user_e/+/}
#check again and create n
         if (($(echo "$m/1" |bc) ));then
            n=$m
         else
         echo "you entered $user_e. Please enter a number"
         unset n      
        fi
     else
      n=$user_e
    fi
# check $n and calculate remainder   
   
       if [[ -v n ]];then
          if [ $(echo "$n%2"|bc ) -eq 0 ];then
            echo "You entered $user_e and it's an even number"
          else
             echo "You entered $user_e and it's an odd number"
          fi
        fi
     
done

