#Authot = majid hadji , 4/9/2017 , lab1 cs225 edmonds CC
#Prompt the user for a number and check to see if it's larger than 5
 
#!/bin/bash
x=1;
clear
echo -e "This program check to see if the entered number is larger than 5."
	
while [ $x -gt 0 ]
do
        
# getting the number and check it is number
     echo  "Enter a number or [q] for QUIT:"
     read -r user_e 
      if (($(echo "$user_e/1" |bc)  ));then     
        n=$(echo "scale=2; $user_e/1" |bc -l)
       echo $n-n
       r=$(echo "$n%2" |bc )
       echo $r-r       
#check for zero
     elif [ "$user_e" = "0" ];then
        echo "$user_e is even number"
         
     else
#quit the program
        if [ "$user_e" = "q" ];then
           exit;
        else
          echo "you entered $user_e. Please enter a number"
          unset n
        fi 
     fi 
# compare              
        if [[ -v n ]];then
            if [ $(echo "$r/1"|bc ) -eq 0 ];then
              echo "$n even number"
            else
              echo "$n is odd number"
            fi
        fi
done

