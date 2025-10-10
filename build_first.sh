cd ~/ugv_ws
colcon clean workspace -y
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
