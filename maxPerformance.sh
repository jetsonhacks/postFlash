#!/bin/sh
# Set CPU to full performance on NVIDIA Jetson TK1 Development Kit
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   echo "$ sudo "$0""
   exit
fi
 
# To obtain full performance on the CPU (eg: for performance measurements or benchmarking or when you don't care about power draw), you can disable CPU scaling and force the 4 main CPU cores to always run at max performance until reboot:
 
echo 0 > /sys/devices/system/cpu/cpuquiet/tegra_cpuquiet/enable
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# Clock the GPUs to max speed
echo 852000000 > /sys/kernel/debug/clock/override.gbus/rate
echo 1 > /sys/kernel/debug/clock/override.gbus/state

