#!/bin/bash

[ -z $1 ] && {
    SEARCH=7
    REPLACE=8
    OCURR=9
}

xxd -p zizek.jpg | sed s/${SEARCH}/${REPLACE}/${OCURR} | xxd -r -p > glitch.jpg
