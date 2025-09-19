#!/bin/bash 
cd ~/ugv_ws/install/ugv_gazebo/share/ugv_gazebo/maps
ros2 run nav2_map_server map_saver_cli -f ./map
cd 

