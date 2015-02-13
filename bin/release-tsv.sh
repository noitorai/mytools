#!/bin/bash

suffix=$1
shift
list="$@"

for i in $list; do echo mv $i `basename $i $suffix`.tsv ; done
