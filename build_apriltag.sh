cd ~/ugv_ws
sudo apt install libopencv-dev=4.5.4+dfsg-9ubuntu4 -y

# cd src/ugv_else/apriltag_ros/apriltag/
# cmake -B build -DCMAKE_BUILD_TYPE=Release
# sudo cmake --build build --target install

cd ~/ugv_ws
colcon clean packages --packages-select apriltag apriltag_msgs apriltag_ros -y
colcon build --cmake-args -Wno-dev --packages-select apriltag apriltag_msgs apriltag_ros --executor sequential 
