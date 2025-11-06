# ugv_description
## the module that provides the shape and configuration of the Waveshare's UGV Rover inside ROS2 Humble

This is a fork from [Waveshare' repository](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_description), created for the course 'Vision for Autonomous Robots' at the University of Amsterdam.

Installation instructions can be found at [ugv_ws](https://github.com/IntelligentRoboticsLab/ugv_ws). The other functionalities dedicated to Waveshare's UGV-Rover in the documention can be found in [ugv main](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/). This package can have some other dependencies which should be build from source, which can be found at [ugv_else](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_else).

This module defines how a UGV mobile robot looks and is configured. The configuration is actually described in three different Unified Robotics Description Format (URDF) files:

- [rasp_rover.urdf](https://www.waveshare.com/wiki/RaspRover)
- [ugv_beast.urdf](https://www.waveshare.com/wiki/UGV_Beast_PT_Jetson_Orin_AI_Kit)
- [ugv_rover.urdf](https://www.waveshare.com/wiki/UGV_Rover_PT_Jetson_Orin_AI_kit)

At the University of Amsterdam we only have experience with the latter mobile robot; the UGV Rover. The definition is publish to be used by other nodes as a (/robot_description) topic.

# Tutorial

A tutorial is available from Waveshare: [Tutorial 2: RViz View Product Model](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_2._RViz_View_Product_Model)

Note that to use a visualization tool as RVIZ you should run the commands on system with a display, such as your laptop, and not inside the container running on the UGV Rover.

 # Usage 

The ugv-packages have several parameters, including the hardware configuration, specified as environment variable. The ugv_description uses the environment variable UGV_MODEL to load the correct URDF:

- UGV_MODEL rasp_rover, ugv_rover, ugv_beast

## Launch

The module can be started (on your laptop) with the following command:

  ```jsx
  ros2 launch ugv_description display.launch.py use_rviz:=true
  ```
This launch script actually starts 4 nodes:

- rviz2
- transform_listener
- ugv/joint_state_publisher
- ugv/robot_state_publiser

Two of those nodes show up as windows at your screen: RVIZ and Joint State Publisher:

 ![image.png](../../../images/ugv_rover.png)

The node that actually publishes the topic /robot_description is the ugv/robot_state_publiser. The transform_listener is used for logging.

## More information  
        
The other functionalities are explained in the documention of the each of the [ugv packages](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/) and the [Waveshare documentation](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2).
    
