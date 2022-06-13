#!/bin/bash

cat input.txt | sed 's/forward /((x+=/g' | sed 's/down /((y+=/g' | sed 's/up /((y-=/g' | sed 's/$/))/g' >> $(basename $0)
printf 'echo $((x*y))\n' >> $(basename $0)
sed -i $(basename $0) -re '6,1006d'
