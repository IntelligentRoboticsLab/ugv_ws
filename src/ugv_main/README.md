# ugv_main
## main functions to control Waveshare's UGV Rover with ROS2 Humble

This is a fork from [Waveshare' repository](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_main), created for the course 'Vision for Autonomous Robots' at the University of Amsterdam.

Installation instructions can be found at [ugv_ws](https://github.com/IntelligentRoboticsLab/ugv_ws). This packages have some other dependencies which should be build from source, which can be found at [ugv_else](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_else).

## Modules inside the workspace

This are the alphabetic-list of the modules in the ugv_ws, which is not the logical build-up as given in [Waveshare documentation](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2).
    
     
- [ugv_base_node](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_base_node): Two-wheel differential kinematics

  Unfortunately no tutorial from WaveShare.
  
- [ugv_bringup](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_bringup): drive, control

  A tutorial is available from Waveshare: [Tutorial 3: Use Joystick or Keyboard Control](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_3._Use_Joystick_or_Keyboard_Control)
   
- [ugv_chat_ai](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_chat_ai): web ai interaction

  A tutorial is available from Waveshare: [Tutorial 8: Web Natural Language Interaction](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_8._Web_Natural_Language_Interaction)
   
- [ugv_description](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_description): Kinematic Model

  A tutorial is available from Waveshare: [Tutorial 2: RViz View Product Model](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_2._RViz_View_Product_Model)
     
- [ugv_gazebo](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_gazebo): simulation

  A tutorial is available from Waveshare: [Tutorial 11: Gazebo Simulation Debugging](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_11._Gazebo_Simulation_Debugging)
  
- [ugv_interface](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_interface): Information interface

  A tutorial is available from Waveshare: [Tutorial 10: Command Interaction](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_10._Command_Interaction)
   
- [ugv_nav navigation](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_nav): Nav2 toolbox

  A tutorial is available from Waveshare: [Tutorial 6: Auto Navigation](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_6._Auto_Navigation)
   
- [ugv_slam](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_slam): Simultaneous Localization and Mapping

  This module is described in three tutorials from Waveshare: 
  - [Tutorial 4: 2D Mapping based on LiDAR](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_4._2D_Mapping_Based_on_LiDAR)
  - [Tutorial 5: 3D Mapping based on Depth Camera](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_5._3D_Mapping_Based_on_Depth_Camera)
  - [Tutorial 7: Navigation and SLAM Mapping](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_7._Navigation_and_SLAM_Mapping)

- [ugv_tools](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_tools): Joystick tool

  This module is used in Waveshare's [Tutorial 3: Use Joystick or Keyboard Control](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_3._Use_Joystick_or_Keyboard_Control)
   
- [ugv_vision](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_vision): visual interaction

  Actually, this module is already used in [Tutorial 4: 2D Mapping based on LiDAR](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_4._2D_Mapping_Based_on_LiDAR)
   
- [ugv_web_app](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_web_app): web-based control tool

  A tutorial is available from Waveshare: [Tutorial 9: Web-based control tool](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_9._Web-based_control_tool)

 # Usage 

The ugv-packages have several parameters, including the hardware configuration, specified as environment variable:

- car model optional rasp_rover, ugv_rover, ugv_beast 

- lidar model optional ld06, ld19 (default), stl27l

You have also parameters given as ros-argument, such as:

- use_rviz optional true, false (default)

Graphical tools like rviz only work when you have a display. So, run those tools on your laptop, and the drivers on the UGV Rover


### View model joints

See also [Tutorial 2: RViz View Product Model](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_2._RViz_View_Product_Model)
   
- Specify your UGV-model
        
  ```jsx
     export UGV_MODEL=ugv_rover
  ```
        
- start up on (executed on your laptop)
        
   ```jsx
   ros2 launch ugv_description display.launch.py use_rviz:=true
   ```
        
  ![image.png](images/Ugv_rover.png)
        
### Drive the car

See also [Tutorial 3: Use Joystick or Keyboard Control](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_3._Use_Joystick_or_Keyboard_Control)
         
- Start the car (executed at the UGV Rover)
        
   ```jsx
   ros2 run ugv_bringup ugv_driver
   ```

- Make sure that your UGV Rover is on the ground. Alternatively lift the wheels from the table by placing the base on a small box.
 
  ```jsx
  ros2 topic pub --once /cmd_vel geometry_msgs/msg/Twist "{linear : {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}"  
  ```
        
  Control the light data 0-255 data[0] control the light IO4 near the oak camera data[1] control the light IO5 near the usb camera
        
        ```jsx
        ros2 topic pub /ugv/led_ctrl std_msgs/msg/Float32MultiArray "{data: [0, 0]}" -1
        ```
        
- Start LiDAR  (executed at the UGV Rover)
    
  ```jsx
  export LDLIDAR_MODEL=LD19
  ```
        
  ```jsx
  ros2 launch ugv_bringup bringup_lidar.launch.py use_rviz:=false
  ```
        
           
- Joystick, keyboard control
    
    - Joystick control (can be executed at the UGV Rover or your own laptop, as long as you are in the same ROS_DOMAIN_ID)
        
        ```jsx
        ros2 launch ugv_tools teleop_twist_joy.launch.py
        ```
        
    - keyboard control
        
        ```jsx
        ros2 run ugv_tools keyboard_ctrl
        ```
      
        
The other functionalities are explained in the documention of the each of the [ugv packages](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/) and the [Waveshare documentation](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2).
    
