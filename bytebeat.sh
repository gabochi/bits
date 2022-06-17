#!/bin/bash

args(){
	expression=$(echo "$@" | sed 's/:[a-Z]* //g')
	./rpn.sh $expression
}

#killall -q aplay #>/dev/null 2>&1
#./hstream.sh $(args $@) | xxd -r -p | aplay >/dev/null 2>&1 &
c="putchar($(args $@));"

echo -e "$(head -n 7 program.c) \n ${c} \n $(tail -n 2 program.c)"
