#!/bin/sh


COLLECT_NODE=collect_node
SLAM_NODE=slam_node
PLANNING_NODE=planning_node
UTILS_NODE=utils_node
LOG_RECORD_NODE=log_recorder
MIDDLEWARE_NODE=middleware_node

COUNTER=0
COUNT_MAX=60
SLEEP_SEC=2

while [ ${COUNTER} -lt ${COUNT_MAX} ]; do
    # echo "----- get phys mem start ${COUNTER}-------"
    pidof ${COLLECT_NODE} | xargs -i cat /proc/{}/smaps |grep -i pss |  awk '{Total+=$2} END {printf "collect_node %.3f MB\n", Total/1024}' >>$1/x9-mem.log
    pidof ${SLAM_NODE} | xargs -i cat /proc/{}/smaps |grep -i pss |  awk '{Total+=$2} END {printf "slam_node %.3f MB\n", Total/1024}' >>$1/x9-mem.log
    pidof ${PLANNING_NODE} | xargs -i cat /proc/{}/smaps |grep -i pss |  awk '{Total+=$2} END {printf "planning_node %.3f MB\n", Total/1024}' >>$1/x9-mem.log
    pidof ${UTILS_NODE} | xargs -i cat /proc/{}/smaps |grep -i pss |  awk '{Total+=$2} END {printf "utils_node %.3f MB\n", Total/1024}' >>$1/x9-mem.log
    pidof ${LOG_RECORD_NODE} | xargs -i cat /proc/{}/smaps |grep -i pss |  awk '{Total+=$2} END {printf "log_recorder %.3f MB\n", Total/1024}' >>$1/x9-mem.log
    pidof ${MIDDLEWARE_NODE} | xargs -i cat /proc/{}/smaps |grep -i pss |  awk '{Total+=$2} END {printf "middleware_node %.3f MB\n", Total/1024}' >>$1/x9-mem.log
    # echo "----- get phys mem end   ${COUNTER}-------"
    let COUNTER=COUNTER+1
    sleep ${SLEEP_SEC}
done
echo "----- get phys mem done: ${1} -------"
