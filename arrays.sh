#!/bin/bash
echo ""

echo "Arrays"
declare -a ARRAY=('bob' 'ted' 'sally')

echo "Item 0 is ${ARRAY[0]}"
echo "Item 1 is ${ARRAY[1]}"
echo "Item 2 is ${ARRAY[2]}"
echo "\${ARRAY[]} has ${#ARRAY[@]} items"
echo "The length of \${ARRAY[1]} is ${#ARRAY[1]}"
echo ""

COUNT=0
echo "Iterating through an array"
for i in "${ARRAY[@]}" ;do
	echo "Item $COUNT is $i"
	(( COUNT++ ))
done
echo ""

echo  "Syncing multiple arrays in the absense of multi-dimensional arrays"
declare -a ARRAYIND=('bob' 'ted' 'sally')
declare -a ARRAYCOL1=('thomas' 'nuget' 'fields')
declare -a ARRAYCOL2=('Seattle' 'LA' 'NYC')
for i in $(seq 0 $(( ${#ARRAYIND[@]} - 1 )) ) ;do
	echo "${ARRAYIND[$i]} ${ARRAYCOL1[$i]} - ${ARRAYCOL2[$i]}"
done
echo ""




echo "Associative arrays"
declare -A DICT=([england]=hello [france]=bonjour)
echo "${DICT[england]} world"
echo "${DICT[france]} world"
echo ""

echo "Iterating through an associative array"
for i in "${!DICT[@]}"
do
  echo "key  : $i"
  echo "value: ${DICT[$i]}"
done


echo ""
array2d="1.1:1.2:1.3 2.1:2.2 3.1:3.2:3.3:3.4"

function process2ndDimension {
    for dimension2 in $*
    do
        echo -n $dimension2 "   "
    done
    echo
}

function process1stDimension {
    for dimension1 in $array2d
    do
        process2ndDimension `echo $dimension1 | tr : " "`
    done
}

process1stDimension

