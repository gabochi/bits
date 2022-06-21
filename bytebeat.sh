#!/bin/bash

args(){
	expression=$(echo "$@" | sed 's/:[a-Z]* //g')
	./rpn.sh $expression | sed s/m/\*/g
}

#killall -q aplay #>/dev/null 2>&1
#./hstream.sh $(args $@) | xxd -r -p | aplay >/dev/null 2>&1 &
pid=$(ps | grep aplay | awk '{print $1}')
kill -9 $pid

c="putchar($(args $@));"
echo -e "$(head -n 7 program.c) \n ${c} \n $(tail -n 2 program.c)" > temp.c
gcc -o program temp.c
./program | aplay -r 8192 >/dev/null 2>&1 &

