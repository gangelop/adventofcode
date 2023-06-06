#!/usr/bin/awk -f

BEGIN { abc = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" }

{
    split($0,line,"")
    mid = length(line)/2
    for (x=1; x<=mid; x++) {
        for (y=mid+1; y<=length(line); y++) {
            if (line[x] == line[y]) {
                score += index(abc, line[x])
                found=1; break}
        }
        if (found) { found=0; break }
    }
}

END { print score }
