##################################################################
# Purpose: Use in Trap
# Arguments:
#  No Argument
##################################################################
ctrl_c(){
        echo "** No CTRL-C allowed."
}

##################################################################
# Purpose: get the Modified date from file's stats and extract $DAY and $MONTH portion
# Arguments:
#   $1 -> file name 
##################################################################

ts() {    
DAY=$(date -d "$1" '+%d')
MONTH=$(date -d "$1" '+%m')

# echo $1
# echo $DAY
# echo $MONTH
}