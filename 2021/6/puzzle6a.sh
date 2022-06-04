#!/bin/bash

head -1 $2 > tmp.txt

for (( i=0; i<$1; i++ ))
do
  echo $i
  sed -i 's/0/7,9/g;y/123456789/012345678/' tmp.txt
done

sed -i 's/,//g' tmp.txt
fish=$(wc -m tmp.txt | cut -d ' ' -f 1)
fish=$((fish - 1))
rm tmp.txt
echo $fish
