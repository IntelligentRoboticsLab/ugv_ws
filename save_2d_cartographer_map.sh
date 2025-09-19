#!/bin/bash
cd ~/ugv_ws/install/ugv_nav/share/ugv_nav/maps
ros2 run nav2_map_server map_saver_cli -f ./map
ros2 service call /write_state cartographer_ros_msgs/srv/WriteState "{filename: '~/ugv_ws/install/ugv_nav/share/ugv_nav/maps/map.pbstream'}"
cd 

