#!/usr/bin/awk -f

NF == 0 {
    if ( sum > max ) { max = sum }
    sum = 0 }
{ sum+=$1 }
END { print max }
