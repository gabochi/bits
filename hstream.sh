#!/bin/bash

while true
do
    ((t++))
    CHAR=$((${1}&255))
    printf "%02x" "$CHAR"
done
