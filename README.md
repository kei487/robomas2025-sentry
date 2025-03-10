# mugimaru-docker
![docker-image-build-test](https://github.com/CIT-Autonomous-Robot-Lab/mugimaru-docker/actions/workflows/build_test.yml/badge.svg)
## Installation
### Local PC
+ Clone this package
    ```
    cd ~/
    git clone -b mugimaru-2024 git@github.com:CIT-Autonomous-Robot-Lab/mugimaru-docker.git
    ```
+ Clone requirements packages
    ```
    cd ~/mugimaru-docker/
    ./install_packages.bash
    ```
+ Create profile for livox (If you don't have a profile)
    ```
    bash $HOME/mugimaru-docker/ws_livox/src/livox_ros_driver2/scripts/livox-raspi_setup_profile.sh
    ```
+ Docker image build command
    ```
    ./build.sh
    ```
+ Run container command
    ```
    ./run_container
    ```
### Docker container
+ Build workspaces
    ```
    # nav2_ws
    cd ~/nav2_ws
    # rosdep update
    # rosdep install -y --from-paths src/* --ignore-src --rosdistro $ROS_DISTRO 
    colcon build --symlink-install --packages-select nav2_msgs nav2_rviz_plugins nav2_waypoint_follower
    
    # ros2_ws
    cd ~/ros2_ws 
    # rosdep update
    # rosdep install -y --from-paths src/* --ignore-src --rosdistro $ROS_DISTRO 
    colcon build --symlink-install
    
    # ws_livox
    cd ~/ws_livox/src/livox_ros_driver2 && ./build.sh humble
    cd ~/
    source ~/.bashrc
    ```
## Navigation
### Simulation (Tsudanuma campus)
+ Terminal1
    ```
    ros2 launch raspicat_gazebo raspicat_with_tsudanuma_campus.launch.py
    ```
+ Terminal2
    ```
    ros2 launch raspicat_navigation tsudanuma_campus.launch.py
    ```
### Actual Robot
+ Terminal1
   ```
   ros2 launch raspicat_gazebo livox_2d.launch.py
   ```
+ Terminal2
   + Tsudanuma building 2 19th floor
    ```
    ros2 launch raspicat_navigation tsudanuma_2_19.launch.py
    ```
   + Tsudanuma campus
   ```
   ros2 launch raspicat_navigation tsudanuma_campus.launch.py
   ```
   + Tsukuba
   ```
   ros2 launch raspicat_navigation tsukuba.launch.py
   ```
## Memo
- 上記の手順以降で、イメージに対して行った変更
    - gnss_driver_ws以下でrosdep install
   
