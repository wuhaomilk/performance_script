#!/bin/bash
source /home/robot/data/hj/devel/setup.bash

ROSBAG_STORE_PATH=$1

if [ ! -n "$1" ] ;then
    ROSBAG_STORE_PATH=~/data/hj/bag
else
    echo "the word you input is $1"
    ROSBAG_STORE_PATH=$1
fi
DATE=`date +%Y%m%d`
ROSBAG_STORE_PATH=$ROSBAG_STORE_PATH/$DATE
echo "the current rosbag save path:$ROSBAG_STORE_PATH"
mkdir $ROSBAG_STORE_PATH
cd $ROSBAG_STORE_PATH
# TOPIC_LIST="/bat_chatter /depth_chatter /ulsound_chatter /turbidity_data /soc_imu_chatter /imu_chatter /motor_chatter "
# TOPIC_LIST=$TOPIC_LIST" tf  "
now=$(date +"%Y-%m-%d-%H-%M-%S")
rosbag_name=$now.bag

#./hj_rosbag record -a --split --size=500 --max-splits=5 -O $rosbag_name   # 500M split.最多存5个文件
./hj_rosbag record -a --min-space=500M -O $rosbag_name

