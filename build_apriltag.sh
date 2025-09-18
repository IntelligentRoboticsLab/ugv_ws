cd ~/ugv_ws
cd src/ugv_else/apriltag_ros/apriltag/
cmake -B build -DCMAKE_BUILD_TYPE=Release
sudo cmake --build build --target install
cd ~/ugv_ws
colcon build --cmake-args -Wno-dev --packages-select apriltag_msgs apriltag_ros --executor sequential  --symlink-install
