#!/usr/bin/bash
current_dir=$(pwd)
echo "working direc is" $current_dir
mkdir -p $current_dir/ros2_ws/src
cd $current_dir/ros2_ws/src 
#git clone -b feat/gnss-reset git@github.com:CIT-Autonomous-Robot-Lab/emcl2_ros2.git
#git clone -b ros2 git@github.com:rt-net/raspicat_ros.git
#git clone -b mugimaru-2024 git@github.com:CIT-Autonomous-Robot-Lab/raspicat_slam_navigation.git
#git clone -b mugimaru-2024/main git@github.com:CIT-Autonomous-Robot-Lab/gnss2map.git
#git clone -b mugimaru-2024 git@github.com:CIT-Autonomous-Robot-Lab/raspicat_description.git
#git clone -b mugimaru-2024 git@github.com:CIT-Autonomous-Robot-Lab/raspicat_sim.git
#git clone -b master git@github.com:CIT-Autonomous-Robot-Lab/raspimouse2.git
#git clone -b mugimaru-2024 git@github.com:CIT-Autonomous-Robot-Lab/wall_tracking.git
git clone -b mugimaru-2024 https://github.com/CIT-Autonomous-Robot-Lab/pointcloud_to_laserscan.git
git clone https://github.com/kei487/turtlebot3.git
cd $current_dir

mkdir -p $current_dir/ws_livox/src
cd $current_dir/ws_livox/src
git clone -b mugimaru-2024 https://github.com/CIT-Autonomous-Robot-Lab/livox_ros_driver2.git
cd $current_dir

mkdir -p $current_dir/nav2_ws/src
cd $current_dir/nav2_ws/src
git clone -b feat/tsukuba-challenge-2023-ex https://github.com/CIT-Autonomous-Robot-Lab/navigation2.git
cd navigation2
git reset b893e538ffc9667bf0a3ab0c99070439f5521718
cd $current_dir
