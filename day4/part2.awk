#!/usr/bin/awk -f

BEGIN { FS="," }

{
    split($1,a,"-")
    split($2,b,"-")

    if ( a[2] >= b[1] && a[1] <= b[2] ) {count++}
}
END { print count }
