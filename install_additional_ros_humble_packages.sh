#!/bin/bash

# from https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt install software-properties-common
sudo add-apt-repository universe -y

sudo apt update && sudo apt install curl -y

export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb" # If using Ubuntu derivates use $UBUNTU_CODENAME
sudo dpkg -i /tmp/ros2-apt-source.deb

sudo apt update && sudo apt upgrade -y

sudo apt remove libopencv-dev -y # will be installed again together with ros-humble-image-tools, if not removed it will give conflicts with other libopencv-*-dev libraries

sudo apt install ros-dev-tools -y
sudo apt install python3-colcon-clean -y

export ROS_DISTRO="humble" 

sudo apt install ros-${ROS_DISTRO}-desktop -y

# specific for the UGV Rover

sudo apt-get install ros-${ROS_DISTRO}-nav2-msgs ros-${ROS_DISTRO}-map-msgs -y
sudo apt-get install ros-${ROS_DISTRO}-nav2-costmap-2d -y
sudo apt-get install ros-${ROS_DISTRO}-rosbridge-suite -y
sudo apt-get install ros-${ROS_DISTRO}-nav2-bringup -y 
sudo apt-get install ros-${ROS_DISTRO}-usb-cam ros-${ROS_DISTRO}-depthai-ros-driver -y
sudo apt-get install ros-${ROS_DISTRO}-joint-state-publisher-* -y
sudo apt-get install ros-${ROS_DISTRO}-robot-localization -y
sudo apt-get install ros-${ROS_DISTRO}-imu-tools -y
sudo apt-get install ros-${ROS_DISTRO}-cartographer-ros -y
sudo apt-get install ros-${ROS_DISTRO}-libg2o -y
sudo apt-get install ros-${ROS_DISTRO}-apriltag ros-${ROS_DISTRO}-apriltag-msgs ros-${ROS_DISTRO}-apriltag-ros -y
sudo apt-get install ros-${ROS_DISTRO}-ros-gz -y

sudo apt install ros-${ROS_DISTRO}-rosbag2-storage-mcap 

sudo apt update && sudo apt autoremove -y

echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=42" >> ~/.bashrc # change this to your group-number
source ~/.bashrc 
