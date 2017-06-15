 
 #!/bin/bash
 hash1=$(md5sum $1 | awk '{print $1}')
     hash2=$(md5sum $2| awk '{print $1}')
     echo $hash1
     echo $hash2
    if [[ "$hash1" = "$hash2" ]];then
           echo "Files are the same."
    else
      echo "Files are different."
    fi  
   