#Authur = majid hadji , 4/13/2017 , lab4 cs225 edmonds CC
#Prompt the user for a number and check to see if it's between 50-100
 
#!/bin/bash
x=1;
 clear
echo -e "This program check to see if the entered number is between 50 qnd 100."
	
while [ $x -gt 0 ]
do
        
# getting the number and check it is number
     echo  "Enter a number or [q] for QUIT:"
     read -r user_e 
#check for zero 
    if  [[ $user_e == 0 ]]  ;then
        n=0
#check for  0.
    elif [[ $user_e == .* ]] ||  [[ $user_e == 0.* ]] ;then
        n=0
#check for + before
    elif [[ $user_e == +* ]]  ;then
#eleminate the +
        m=${user_e/+/}
#check again and create n
         if (($(echo "$m/1" |bc) ));then
            n=$(echo "scale=2;$m/1" |bc)
         else
           echo "you entered $user_e. Please enter a number"
           unset n
         fi
#check for numbers and letters
    elif [[ $(echo $user_e | grep -E [a-z]) ]] && [ "$user_e" != "q" ] ;then
      echo "you entered $user_e. Please enter a number"
      unset n
#quit the program
    elif [ "$user_e" = "q" ];then
        exit;
    else
      #check for number
       if (($(echo "$user_e/1" |bc ) ));then
        n=$user_e
       else
        echo "you entered $user_e. Please enter a number"
         unset n
       fi
    fi
# compare              
     c1=50
     c2=100
     if [[ -v n ]];then
           if  [ $n -gt $c1 ] && [ $n -lt $c2 ] ;then
              echo "you entered $n and it's between 50 and 100."
              echo "-------------------------"
            else  
              echo "you entered $n and it is NOT between 50 and 100."
              echo "-------------------------"
           fi  
      fi
done

