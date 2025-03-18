# Camera Calibration 
This repo streamlines the process of performing a single or multi-camera calibration using [Kalibr](https://github.com/ethz-asl/kalibr) camera calibration. To perform camera calibration follow the details below.

**Table of Contents**
   * [1. Prerequisities](#1-prerequisities)
   * [2. Installation](#2-installation)
   * [3. Record Calibration Data](#3-record-calibration-data)
   * [4. Configuration](#4-configuration)
   * [5. Running](#5-running)
   * [6. Results](#6-results)

## 1. Prerequisities
  <details>
  <summary><a href="">X11 Server Utilities</a></summary>
  <br>

  To open RVIZ on your local machine through the docker container, you will need x11 server utils installed on your local machine. This is common to already have this installed on your machine.
  
   ```shell
   sudo apt install x11-xserver-utils
   ```

  </details>
  <details>
  <summary><a href="https://docs.docker.com/engine/install/ubuntu/">Docker</a></summary>
  <br>

  Installation Guide: 🔗 https://docs.docker.com/engine/install/ubuntu/

  </details>
  <details>
  <summary><a href="https://docs.docker.com/engine/install/linux-postinstall/">Docker: Post Installation Steps</a></summary>
  <br>
  
   Installation Guide: 🔗 https://docs.docker.com/engine/install/linux-postinstall/
   
  </details>

## 2. Installation
1. Clone this repo
   
   ```shell
   git clone --recursive https://github.com/frank-Regal/camera_calibration -b noetic
   ```
2. Build and start the Docker 🐳 Image
   > _Run `make help` for a detailed description as to how make is being used for this package._
   
   ```shell
   make start
   ```
   
## 3. Record Calibration Data
1. Setup April Grid Calibration Board
   1. **Use Existing**
      
      - Download a calibration board stored inside the `tags/` directory.
        
   3. **Create Custom**
      
      > See further instructions in [Kalibr Calibration Targets](https://github.com/ethz-asl/kalibr/wiki/calibration-targets)
      1. Open a Docker 🐳 Shell
         
         ```bash
         make shell
         ```
      2. Run the following commands
         
         ``` bash
         source /catkin_ws/devel/setup.bash
         ```

         ``` bash
         cd /tags/april_grids/
         ```
         > The following script will place a file called `target.pdf` in the `tags/april_grids/` directory
         ```bash
         rosrun kalibr kalibr_create_target_pdf --type apriltag --nx [NUM_COLS] --ny [NUM_ROWS] --tsize [TAG_WIDTH_M] --tspace [TAG_SPACING_PERCENT]
         ```
  2. Print the calibration board and paste it to a completely flat surface.
         
  3. Record a ROS bag. As you move the camera, capture the april grid all around the frame of your camera.
   
## 4. Configuration
1. Place the ROS bag you recorded in `data/` directory
   
3. Create a april grid config file and place it in `tags/` directory
   
   > If you used one already included in this repo, the config file is in the same folder as the april grid pdf
   
4. Configure `calibrate.sh` file.
   
   1. `--bag`      - path to ROS bag in `data/` directory
   2. `--topics`   - `sensor_msgs/Image` topics in your ROS bag you want to use for calibration
   3. `--target`   - path to april grid configuration file in `tags/` directory
   4. `--models`   - the models representing your cameras
   5. `--bag-freq` - the frequency at which your want kalibr to read your bag data. Remove this flag if you want to use all frames in the bag (sometimes less is better)

## 5. Running
1. Open a Docker 🐳 Shell
   
   ```shell
   make shell
   ```
3. In the Docker 🐳 Shell, run the following shell script.
   
   ```shell
   calibrate
   ```
   
## 6. Results

1. The results from running calibrate above will be placed in the same directory as your ROS bag.

