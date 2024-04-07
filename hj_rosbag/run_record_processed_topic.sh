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

if [ ! -d "$ROSBAG_STORE_PATH" ] ;then
    mkdir -p $ROSBAG_STORE_PATH
fi

relative_path=$(dirname $0)
ablsolute_path=`pwd`
excute_path="$ablsolute_path/$relative_path"


# echo $excute_path
# cd $ROSBAG_STORE_PATH
now=$(date +"%Y-%m-%d-%H-%M-%S")
rosbag_name=$now.bag

cd $excute_path
#./hj_rosbag record -a --split --size=500 --max-splits=5 -O $rosbag_name   # 500M split.最多存5个文件
./hj_rosbag record -a --min-space=500M -O $ROSBAG_STORE_PATH/$rosbag_name