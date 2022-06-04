#!/bin/bash

# Use sed to calculate initial state

s=$(head -1 $2)
n=$1

while [[ $(($n % 7)) != 0 ]]
do s=$(echo $s | sed 's/0/7,9/g;y/123456789/012345678/')
n=$((n-1))
done

# Calculate how many weeks remain
weeks=$((n/7))

# Now there are three groups of fish; "young", "teen" and "mature".
# Young fish have a timer of 7 or 8. They don't generate new fish after one week.
# Teen fish have a timer of 5 or 6. After one week, they become one teen and one young fish.
# Mature fish double in number every week.
y=$(expr length $(echo $s | sed 's/[^78]//g'))
t=$(expr length $(echo $s | sed 's/[^56]//g'))
m=$(expr length $(echo $s | sed 's/[,5678]//g'))

for (( i=0; i<weeks; i++ ))
do
# Mature fish double in number every week, and all young fish become mature fish
m=$((2*m))+y
# All young fish that became mature are replenished by the teens
y=$t
done
echo $m
