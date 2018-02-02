#!/usr/bin/env bash

# Error if any command fails
set -e

# Echo commands and expand variables
echo_and_print() {
    set -x
    "$@"
    set +x
}

# ---------------------------------------------------------
printf "\nInstall testing tools.\n"
apt-get update
apt-get -y install wget

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | apt-key add -

apt-get update
apt-get -y install python-catkin-tools
apt-get -y install ros-lunar-xacro
apt-get -y install liburdfdom-tools

# ---------------------------------------------------------
printf "\nCreating the catkin workspace.\n"

mkdir -p ~/ros_workspaces/adabot_ws/src/
ln -s /home/travis/build/anthonyjclark/adabot ~/ros_workspaces/adabot_ws/src/
cd ~/ros_workspaces/adabot_ws/
catkin init
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Debug

# ---------------------------------------------------------
printf "\nBuilding the source tree.\n"

catkin build

# ---------------------------------------------------------
printf "\nSourcing the workspace setup file.\n"

source ~/ros_workspaces/adabot_ws/devel/setup.bash

# ---------------------------------------------------------
printf "\nTesting the XACRO files.\n"

rosrun xacro xacro --inorder $(rospack find adabot_description)/urdf/adabot.main.xacro > tmp.urdf
check_urdf tmp.urdf

exit 0



###########################################################
# Create a catkin workspace with the package under integration.
###########################################################
# install:
#   - mkdir -p ~/catkin_ws/src
#   - cd ~/catkin_ws/src
#   - catkin_init_workspace
#   # Create the devel/setup.bash (run catkin_make with an empty workspace) and
#   # source it to set the path variables.
#   - cd ~/catkin_ws
#   - catkin_make
#   - source devel/setup.bash
#   # Add the package under integration to the workspace using a symlink.
#   - cd ~/catkin_ws/src
#   - ln -s $CI_SOURCE_PATH .

# ###########################################################
# # Install dependencies
# # This is not currently needed by adabot
# ###########################################################
# before_script:
#   # source dependencies: install using wstool.
#   - cd ~/catkin_ws/src
#   - wstool init
#   - if [[ -f $ROSINSTALL_FILE ]] ; then wstool merge $ROSINSTALL_FILE ; fi
#   - wstool up
#   # package depdencies: install using rosdep.
#   - cd ~/catkin_ws
#   - rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO


# ###########################################################
# # Build adabot
# ###########################################################
# # Compile and test (mark the build as failed if any step fails). If the
# # CATKIN_OPTIONS file exists, use it as an argument to catkin_make, for example
# # to blacklist certain packages.
# #
# # NOTE on testing: `catkin_make run_tests` will show the output of the tests
# # (gtest, nosetest, etc..) but always returns 0 (success) even if a test
# # fails. Running `catkin_test_results` aggregates all the results and returns
# # non-zero when a test fails (which notifies Travis the build failed).
# script:
#   - source /opt/ros/lunar/setup.bash
#   - cd ~/catkin_ws
#   - catkin_make_isolated $( [ -f $CATKIN_OPTIONS ] && cat $CATKIN_OPTIONS )
#   # Run the tests, ensuring the path is set correctly.
#   - source devel/setup.bash
#   - catkin_make run_tests && catkin_test_results
