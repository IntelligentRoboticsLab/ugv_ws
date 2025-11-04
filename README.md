# ugv_ws Workspace to use ROS2 Humble for Waveshare's UGV Rover

This is a fork from https://github.com/waveshareteam/ugv_ws.git, created for the course 'Vision for Autonomous Robots' at the University of Amsterdam.

In the original code of Waveshare, there is explicit reference to the home-directory '/home/ws', while on the UGV itself the home-directory can be found at '/home/jetson'.
At your own machine, you will have own configuration.

Note that the situation is different once you have started the docker image (at the UGV or at your laptop). Note that most of the [Waveshare documentation](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2) assumes that you are inside the docker image. The Intelligent Robotics Lab also reversed engineered a version of the docker image, also available on [github](https://github.com/IntelligentRoboticsLab/ugv_rover_docker).

## 1. Environment

- pc software：Ubuntu 22.04, ROS2 Humble
- ugv Version：UGV Rover

The workspace should also work for the UGV Beast, although this is not tested.

## 2. Installation

- The history of the this workspace can be summarized：(https://github.com/DUDULRX/ugv_ws/tree/ros2-humble) -> (https://github.com/waveshareteam/ugv_ws.git) -> (https://github.com/IntelligentRoboticsLab/ugv_ws.git)

- Start with creating a clone of this repository:
    
    ```jsx
    cd 
    git clone -b ros2-humble-develop https://github.com/IntelligentRoboticsLab/ugv_ws.git
    ```

- Before your first compilation, you should first install a number of dependencies

  ```jsx
  cd ~/ugv_ws
  source install_additional_ros_humble_packages.sh
  ```
  
- install_additional_ros_humble_packages.sh content:
      
   ```jsx
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
      ```
- First compilation (it starts cleans the workspace, so you start from scratch. It also defines a number of environment variables, which is needed only once):
        
  ```jsx
  cd ~/ugv_ws
  . build_first.sh
  ```
        
- build_first.sh content:

  ```jsx
  cd ~/ugv_ws/
  colcon clean workspace
  colcon build --cmake-args -Wno-dev --packages-select cartographer costmap_converter_msgs explore_lite --executor sequential 
  colcon build --cmake-args -Wno-dev --packages-select openslam_gmapping slam_gmapping --executor sequential
  colcon build --cmake-args -Wno-dev --packages-select ldlidar rf2o_laser_odometry robot_pose_publisher teb_msgs --executor sequential  
  colcon build --cmake-args -Wno-dev --packages-select ugv_base_node ugv_interface ugv_bringup ugv_chat_ai ugv_description ugv_gazebo ugv_nav ugv_slam ugv_tools ugv_vision ugv_web_app --executor sequential
  chmod +x ~/ugv_ws/src/ugv_else/vizanti/vizanti_server/scripts/*.py
  colcon build --cmake-args -Wno-dev --packages-select vizanti vizanti_cpp vizanti_demos vizanti_msgs vizanti_server --executor sequential
        
  # echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc ## already done in install_additional_ros_humble_packages.sh
  # echo ""export ROS_DOMAIN_ID=42" >> ~/.bashrc # change ROS_DOMAIN_ID to your group-number
  echo "source ~/ugv_ws/install/setup.bash" >> ~/.bashrc
  echo "export UGV_MODEL=ugv_rover" >> ~/.bashrc
  echo "export LDLIDAR_MODEL=ld19" >> ~/.bashrc
  source ~/.bashrc 
  ```
        
- Daily compilation after first build:
        
  ```jsx
  cd ~/ugv_ws
  . build_common.sh
  ```
        
- build_common.sh content
        
  ```jsx
  cd ~/ugv_ws
  colcon build --cmake-args -Wno-dev --packages-select cartographer costmap_converter_msgs explore_lite --executor sequential
  colcon build --cmake-args -Wno-dev --packages-select openslam_gmapping slam_gmapping --executor sequential
  colcon build --cmake-args -Wno-dev --packages-select ldlidar rf2o_laser_odometry robot_pose_publisher teb_msgs  --executor sequential  
  colcon build --cmake-args -Wno-dev --packages-select ugv_base_node ugv_interface ugv_bringup ugv_chat_ai ugv_description ugv_gazebo ugv_nav ugv_slam ugv_tools ugv_vision ugv_web_app --executor sequential 
  colcon build --cmake-args -Wno-dev --packages-select vizanti vizanti_cpp vizanti_demos vizanti_msgs vizanti_server --executor sequential  
  source install/setup.bash 
        ```

- Compile apriltag
        
  ```jsx
  cd ~/ugv_ws
  . build_apriltag.sh
  ```
        
- build_apriltag.sh content
        
  ```jsx
  sudo apt install libopencv-dev=4.5.4+dfsg-9ubuntu4 -y
  cd ~/ugv_ws
  colcon build --cmake-args -Wno-dev --packages-select apriltag apriltag_msgs apriltag_ros --executor sequential
  ```
        
- Python3 Library：
    
      
  ```jsx
  cd ~/ugv_ws/
  python3 -m pip install -r requirements.txt
  echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.bashrc
  ```
    
- requirements.txt content
    
  ```jsx
  pyserial
  flask
  mediapipe
  requests
  pygame
  ```
    
## Modules inside the workspace

This are the alphabetic-list of the modules in the ugv_ws, which is not the logical build-up as given in [Waveshare documentation](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2).
    
### [ugv_main](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/): Main functions
       
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
    
### ugv_else ( ugv_main dependencies)
   
- [apriltag_ros](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/apriltag_ros): ROS2 wrapper for apriltag detection

  dependence from [ugv_vision](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_vision)

- [cartographer][https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/cartographer]: real-time simultaneous localization, see [ROS Humble documentation][https://docs.ros.org/en/humble/p/cartographer/]

  dependence from [ugv_slam](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_slam)
   
- [costmap_converter](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/costmap_converter): converts occupied costmap2d cells to primitive types. 

  dependence from [ugv_nav navigation](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_nav)
   
- [emcl_ros2](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/emcl2_ros2): Monte Carlo localization

  dependence from [ugv_slam](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_slam)
  
- [explore_lite](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/explore_lite)

  dependence from [ugv_nav navigation](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_nav)
   
- [gmapping](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/gmapping): ROS2 wrapper for OpenSlam's Gmapping.

  dependence from [ugv_slam](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_slam) 
   
- [ldlidar](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/ldlidar): drivers for LiDAR products sold by Shenzhen LDROBOT Co.

  dependence from [ugv_bringup](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_bringup) 
  
- [rf2o_laser_odometry](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/rf2o_laser_odometry): estimate the planar motion from lidar measurements

  dependence from [ugv_bringup](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_bringup) 
   
- [robot_pose_publisher](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/robot_pose_publisher): ROS2 wrapper which publishes  the transform between the /base_link frame and the /map frame as a pose message

  dependence from [ugv_nav navigation](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_nav)
   
- [teb_local_planner](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/teb_local_planner): optimizes the robot's trajectory after planning

  dependence from [ugv_nav navigation](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_nav)
   
- [vizanti](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_else/vizanti): web-based visualization and control tool for outdoor robots
   

## 3. Usage 

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

[Tutorial 3: Use Joystick or Keyboard Control](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_3._Use_Joystick_or_Keyboard_Control)
         
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
      
        
The other functionalities are explained in the documention of the each of the ugv-packages
