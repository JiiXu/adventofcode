#!/bin/bash

printf "Answer to puzzle 5a: "
sed 's/,\|->/ /g' $1 | sed 's/   / /g' | awk -f p5a.awk

printf "Answer to puzzle 5b: "
sed 's/,\|->/ /g' $1 | sed 's/   / /g' | awk -f p5b.awk
