#! /usr/bin/awk -f

BEGIN {
        FS = "\t" 
        RS = "\r\n" 
        OFS = FS
        ORS = RS
        MAX_NF = 0
}

{
        for (i = 1; i <= NF; i++) {
                if (i>1) {
                        printf("%s", OFS)
                }
                
                if (i==4) {
                        printf("%s", 2)
                } else if (i==5) {
                        gsub(/-/,"",$i)
                        printf("%s", $i)
                } else if (12 <= i && i <= 18) {
                        printf("%s", 0)
                } else {
                        printf("%s", $i)
                } 
        }
        print ""
}

