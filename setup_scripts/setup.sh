#!/bin/bash -e
# SPDX-FileCopyrightText: 2024 nacky823 youjiyongmu4@gmail.com
# SPDX-License-Identifier: Apache-2.0

UNIQUE_PS1='${debian_chroot:+($debian_chroot)}\[\\033[01;32m\]\u@\h\[\\033[00m\]:\[\\033[01;34m\]\w\[\\e[1;35m\]$(__git_ps1 "[%s]")\[\\e[m\][\\t]\$ '

echo "" >> $HOME/.bashrc
echo "if [ -f /etc/bash_completion.d/git-prompt ]; then" >> $HOME/.bashrc
echo "  export PS1='${UNIQUE_PS1}'" >> $HOME/.bashrc
echo "fi" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | 
sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

echo "debconf debconf/frontend select Noninteractive" | sudo debconf-set-selections
sudo apt-get update && sudo apt-get install -y \
    ros-humble-desktop \
    python3-rosdep \
    python3-argcomplete \
    python3-colcon-common-extensions \
    gazebo ros-humble-gazebo-*
sudo apt-get autoremove -y -qq
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

sudo rosdep init
rosdep update

echo "source /opt/ros/humble/setup.bash" >> $HOME/.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> $HOME/.bashrc
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> $HOME/.bashrc
echo "export _colcon_cd_root=$HOME" >> $HOME/.bashrc
echo "export RCUTILS_COLORIZED_OUTPUT=1" >> $HOME/.bashrc
echo "source /usr/share/gazebo/setup.bash" >> $HOME/.bashrc
echo "export ROS_DOMAIN_ID=123" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc

python3 -m venv $HOME/tmp_env
. $HOME/tmp_env/bin/activate
pip install --upgrade pip
pip install gdown
gdown 1lnBy0xft0zMjym23NzcneWW6vQMNGQRV -O $HOME/maps.zip 2>&1
deactivate && rm -r $HOME/tmp_env
unzip $HOME/maps.zip && rm $HOME/maps.zip

echo "source ~/ros2_ws/install/setup.bash" >> $HOME/.bashrc
echo "source ~/ws_livox/install/setup.bash" >> $HOME/.bashrc
echo "source ~/nav2_ws/install/setup.bash" >> $HOME/.bashrc

git clone https://github.com/Livox-SDK/Livox-SDK2.git
cd ./Livox-SDK2/
mkdir build
cd build
cmake .. && make -j
sudo make install
cd && rm -rf Livox-SDK2
echo "source ~/.setup.bash" >> $HOME/.bashrc

sudo apt update 
sudo apt install -y ros-humble-nav2-* rtklib

./install_packages.bash
rosdep install -i -y -r --from-path ~/mugimaru-docker/ros2_ws/src/*
rosdep install -i -y -r --from-path ~/mugimaru-docker/ws_livox/src/*
rosdep install -i -y -r --from-path ~/mugimaru-docker/nav2_ws/src/*
rosdep install -i -y -r --from-path ~/mugimaru-docker/gnss_driver_ws/src/*
rm -rf mugimaru-docker

curl -LJO https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
sudo mv yq_linux_amd64 /usr/local/bin/yq
sudo chmod a+x /usr/local/bin/yq

