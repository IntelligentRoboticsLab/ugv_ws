# ugv_slam
## the module that provides the launch scripts to start the one of the three SLAM algorithms installed on the Waveshare's UGV Rover inside ROS2 Humble

This is a fork from [Waveshare' repository](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_slam), created for the course 'Vision for Autonomous Robots' at the University of Amsterdam.

Installation instructions can be found at [ugv_ws](https://github.com/IntelligentRoboticsLab/ugv_ws). The other functionalities dedicated to Waveshare's UGV-Rover in the documention can be found in [ugv main](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/). This package can have some other dependencies which should be build from source, which can be found at [ugv_else](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_else).

This module provides the scripts which are needed to control your UGV Rover. Multiple nodes are combined into a container, which is more efficient. The module actually provides X launch files:

- *.launch.py
  
At the University of Amsterdam we only have experience with the the UGV Rover which is equiped with a [LD19](https://www.waveshare.com/wiki/DTOF_LIDAR_LD19) lidar. 

# Tutorial

Multiple tutorials from Waveshare use this package:  

- [Tutorial 4: 2D Mapping based on LiDAR](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_4._2D_Mapping_Based_on_LiDAR)
- [Tutorial 5: 3D Mapping based on Depth Camera](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_5._3D_Mapping_Based_on_Depth_Camera)
- [Tutorial 7: Navigation and SLAM Mapping](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_7._Navigation_and_SLAM_Mapping)

Note that to use a visualization tool as RVIZ you should run the commands on system with a display, such as your laptop, and not inside the container running on the UGV Rover.

 # Usage 

The ugv-packages have several parameters, including the hardware configuration, specified as environment variable. The ugv_description uses the environment variable UGV_MODEL to load the correct URDF:

- UGV_MODEL rasp_rover, ugv_rover, ugv_beast
- LDLIDAR_MODEL ld06, ld19, stl27l

## Launch

The module can be started (on your rover) with the following commands:

  ```jsx
 ros2 launch u\X use_rviz:=false
  ```
Each launch script actually starts at least the nodes:

- X



Some of those nodes are called here, but described in other modules, such as X
The nodes specific for this module are Y

Some of these additional nodes are regular ROS2 nodes, such as Z

## More information  
        
The other functionalities are explained in the documention of the each of the [ugv packages](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/) and the [Waveshare documentation](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2).
    
