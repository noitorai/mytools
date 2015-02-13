#!/bin/bash

PATH=${HOME}/bin:/usr/local/bin:/usr/bin:/bin
export PATH

list="$@"
(for i in $list; do echo ==== $i ====; /bin/sh -c "~/bin/transpose.awk $i | cat -n"; done ) | nkf | less 
