#!/bin/bash

# Model Options: 'pinhole-radtan', 'pinhole-equi', 'pinhole-fov', 'omni-none', 'omni-radtan', 'eucm-none', 'ds-none'
source /catkin_ws/devel/setup.bash

rosrun kalibr kalibr_calibrate_cameras \
--bag /data/hl_arl2_calibration/ARL2_KalibrData_v4_c.bag \
--topics /vlc_leftfront/hololens_ag0/vlc_image /vlc_rightfront/hololens_ag0/vlc_image \
--target /tags/april_grids/aprilgrid_4x3_config.yaml \
--models pinhole-radtan pinhole-radtan \
--bag-freq 6 \
--show-extraction