#!/bin/bash

alias ssh-fujisaki="ssh ubuntu@10.42.0.89"
alias motor_power_on="ros2 service call /motor_power std_srvs/srv/SetBool '{data: true}'"
mkdir -p .gazebo/
cp -r ~/ros2_ws/src/raspicat_sim/raspicat_gazebo/models ~/.gazebo
sudo chmod 666 /dev/ttyACM0
source ~/gnss_driver_ws/install/setup.bash
alias rtk-sanbu="str2str -in ntrip://:@ntrip1.bizstation.jp:2101/0C06E596#rtcm3 -out serial://ttyACM0:115200"
alias rtk-tsukuba="str2str -in ntrip://:@ntrip1.bizstation.jp:2101/981D3822#rtcm3 -out serial://ttyACM0:115200"
alias right-start="bash $HOME/ros2_ws/src/raspicat_slam_navigation/raspicat_navigation/scripts/right_start_init.bash"
alias left-start="bash $HOME/ros2_ws/src/raspicat_slam_navigation/raspicat_navigation/scripts/left_start_init.bash"
alias tsukuba-launch="ros2 launch raspicat_navigation tsukuba_full.launch.py"
#alias tsukuba-launch="ros2 launch raspicat_navigation tsukuba.launch.py"
alias tsudanuma219-launch="ros2 launch raspicat_navigation tsudanuma_2_19.launch.py"
alias livox-launch="ros2 launch raspicat_navigation livox_2d.launch.py"
alias waypoint-nav-start="bash $HOME/ros2_ws/src/raspicat_slam_navigation/raspicat_navigation/scripts/throw_all_waypoints.bash"
