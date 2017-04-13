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
      if (($(echo "$user_e/1" |bc)  ));then     
       n=$(echo "scale=2; $user_e/1" |bc)
#calculate reminder
        r=$(echo "scale=0;$n%2" |bc -l )
        
     echo $n - n
     echo $r -r 
#quit the program
      elif [ "$user_e" = "q" ];then
       exit;
#check for zero and 0.
     elif  [[ $user_e == 0* ]]  ;then
        r=0
    else
          echo "you entered $user_e. Please enter a number"
          unset user_e 
         
      fi 
# compare              
        if [[ -v n ]];then
            if [ $(echo "$r/1"|bc ) -eq 0 ];then
              echo "$user_e even number"
            else
              echo "$user_e is odd number"
            fi
        fi
done

