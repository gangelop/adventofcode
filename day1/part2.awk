#!/usr/bin/awk -f

{ sums[i] += $1 }
NF == 0 { i++ }
END {
    asort(sums)
    len = length(sums)
    print sums[len] + sums[len-1] + sums[len-2]
}
