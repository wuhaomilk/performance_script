#!/bin/sh

COLLECT_NODE=collect_node
SLAM_NODE=slam_node
UTILS_NODE=utils_node
PLANNING_NODE=planning_node
LOG_RECORD_NODE=log_recorder
MIDDLEWARE_NODE=middleware_node

PID_COLLECT_NODE=`pidof ${COLLECT_NODE}`
PID_SLAM_NODE=`pidof ${SLAM_NODE}`
PID_UTILS_NODE=`pidof ${UTILS_NODE}`
PID_PLANNING_NODE=`pidof ${PLANNING_NODE}`
PID_LOG_RECORD_NODE=`pidof ${LOG_RECORD_NODE}`
PID_MIDDLEWARE_NODE=`pidof ${MIDDLEWARE_NODE}`

echo "pid of ${COLLECT_NODE} is ${PID_COLLECT_NODE}"
echo "pid of ${SLAM_NODE} is ${PID_SLAM_NODE}"
echo "pid of ${UTILS_NODE} is ${PID_UTILS_NODE}"
echo "pid of ${PLANNING_NODE} is ${PID_PLANNING_NODE}"
echo "pid of ${LOG_RECORD_NODE} is ${PID_LOG_RECORD_NODE}"
echo "pid of ${MIDDLEWARE_NODE} is ${PID_MIDDLEWARE_NODE}"

pidstat -urds -h -p ${PID_COLLECT_NODE} -p ${PID_SLAM_NODE} -p ${PID_UTILS_NODE} -p ${PID_PLANNING_NODE} -p ${PID_LOG_RECORD_NODE} -p ${PID_MIDDLEWARE_NODE} 2 60 > $1/top.log



echo "----- get top info done: ${1} -------"
# -u :cpu , -r:memery, -d: i/o, -s:stack/heap
# pidstat -urds -h -p ${PID_COLLECT_NODE} 1 > ${COLLECT_NODE}.log

# while true; do
#     COUNT=$(ps -A | grep ${COLLECT_NODE} | wc -l)
#     if [ "$COUNT" != "0" ]; then
#       pidstat -urds -h -p ${PID_COLLECT_NODE} 1 > ${COLLECT_NODE}.log
#       break
#     fi
#     sleep 2 # wait roscore running
# done


# 记录io操作，重定向到COLLECT_NODE文件中
# -e trace=open,close,read,write 追踪指定操作
# -c 输出统计信息
# -o 输出到文件
# -p attach PID
# timeout 10 strace -c -p ${PID_COLLECT_NODE} -o ${COLLECT_NODE}


# 记录io操作，重定向到SLAM_NODE文件中
# timeout 10 strace -c -p ${PID_SLAM_NODE} -o ${SLAM_NODE}