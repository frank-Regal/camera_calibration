#!/bin/bash

# Load the ROS environment
source /catkin_ws/devel/setup.bash

# Adjust the following parameters as needed
# --bag: Path to the ROS bag file containing synchronized images
# --topics: ROS topics for the camera stream images in your bag file
# --target: Path to the AprilGrid target configuration file
# --models: Camera models for all cameras in your bag file
#           (Model Options: 'pinhole-radtan', 'pinhole-equi', 'pinhole-fov', 'omni-none', 'omni-radtan', 'eucm-none', 'ds-none')
# --bag-freq: Frequency of how often the bag file is read in Hz 
#           (this does not need to match the frequency of the images in the bag file, but needs to be less than the frequency of the images in the bag file)
# --show-extraction: Show the extraction of the AprilGrid tags

rosrun kalibr kalibr_calibrate_cameras \
--bag /data/[bag_file.bag] \
--topics /camera1/image_raw /camera2/image_raw \
--target /tags/[target_file.yaml] \
--models pinhole-radtan pinhole-radtan \
--bag-freq 6 \
--show-extraction