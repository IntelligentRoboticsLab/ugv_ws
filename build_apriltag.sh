cd ~/ugv_ws
colcon build --cmake-args -Wno-dev --packages-select apriltag apriltag_msgs apriltag_ros --executor sequential  --symlink-install
cd ~/ugv_ws/
