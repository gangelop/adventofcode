#!/usr/bin/awk -f

{ sum+=$1 }
NF == 0 {
    if ( sum > max ) { max = sum }
    sum = 0 }
END {
    if ( sum > max ) { max = sum }
    print max
}
