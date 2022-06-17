#!/bin/bash

while true
do
    t=$(date +%N)
    CHAR=$((${1}&255))
    printf "%02x" "$CHAR"
done
