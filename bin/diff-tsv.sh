#!/bin/bash

PATH=${HOME}/bin:/usr/local/bin:/usr/bin:/bin
export PATH
a=$1
b=$2

diff -u <(transpose.awk $a) <(transpose.awk $b) |nkf
