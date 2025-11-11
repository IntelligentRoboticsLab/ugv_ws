# ugv_bringup
## the module that provides the launch scripts to start the low-level drivers of the Waveshare's UGV Rover inside ROS2 Humble

This is a fork from [Waveshare' repository](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_description), created for the course 'Vision for Autonomous Robots' at the University of Amsterdam.

Installation instructions can be found at [ugv_ws](https://github.com/IntelligentRoboticsLab/ugv_ws). The other functionalities dedicated to Waveshare's UGV-Rover in the documention can be found in [ugv main](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/). This package can have some other dependencies which should be build from source, which can be found at [ugv_else](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_else).

This module provides the scripts which are needed to control your UGV Rover. Multiple nodes are combined into a container, which is more efficient. The module actually provides three launch files:

- bringup_imu_ekf.launch.py
- bringup_imu_origin.launch.py
- bringup_lidar.launch.py

At the University of Amsterdam we only have experience with the the UGV Rover which is equiped with a [LD19](https://www.waveshare.com/wiki/DTOF_LIDAR_LD19) lidar. 

# Tutorial

A tutorial is available from Waveshare:  [Tutorial 3: Use Joystick or Keyboard Control](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_3._Use_Joystick_or_Keyboard_Control)

Note that to use a visualization tool as RVIZ you should run the commands on system with a display, such as your laptop, and not inside the container running on the UGV Rover.

 # Usage 

The ugv-packages have several parameters, including the hardware configuration, specified as environment variable. The ugv_description uses the environment variable UGV_MODEL to load the correct URDF:

- UGV_MODEL rasp_rover, ugv_rover, ugv_beast
- LDLIDAR_MODEL ld06, ld19, stl27l

## Launch

The module can be started (on your rover) with the following command:

  ```jsx
 ros2 launch ugv_bringup bringup_imu_ekf.launch.py use_rviz:=false
  ```
This launch script actually starts 6 nodes:

- LD19
- base_node
- complementary_filter_gain_node
- ekf_filter_node
- transform_listener
- ugv/robot_state_publisher
- ugv_bringup

Some of those nodes are called here, but described in other modules, such as the base_node from [ugv base_node](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_base_node) and the robot_state_publisher from [ugv description](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_description). 
Another example is the LD19 node, which is actually from [ugv_else/ldlidar](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/ldlidar), a fork from the manufacturer's [driver](https://github.com/ldrobotSensorTeam/ldlidar_stl_ros2.git). Other nodes are regular ROS2 nodes, such as ekf_filter_node from [robot_localization](https://index.ros.org/p/robot_localization/) and complementary_filter_gain_node from [imu_tools](https://github.com/CCNYRoboticsLab/imu_tools/tree/humble).

The nodes specific for this module are ugv_bringup and ugv_driver. ugv_bringup reads out the sensors from the [UGV](https://www.waveshare.com/wiki/UGV02), like odometry, IMU, magnetic field and battery voltage. ugv_driver is the node that subscribes to the /cmd_vel topic and converts those in commands for the motor. In addition, one can control the pan-tilt motors (via the /ugv/joint_states topic) and the leds (via the /ugv/led_ctrl topic).


## More information  
        
The other functionalities are explained in the documention of the each of the [ugv packages](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/) and the [Waveshare documentation](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2).
    
