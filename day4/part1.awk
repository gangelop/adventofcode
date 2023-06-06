#!/usr/bin/awk -f

BEGIN { FS="," }

{
    split($1,a,"-")
    split($2,b,"-")

    # a is contained in b
    if ( a[1] >= b[1] && a[2] <= b[2] ) { count++; next }

    # b is contained in a
    if ( b[1] >= a[1] && b[2] <= a[2] ) { count++ }
}
END { print count }
