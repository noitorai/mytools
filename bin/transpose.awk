#! /usr/bin/awk -f

BEGIN {
        FS = "\t"
        RS = "\r\n"
        OFS = FS
        ORS = RS
        MAX_NF = 0
}

{
        if (NF == 0) 
                a[1, NR] = "";
        else
                for  (i = 1; i <= NF; i++) {
                        a[i, NR] = $i;
                }

        if (MAX_NF < NF) MAX_NF = NF
}

END {
        for (i = 1; i <= MAX_NF; i++) {
                if (i >1) printf("%s", ORS);
                for(j = 1; j <= NR; j++) {
                        if (j > 1) printf("%s", OFS);
                        printf("%s", a[i, j]);
                }
        }
        printf("%s", ORS);
}
