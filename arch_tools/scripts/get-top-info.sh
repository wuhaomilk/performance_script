#!/bin/sh

# trap 'onCtrlC' INT

# function onCtrlC() {
#     echo "Ctrl+C is captured"
#     exit
# }

COUNTER=0
COUNT_MAX=60
SLEEP_SEC=2

while [ ${COUNTER} -lt ${COUNT_MAX} ]; do
    # echo "----- start ${COUNTER}-------"
    top -b -n 1 >>$1/top.log
    # echo "----- end   ${COUNTER}-------"
    let COUNTER=COUNTER+1
    sleep ${SLEEP_SEC}
done
echo "----- get top info done: ${1} -------"
