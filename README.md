## How to run the world after cloning this repo into your home directory.

Run these commands:

cd adabot
catkin_make
source devel/setup.bash
export GAZEBO_MODEL_PATH=~/adabot/src/adabot_gazebo/worlds/worldModels
roslaunch adabot_gazebo adabot_world.launch


## TODO
Please refer to the Trello page.

=======
- [ ] add a scaling parameter to the base xacro file
	+ [x] add scale factor
	+ [ ] set scale factor as argument to xacro flie
- [ ] update rviz launch file
    + [ ] option to use current urdf file
- [ ] update rviz config file
- [ ] update gazebo launch file
    + [ ] pass in world file
- [ ] add words to _gazebo package (and launch files)
- [ ] once simulation is complete start working on physical device
- [ ] every needs to add themselves as authors to appropriate packages
- [ ] adabot empty world needs to use xacro file
- [ ] add script for the simple startup
- [ ] add info about setting up ssh keys on github
- [ ] add general info about using git (git workflow with adabot)
- [ ] change wegs so that that are placed and sizes correctly (currently they are the diameter of the wheel--they should be less than the radius)
- [ ] investigate weg joint parameters (effort and velocity)
- [ ] parameterize weg size
- [ ] fix CI to use custom docker file
- [ ] add all users to the same group
- [ ] figure out why "<--" doesn't work in xacro files (in comments)
- [ ] document: apt list -a --installed "ros-kinetic*control*"
- [ ] consider making adabot a macro so that more than one can be imported
- [ ] work on urdf naming scheme (ax vs joint, etc.)
- [ ] -z argument for urdf_spawner in the gazebo launch file
- [ ] checkout Gazebo's skid steer plugin
- [ ] generate the control yaml file depending on the number of wegs per wheel


- [ ] wegs
    - [ ] tune PID values
    - [ ] tune effort values
- [ ] wheels
    - [ ] add option to display wheel as cylinder instead of sphere
- [ ] all links
    - [ ] select friction model
    - [ ] adjust inertia tensor independent of mass (for jitter)
    - [ ] mu1, mu2, fdir1, kp, kd
- [ ] all joints
    - [ ] adjust limits, velocity, and effort
    - [ ] stopCfm, stopErp, implicitSpringDamper, cfmDamping, fudgeFactor

- run script from launch file to create control yaml and control launch files
- reduce time step
- collision vs inertia vs visual geometries
- inertia macros for different primitives
- dynamic reconfigure to tune PID

- jitter due to high joint forces for low masses

- look at wheel control
- get joint outputs


- starting with a simple process of detecting slippage

- frequencies of sensor and actuator nodes

git clone -b lunar-devel https://github.com/cra-ros-pkg/robot_localization.git
sudo apt-get install ros-lunar-geographic-msgs 


- node params (n.getParam)

- average /adabot/odom/filtered/twist/twist/linear/x

rqt_plot /adabot/odom/filtered/twist/twist/linear/x /adabot/odometry/twist/twist/linear/x

show how to manually tweak PID values

normalize number of spaces in launch files, etc.

find a better way to implement variable numbers of motors (for wegs)