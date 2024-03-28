#!/bin/bash
source /home/robot/data/hj/devel/setup.bash
name_array=("/bat_chatter" \
            "/wf5803_chatter" \
            "/ulsound_chatter" \
            "/turbidity_data" \
            "/soc_imu_chatter" \
            "/imu_chatter" \
            "/motor_chatter") 
length=${#name_array[*]}
for((i=0;i< length;i++));
do
    echo "test"
    timeout 5 rostopic hz ${name_array[i]} > log.txt
    content=`sed -n "2,2p" log.txt`
    echo -n "${name_array[i]}:"  >> record.txt
    echo  $content >> record.txt
done 

