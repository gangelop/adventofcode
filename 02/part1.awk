#!/usr/bin/gawk -f

# A 1
# B 2
# C 3
# loss 0
# draw 3
# win  6

# TODO: I don't quite understand why break is needed here,
# but without break the result is not what I expect.🤔
{ switch ($1) {
    case "A": switch ($2) {
        case "X": score+=3+1; break
        case "Y": score+=6+2; break
        case "Z": score+=3; break
    }; break
    case "B": switch ($2) {
        case "X": score+=1; break
        case "Y": score+=3+2; break
        case "Z": score+=6+3; break
    }; break
    case "C": switch ($2) {
        case "X": score+=6+1; break
        case "Y": score+=2; break
        case "Z": score+=3+3; break
    }; break
}
}
END { print score }
