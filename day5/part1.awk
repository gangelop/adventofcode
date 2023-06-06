#!/usr/bin/awk -f

BEGIN {

    # set
    # debug=1
    # for debugging output

    # TODO: parse the input state directly
    stack_count = 9
    max_height = 8
    initial_state =\
    "00G00D0Q0"\
    "P0T00LMZ0"\
    "ZZC00ZGW0"\
    "MBF00PCHN"\
    "TSR0HWRLW"\
    "RTQZRSZFP"\
    "CNHRNHDJQ"\
    "NDMGZFWSS"
    split(initial_state,tmp_array,"")

    # initialize state
    pointer = 1
    for ( h=max_height; h>=1; h-- ) {
        for ( s=1; s<=stack_count; s++ ) {
            if ( tmp_array[pointer] != "0" ) {
                stack[s][h] = tmp_array[pointer]
                #print s, h, stack[s][h]
            }
            pointer++
        }
    }

    if (debug) {
    print "initial state"
    printstate()}
}

function pop(array) {
    if ( length(array) == 0 ) { return }
    else {
        value = array[length(array)]
        delete array[length(array)]
        return value
    }
}

function push(array, value) {
    if ( length(array) == 0 ) { array[1] = value }
    else { array[length(array)+1] = value }
}

function printstate() {
    total_items = 0
    for ( s=1; s<=stack_count; s++ ) {
        printf s": "
        for ( h=1; h <= length(stack[s]); h++ ) {
            printf stack[s][h]
            total_items++
        }
        printf "\n"
    }
    print "total_items:", total_items
    printf "\n"
}

function printstacktops() {
    for ( s=1; s<=stack_count; s++ ) {
        printf stack[s][length(stack[s])]
    }
    printf "\n"
}

NR >= 11 && NF == 6 {
    count = $2
    from = $4
    to = $6

    for ( c=1; c<=count; c++ ) {
        push(stack[to], pop(stack[from]))
    }

    if (debug) {
    print "line", NR":", $0
    printstate()}
}

END {
    if (debug) {
    print "Final state:"
    printstate()
    print "Final stack tops:"}

    printstacktops()
}
