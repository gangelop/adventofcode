#!/usr/bin/gawk -f

# X you need to lose
# Y you need to draw
# Z you need to win
#
# SCORES:
# A/rock     1
# B/paper    2
# C/scissors 3
# loss 0
# draw 3
# win  6

# TODO: I don't quite understand why break is needed here,
# but without break the result is not what I expect.🤔
{ switch ($1) {
    case "A": switch ($2) {
        case "X": score+=3+0; break
        case "Y": score+=1+3; break
        case "Z": score+=2+6; break
    }; break
    case "B": switch ($2) {
        case "X": score+=1+0; break
        case "Y": score+=2+3; break
        case "Z": score+=3+6; break
    }; break
    case "C": switch ($2) {
        case "X": score+=2+0; break
        case "Y": score+=3+3; break
        case "Z": score+=1+6; break
    }; break
}
}
END { print score }
