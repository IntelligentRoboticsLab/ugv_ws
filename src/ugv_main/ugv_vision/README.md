# ugv_vision
## the module that provides the launch scripts to publish the images of the two camera on the Waveshare's UGV Rover inside ROS2 Humble

This is a fork from [Waveshare' repository](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_vision), created for the course 'Vision for Autonomous Robots' at the University of Amsterdam.

Installation instructions can be found at [ugv_ws](https://github.com/IntelligentRoboticsLab/ugv_ws). The other functionalities dedicated to Waveshare's UGV-Rover in the documention can be found in [ugv main](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/). This package can have some other dependencies which should be build from source, which can be found at [ugv_else](https://github.com/waveshareteam/ugv_ws/tree/ros2-humble-develop/src/ugv_else).

This module provides the scripts which are needed to control your UGV Rover. Multiple nodes are combined into a container, which is more efficient. The module actually provides X launch files:

- *.launch.py
  
At the University of Amsterdam we only have experience with the the UGV Rover which is equiped with a [LD19](https://www.waveshare.com/wiki/DTOF_LIDAR_LD19) lidar. 

# Tutorial

This module is not explicitly described in a tutorial from Waveshare, although this package is used to see where you going in:  

- [Tutorial 4: 2D Mapping based on LiDAR](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2_4._2D_Mapping_Based_on_LiDAR)

Note that to use a visualization tool as RVIZ you should run the commands on system with a display, such as your laptop, and not inside the container running on the UGV Rover.

 # Usage 

The ugv-packages have several parameters, including the hardware configuration, specified as environment variable. The ugv_description uses the environment variable UGV_MODEL to load the correct URDF:

- UGV_MODEL rasp_rover, ugv_rover, ugv_beast
- LDLIDAR_MODEL ld06, ld19, stl27l

## Launch

### Fish-eye camera

On top of the pan-tilt a camera with a fish-eye lens is mounted. The fish-eye lens gives a field-of-view of 160 degrees. The 5 megapixel sensor is the IMX335. 
See for more details the [WaveShare](https://www.waveshare.com/wiki/IMX335_5MP_USB_Camera_(B)) documentation. 

The module can be started (on your rover) with the following command:

  ```jsx
 ros2 launch *.launch.py use_rviz:=false
  ```

The corresponding visualisation can be started with the command:
  ```jsx
 ros2 run rviz2 rviz2 -d ~/ugv_ws/install/ugv_*/share/ugv_*/rviz/*.rviz
  ```
The launch script actually starts several nodes like:


- /transform_listener


Most of those nodes are called here, but described in other modules, like [ugv bringup](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/ugv_bringup)
The node specific for this module is 

- /*

The slam_gmapping node publishes a number of topics, including:

- /*

The node also publishes the * transform.

## More information  
        
The other functionalities are explained in the documention of the each of the [ugv packages](https://github.com/IntelligentRoboticsLab/ugv_ws/tree/ros2-humble-develop/src/ugv_main/) and the [Waveshare documentation](https://www.waveshare.com/wiki/UGV_Rover_Jetson_Orin_ROS2).
    
