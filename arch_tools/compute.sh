#!/bin/sh

if [ $# -lt 1 ]; then
    echo ""
    echo "USAGE: ./compute_cpu.sh dir1"
    echo "   dir1: directory path for top.log"
    echo "eg: ./compute_cpu.sh /userdata/log-hj/sys-5520"
    echo ""
    exit 1
fi

TOP_LOG=$1/top.log
MEM_LOG=$1/x9-mem.log



compute_max_min_ave_with_percent() {
    awk -v N=$1 'NR>N{if (NR==N+1) {max=$1;min=$1;sum=0} {if ($1>max) max=$1; if ($1<min) min=$1; sum+=$1}} END {if (NR >= 1) printf "Min: %d%%\t Max: %d%%\t Avg: %.3f%%\t dataCount: %d\n", min, max, sum/(NR-N), NR-N}'
}

compute_max_min_ave() {
    awk -v N=$1 'NR>N{if (NR==N+1) {max=$1;min=$1;sum=0} {if ($1>max) max=$1; if ($1<min) min=$1; sum+=$1}} END {if (NR >= 1) printf "Min: %.3f\t Max: %.3f\t Avg: %.3f\t dataCount: %d\n", min, max, sum/(NR-N), NR-N}'
}

echo ""
echo "===================== Result of Loading Test ======================="
echo ""


echo "========================= SOC pidstat CPU =================================="
echo "collect_node     : $(cat ${TOP_LOG} | grep collect_node | awk 'NF==21 {print $8}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "slam_node        : $(cat ${TOP_LOG} | grep slam_node | awk 'NF==21 {print $8}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "planning_node    : $(cat ${TOP_LOG} | grep planning_node | awk 'NF==21 {print $8}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "utils_node       : $(cat ${TOP_LOG} | grep utils_node | awk 'NF==21 {print $8}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "log_recorder     : $(cat ${TOP_LOG} | grep log_recorder | awk 'NF==21 {print $8}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "middleware_node  : $(cat ${TOP_LOG} | grep middleware_node | awk 'NF==21 {print $8}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo ""

echo "========================= SOC Physical Memory (%) ======================"
echo "collect_node     : $(cat ${TOP_LOG} | grep collect_node | awk 'NF==21 {print $14}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "slam_node        : $(cat ${TOP_LOG} | grep slam_node | awk 'NF==21 {print $14}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "planning_node    : $(cat ${TOP_LOG} | grep planning_node | awk 'NF==21 {print $14}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "utils_node       : $(cat ${TOP_LOG} | grep utils_node | awk 'NF==21 {print $14}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "log_recorder     : $(cat ${TOP_LOG} | grep log_recorder | awk 'NF==21 {print $14}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "middleware_node  : $(cat ${TOP_LOG} | grep middleware_node | awk 'NF==21 {print $14}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo ""

echo "========================= SOC io read (%) ======================"
echo "collect_node     : $(cat ${TOP_LOG} | grep collect_node | awk 'NF==21 {print $17}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "slam_node        : $(cat ${TOP_LOG} | grep slam_node | awk 'NF==21 {print $17}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "planning_node    : $(cat ${TOP_LOG} | grep planning_node | awk 'NF==21 {print $17}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "utils_node       : $(cat ${TOP_LOG} | grep utils_node | awk 'NF==21 {print $17}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "log_recorder     : $(cat ${TOP_LOG} | grep log_recorder | awk 'NF==21 {print $17}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "middleware_node  : $(cat ${TOP_LOG} | grep middleware_node | awk 'NF==21 {print $17}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo ""

echo "========================= SOC io write (%) ======================"
echo "collect_node     : $(cat ${TOP_LOG} | grep collect_node | awk 'NF==21 {print $18}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "slam_node        : $(cat ${TOP_LOG} | grep slam_node | awk 'NF==21 {print $18}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "planning_node    : $(cat ${TOP_LOG} | grep planning_node | awk 'NF==21 {print $18}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "utils_node       : $(cat ${TOP_LOG} | grep utils_node | awk 'NF==21 {print $18}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "log_recorder     : $(cat ${TOP_LOG} | grep log_recorder | awk 'NF==21 {print $18}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo "middleware_node  : $(cat ${TOP_LOG} | grep middleware_node | awk 'NF==21 {print $18}' | awk '{gsub(/\%/,"")}1' | compute_max_min_ave_with_percent 0)"
echo ""

if [ -f ${MEM_LOG} ];then
    echo "========================= SOC Physical Memory (MB) ======================"
    echo "collect_node     : $(cat ${MEM_LOG} | grep collect_node | awk '{print $2}' | compute_max_min_ave 0)"
    echo "slam_node        : $(cat ${MEM_LOG} | grep slam_node | awk '{print $2}' | compute_max_min_ave 0)"
    echo "planning_node    : $(cat ${MEM_LOG} | grep planning_node | awk '{print $2}' | compute_max_min_ave 0)"
    echo "utils_node       : $(cat ${MEM_LOG} | grep utils_node | awk '{print $2}' | compute_max_min_ave 0)"
    echo "log_recorder     : $(cat ${MEM_LOG} | grep log_recorder | awk '{print $2}' | compute_max_min_ave 0)"
    echo "middleware_node  : $(cat ${MEM_LOG} | grep middleware_node | awk '{print $2}' | compute_max_min_ave 0)"
    echo ""
else
    echo " "
fi

echo ""
