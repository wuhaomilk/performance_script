#!/bin/sh

# set -x -e -u -o pipefail

# export PATH=$PATH:~/data/hj/bin

COLLECT_NODE=collect_node
SLAM_NODE=slam_node

PID_COLLECT_NODE=`pidof ${COLLECT_NODE}`
PID_SLAM_NODE=`pidof ${SLAM_NODE}`
echo "pid of ${COLLECT_NODE} is ${PID_COLLECT_NODE}"
echo "pid of ${SLAM_NODE} is ${PID_SLAM_NODE}"

perf record -F 99 -p ${PID_COLLECT_NODE} -g -- sleep 60 -o ${COLLECT_NODE}.data && perf script -i ${COLLECT_NODE}.data &> ${COLLECT_NODE}.unfold
echo "----- perf done: ${COLLECT_NODE}-------"
    
# perf record -F 99 -p ${PID_SLAM_NODE} -g -- sleep 60 && perf script >> pid-${PID_SLAM_NODE}-${SLAM_NODE}.perf
# echo "----- perf done: ${SLAM_NODE}-------"
    
echo "----- get perf done -------"
