
[![Build Status](https://travis-ci.org/anthony-jclark/adabot.svg?branch=master)](https://travis-ci.org/anthony-jclark/adabot)

# adabot

This is a stack for the adabot robot. Below are instructions for setting up the adabot workspace; they assume that you have correctly setup your development environment. Visit [the adabot wiki](https://github.com/anthony-jclark/adabot/wiki) for more detailed instructions.

```bash
mkdir -p ~/.ros_repos/
cd ~/.ros_repos/
hub clone anthony-jclark/adabot.git
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

- [ ] add a scaling parameter to the base xacro file
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