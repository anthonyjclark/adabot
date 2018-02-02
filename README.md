
[![Build Status](https://travis-ci.org/anthonyjclark/adabot.svg?branch=master)](https://travis-ci.org/anthonyjclark/adabot)

# adabot

This is a stack for the adabot robot. Below are instructions for setting up the adabot workspace; they assume that you have correctly setup your development environment. Visit [the adabot wiki](https://github.com/anthonyjclark/adabot/wiki) for more detailed instructions.

```bash
mkdir -p ~/.ros_repos/
cd ~/.ros_repos/
hub clone anthonyjclark/adabot.git
hub fork
mkdir -p ~/ros_workspaces/adabot_ws/src/
ln -s ~/.ros_repos/adabot ~/ros_workspaces/adabot_ws/src/
cd ~/ros_workspaces/adabot_ws/
catkin init
catkin config --profile debug -x _debug --cmake-args -DCMAKE_BUILD_TYPE=Debug
catkin config --profile release -x _release --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin profile set debug
catkin build
```

## TODO

- [ ] add packages for physical device
- [ ] add script for the simple startup
- [ ] change name of components
    - [ ] weg --> ? (leg, extender, ...)
- [ ] fix CI to use custom docker file
- [ ] figure out why "<--" doesn't work in xacro files (in comments)
- [ ] consider making adabot a macro so that more than one can be imported
- [ ] -z argument for urdf_spawner in the gazebo launch file
- [ ] checkout Gazebo's skid steer plugin
- [ ] generate the control yaml file depending on the number of wegs per wheel


- [ ] wegs
    - [ ] tune PID values
    - [ ] tune effort values
    - [ ] velocity values
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
- collision vs inertia vs visual geometries
- inertia macros for different primitives
- dynamic reconfigure to tune PID

- jitter due to high joint forces for low masses

- look at wheel control
- get joint outputs

- starting with a simple process of detecting slippage

- frequencies of sensor and actuator nodes

- node params (n.getParam)

- average /adabot/odom/filtered/twist/twist/linear/x

rqt_plot /adabot/odom/filtered/twist/twist/linear/x /adabot/odometry/twist/twist/linear/x

show how to manually tweak PID values

normalize number of spaces in launch files, etc.

find a better way to implement variable numbers of motors (for wegs)

apt-file search ""
    search installed packages for owner of a file
apt-cache search ""
    grep on package descriptions
dpkg -S ""
    similar to apt-file but works with ROS (without contents file)
apt-cache policy ""
    display installed version and available versions

rostopic hz and bw to test publish rate and bandwidth

controller tuning:
- simulation time step and iterations
- isolate the issue (pid gains, damping, friction)
- low D
- look for high mass differences between connected links
- https://en.wikipedia.org/wiki/Ziegler%E2%80%93Nichols_method
- http://saba.kntu.ac.ir/eecd/pcl/download/PIDtutorial.pdf

http://wiki.ros.org/UnitTesting
http://gazebosim.org/tutorials?tut=contrib_code&cat=development#WriteTests

reset:
- can't call `rosservice call /gazebo/reset_simulation`
    + this call causes all ROS nodes to stop updating for some time??
- call `rosservice call /gazebo/reset_world`
- call
```
rosservice call /set_pose "pose:
    header:
        seq: 0
        stamp: now
        frame_id: odom
    pose:
        pose:
            position: {x: 0.0, y: 0.0, z: 0.0}
            orientation: {x: 0.0, y: 0.0, z: 0.0, w: 1.0}
        covariance: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]"
```
- call similar service on other nodes (create services for my nodes)
- set weg extensions to 0
- set wheel speed to 0


weg extension based on all wheels
check for bad simulation (timeout)

teleop

find a better way to implement variable numbers of motors (for wegs)

- add undriven differential wheels for odometry

- add channel to outside of wheels (for rubber bands)
- offset wegs so that they do not touch each other

- wrap config yaml and control spawner in group namespace
