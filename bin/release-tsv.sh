#!/bin/bash

detect_unnecessary_suffix() {
        echo $1 |awk -F'.' '{printf ".%s.%s\n", $(NF-1), $NF}'
}

list="$@"

for i in $list
do
        suffix=`detect_unnecessary_suffix $i`
        echo mv $i `basename $i $suffix`.tsv
done
