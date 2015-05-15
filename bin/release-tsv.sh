#!/bin/bash

detect_unnecessary_suffix() {
        echo $1 |awk -F'.' '{printf ".%s.%s\n", $(NF-1), $NF}'
}

#suffix=$1
#shift
list="$@"

for i in $list
do
        suffix=`detect_unnecessary_suffix $i`
        echo $suffix
        echo mv $i `basename $i $suffix`.tsv
done
