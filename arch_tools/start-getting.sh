#!/bin/bash

DIR_PREFIX=/userdata/log-hj
LOG_DIR=${DIR_PREFIX}/sys-$(date +%s)
while [ -d ${LOG_DIR} ]; do
   LOG_DIR=${DIR_PREFIX}/sys-$(date +%s)
done
mkdir -p ${LOG_DIR}
echo "create dir: ${LOG_DIR}"

# ./scripts/get-top-info.sh ${LOG_DIR} &
./scripts/node_monitor.sh ${LOG_DIR} &

./scripts/get-phys-mem.sh ${LOG_DIR} &


