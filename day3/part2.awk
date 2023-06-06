#!/usr/bin/awk -f

BEGIN {
    abc = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
}

c < 3 {
    c++
    split($1,line[c],"")
}
c == 3 {
    for (x=1; x<=length(line[1]); x++) {
        for (y=1; y<=length(line[2]); y++) {
            if (line[1][x] == line[2][y]) {
                for (z=1; z<=length(line[3]); z++) {
                    if (line[1][x] == line[3][z]) {
                        triplematch = line[3][z]
                        score += index(abc, triplematch)
                        found=1; break
                    }
                }
            }
            if (found) { break }
        }
        if (found) { found = 0; break }
    }
    c = 0
}

END { print score }
