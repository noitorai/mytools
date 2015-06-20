#!/bin/sh

awk -F'	' '{print NF;}' $1
