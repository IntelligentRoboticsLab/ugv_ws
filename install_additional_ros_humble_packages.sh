#!/bin/bash

sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y

export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo
$VERSION_CODENAME)_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb

sudo apt update && sudo apt upgrade

sudo apt install ros-dev-tools
sudo apt install python3-colcon-clean
sudo apt install ros-humble-desktop

sudo apt-get install ros-humble-nav2-msgs ros-humble-map-msgs
sudo apt-get install ros-humble-nav2-costmap-2d
sudo apt-get install ros-humble-rosbridge-suite
sudo apt-get install ros-humble-nav2-bringup
sudo apt-get install ros-humble-usb-cam ros-humble-depthai-*
sudo apt-get install ros-humble-joint-state-publisher-*
sudo apt-get install ros-humble-robot-localization
sudo apt-get install ros-humble-imu-tools
sudo apt-get install ros-humble-cartographer-ros
sudo apt-get install ros-humble-apriltag ros-humble-apriltag-msgs ros-humble-apriltag-ros
sudo apt-get install ros-humble-ros-gz
