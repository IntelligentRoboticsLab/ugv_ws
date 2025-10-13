# ugv_ws Workspace Description (Stable)

This is a fork from https://github.com/waveshareteam/ugv_ws.git, created for the course 'Vision for Autonomous Robots' at the University of Amsterdam.

In the original code of Waveshare, there is explicit reference to the home-directory '/home/ws', while on the UGV itself the home-directory can be found at '/home/jetson'.
At your own machine, you will have own configuration.

1.Environment

- pc software：Ubuntu 22.04, ROS2 Humble
- ugv Version：UGV ROVER、UGV BEAST

2.Architecture

- project：https://github.com/DUDULRX/ugv_ws/tree/ros2-humble -> https://github.com/waveshareteam/ugv_ws.git -> https://github.com/IntelligentRoboticsLab/ugv_ws.git
    
    ```jsx
    cd 
    git clone -b ros2-humble-develop https://github.com/IntelligentRoboticsLab/ugv_ws.git
    ```

    - Before your first compilation, you should first install a number of dependencies

      ```jsx
      cd ~/ugv_ws
      source install_additional_ros_humble_packages.sh
      ```
      install_additional_ros_humble_packages.sh content
      
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
    - First compilation on the virtual machine (compiling one by one on the pi or jetson)
        
        ```jsx
        cd ~/ugv_ws
        . build_first.sh
        ```
        
        build_first.sh content
        
        ```jsx
        cd ~/ugv_ws/
        colcon clean workspace
        colcon build --cmake-args -Wno-dev --packages-select cartographer costmap_converter_msgs explore_lite --executor sequential  --symlink-install
        colcon build --cmake-args -Wno-dev --packages-select openslam_gmapping slam_gmapping --executor sequential  --symlink-install
        colcon build --cmake-args -Wno-dev --packages-select ldlidar rf2o_laser_odometry robot_pose_publisher teb_msgs --executor sequential  --symlink-install
        colcon build --cmake-args -Wno-dev --packages-select ugv_base_node ugv_interface ugv_bringup ugv_chat_ai ugv_description ugv_gazebo ugv_nav ugv_slam ugv_tools ugv_vision ugv_web_app --executor sequential  --symlink-install
        chmod +x ~/ugv_ws/src/ugv_else/vizanti/vizanti_server/scripts/*.py
        colcon build --cmake-args -Wno-dev --packages-select vizanti vizanti_cpp vizanti_demos vizanti_msgs vizanti_server --executor sequential  --symlink-install
        
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
        
        build_common.sh content
        
        ```jsx
        cd ~/ugv_ws
        colcon build --cmake-args -Wno-dev --packages-select cartographer costmap_converter_msgs explore_lite --executor sequential  --symlink-install
        colcon build --cmake-args -Wno-dev --packages-select openslam_gmapping slam_gmapping --executor sequential  --symlink-install
        colcon build --cmake-args -Wno-dev --packages-select ldlidar rf2o_laser_odometry robot_pose_publisher teb_msgs  --executor sequential  --symlink-install
        colcon build --cmake-args -Wno-dev --packages-select ugv_base_node ugv_interface ugv_bringup ugv_chat_ai ugv_description ugv_gazebo ugv_nav ugv_slam ugv_tools ugv_vision ugv_web_app --executor sequential  --symlink-install 
        colcon build --cmake-args -Wno-dev --packages-select vizanti vizanti_cpp vizanti_demos vizanti_msgs vizanti_server --executor sequential  --symlink-install
        source install/setup.bash 
        ```
        
    - Compile apriltag
        
        ```jsx
        cd ~/ugv_ws
        . build_apriltag.sh
        ```
        
        build_apriltag.sh content
        
        ```jsx
        cd ~/ugv_ws
        colcon build --cmake-args -Wno-dev --packages-select apriltag apriltag_msgs apriltag_ros --executor sequential  --symlink-install
        ```
        
- Python3 Library：
    
      
    ```jsx
    cd ~/ugv_ws/
    python3 -m pip install -r requirements.txt
    echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.bashrc
    ```
    
    requirements.txt content
    
    ```jsx
    pyserial
    flask
    mediapipe
    requests
    pygame
    ```
    
- Feature pack ugv_ws 
    
    > ugv_main Main functions
    > 
    > 
    > > ugv_base_node Two-wheel differential kinematics
    > > 
    > 
    > > ugv_bringup drive, control
    > > 
    > 
    > > ugv_chat_ai web ai interaction
    > > 
    > 
    > > ugv_description Model
    > > 
    > 
    > > ugv_gazebo simulation
    > > 
    > 
    > > ugv_interface Information interface
    > > 
    > 
    > > ugv_nav navigation
    > > 
    > 
    > > ugv_slam Mapping
    > > 
    > 
    > > ugv_tools tool
    > > 
    > 
    > > ugv_vision visual interaction
    > > 
    > 
    > > ugv_web_app web
    > > 
    
    > ugv_else ( ugv_main dependence)
    > 
    > 
    > > apriltag_ros
    > > 
    > 
    > > cartographer
    > > 
    > 
    > > costmap_converter
    > > 
    > 
    > > emcl_ros2
    > > 
    > 
    > > explore_lite
    > > 
    > 
    > > gmapping
    > > 
    > 
    > > ldlidar
    > > 
    > 
    > > rf2o_laser_odometry
    > > 
    > 
    > > robot_pose_publisher
    > > 
    > 
    > > teb_local_planner
    > > 
    > 
    > > vizanti
    > > 

3.Usage 

The ugv-packages have several parameters, including:

- use_rviz optional true, false (default)

- car model optional rasp_rover, ugv_rover, ugv_beast

- lidar model optional ld06, ld19 (default), stl27l

Graphical tools like rviz only work when you have a display. So, run those tools on your laptop, and the drivers on the UGV Rover


- View model joints
   
        
    - ugv_rover
        
        ```jsx
        export UGV_MODEL=ugv_rover
        ```
        
        start up on (executed on your laptop)
        
        ```jsx
         ros2 launch ugv_description display.launch.py use_rviz:=true
        ```
        
        ![image.png](images/Ugv_rover.png)
        
         
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
        
- Chassis driver  (executed at the UGV Rover)
    
    
    
    ```jsx
    export LDLIDAR_MODEL=LD19
    ```
   
        
        ```jsx
        ros2 launch ugv_bringup bringup_lidar.launch.py use_rviz:=false
        ```
        
           
- Joystick, keyboard control
    
    Start the car  (executed at the UGV Rover)
    
    ```jsx
    ros2 launch ugv_bringup bringup_lidar.launch.py use_rviz:=true
    ```
    
    - Joystick control (can be executed at the UGV Rover or your own laptop, as long as you are in the same ROS_DOMAIN_ID)
        
        ```jsx
        ros2 launch ugv_tools teleop_twist_joy.launch.py
        ```
        
    - keyboard control
        
        ```jsx
        ros2 run ugv_tools keyboard_ctrl
        ```
        
        ![image.png](images/Keyboard%20controls.png)
        
The other functionalities are explained in the documention of the each of the ugv-packages
                

        
        The saved points will also be stored in the file.
        
        ![image.png](images/The%20saved%20points%20will%20also%20be%20stored%20in%20the%20file.png)
