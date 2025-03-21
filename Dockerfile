# SPDX-FileCopyrightText: 2025 keitaro nakamura keitaro.nkmr@gmail.com
# SPDX-License-Identifier: Apache-2.0

FROM ubuntu:22.04

ARG USERNAME="sentry"
ARG UID_AND_GID=1234
ARG ROS_DISTRO=humble

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    apt-utils \
    bash-completion \
    curl \
    eog \
    git \
    gnupg2 \
    lsb-release \
    network-manager \
    python3 \
    python3-pip \
    python3-tk \
    python3-venv \
    sudo \
    terminator \
    tree \
    tzdata \
    unzip \
    vim \
    wget \
    x11-apps \
    xterm && \
    apt-get autoremove -y -qq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV USERNAME=$USERNAME
ENV USER=$USERNAME
RUN groupadd -g $UID_AND_GID $USERNAME && \
    useradd -ms /bin/bash -u $UID_AND_GID -g $UID_AND_GID -d /home/$USERNAME $USERNAME && \
    chown -R $USERNAME:$USERNAME /home/$USERNAME && \
    echo "$USERNAME ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV TZ="Asia/Tokyo"
RUN echo $TZ > /etc/timezone && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

USER $USERNAME
WORKDIR /home/$USERNAME

COPY setup_scripts/nav2_install.sh /home/$USERNAME/
COPY setup_scripts/cartographer_install.sh /home/$USERNAME/
COPY setup_scripts/build_pkg.sh /home/$USERNAME/
COPY setup_scripts/setup.sh /home/$USERNAME/
#COPY install_packages.bash /home/$USERNAME/
#COPY nav2_install.sh /home/$USERNAME/
RUN . /home/$USERNAME/setup.sh
#RUN . /home/$USERNAME/nav2_install.sh

#FROM ros:humble-ros-core

#RUN apt update \
#    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends --no-install-suggests \
#  ros-dev-tools \
#  wget

#RUN rosdep init \
#     && apt update && apt upgrade -y \
#     && rosdep update \
#     && apt install -y \
#         ros-${ROS_DISTRO}-nav2-bringup \
#         ros-${ROS_DISTRO}-navigation2

CMD ["/bin/bash"]
