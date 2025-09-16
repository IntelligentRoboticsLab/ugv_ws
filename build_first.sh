cd ~/ugv_ws
colcon build --cmake-args -Wno-dev --packages-select cartographer costmap_converter_msgs explore_lite --executor sequential  --symlink-install
colcon build --cmake-args -Wno-dev --packages-select openslam_gmapping slam_gmapping --executor sequential  --symlink-install
colcon build --cmake-args -Wno-dev --packages-select rf2o_laser_odometry robot_pose_publisher teb_msgs vizanti vizanti_cpp vizanti_demos vizanti_msgs vizanti_server --executor sequential  --symlink-install
colcon build --cmake-args -Wno-dev --packages-select ugv_base_node ugv_interface ugv_bringup ugv_chat_ai ugv_description ugv_gazebo ugv_nav ugv_slam ugv_tools ugv_vision ugv_web_app --executor sequential  --symlink-install 
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "eval "$(register-python-argcomplete ros2)"" >> ~/.bashrc
echo "eval "$(register-python-argcomplete colcon)"" >> ~/.bashrc
echo "source ~/ugv_ws/install/setup.bash" >> ~/.bashrc
source ~/.bashrc 
