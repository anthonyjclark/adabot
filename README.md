
[![Build Status](https://travis-ci.org/anthony-jclark/adabot.svg?branch=master)](https://travis-ci.org/anthony-jclark/adabot)

# adabot

This is a workspace for the adabot robot. [[TODO: add description of adabot later]].

## Environment Setup

- Ubuntu 16.04.2 LTS (xenial)
- ROS Kinetic Kame (sudo apt-get install ros-kinetic-desktop-full)

## Directory Structure

Below is the top-level (workspace) directory structure. I've decided to keep all adabot packages together. This makes it easier to developing code, and this code is not likely to be reused by other projects.

```
adabot
└── src
    ├── CMakeLists.txt -> /opt/ros/kinetic/share/catkin/cmake/toplevel.cmake
    ├── adabot_description
    └── adabot_gazebo
```

### adabot_description Package

    ├── adabot_description
    │   ├── CMakeLists.txt
    │   ├── launch
    │   │   ├── display.launch
    │   │   └── display.launch.advanced
    │   ├── package.xml
    │   ├── rviz
    │   │   └── urdf.rviz
    │   ├── src
    │   │   └── parser.cpp
    │   └── urdf
    │       ├── adabot.urdf
    │       ├── adabot.xacro
    │       └── model.urdf

###

    └── adabot_gazebo
        ├── CMakeLists.txt
        ├── launch
        │   └── adabot_world.launch
        ├── package.xml
        └── worlds
            └── adabot.world

## Commonly Used Commands

Before running any commands, the ROS environment needs to be setup. You can run the following command each time you need to use ROS or you can place it in your shell configuration file (e.g., `.bashrc` or `.zshrc`):

- General version: `source /opt/ros/{version}/setup.{bash|zsh}`
- What I use: `source /opt/ros/kinetic/setup.zsh`

## Initial Workspace Setup from the adabot Repository

In general it is a good idea to keep your workspace separate from your git repository (based on "ROS Best Practices"). The main reason to do this is if you'd like to use a cloned package in multiple workspaces. Thus, a good series of commands for getting started on adabot are:

`cd ~/git/`
`git https://github.com/anthony-jclark/adabot.git`
`mkdir -p ~/ros_workspaces/adabot_ws/src/`
`cd ~/ros_workspaces/adabot_ws/`
`ln -s ~/git/adabot ~/ros_workspaces/adabot_ws/src/`
`catkin build adabot`

Once you have your workspace in this configuration, you need to update the ROS environmental variables with your package information. To do this you can source the new configuration file:

- General version: `source <path-to-workspace>/devel/setup.{bash|zsh}`
- What I use: `source devel/setup.zsh`

## Checking and Cleaning the Workspace

If you run into trouble or something gets mixed up you can clean the directory with `clean`. This will delete the *devel* and *build* folder, but it will not touch the *src* folder.
`catkin clean`

You can check your catkin workspace setup with the following command:
`catkin config`

## Building the Workspace

`catkin build <package-name>`

## Other Commands

- rosinstall_generator
- wstool
- vcstool

# Useful Documentation and Tutorials

- [Programming for Robotics - ROS](http://www.rsl.ethz.ch/education-students/lectures/ros.html)
- [ROS Package Template](https://github.com/ethz-asl/ros_best_practices/tree/master/ros_package_template)
- [Example ROS Robot](https://github.com/carlosjoserg/rrbot)
- [[Overview] Getting Starting with Autonomous Robots in ROS via Simulations](http://moorerobots.com/blog/post/6)
- [ROS Documentation](http://wiki.ros.org/)
- [Gazebo Tutorials](http://gazebosim.org/tutorials)






## Creating Robot Model

1. Write Xacro/URDF
    + `rosrun xacro xacro --inorder model.xacro > model.urdf`
    + `check_urdf model.urdf`
    + `urdf_to_graphiz model.urdf`
    + `evince test_robot.pdf`
2. Setup workspace
    + `mkdir src`
    + `cd src`
    + `catkin_init_workspace`
    + `cd ..`
    + `catkin_make`
    + `. devel/setup.bash`
3. Create package
    + `cd src`
    + `catkin_create_pkg <name> <list-of-depends>`
    + edit package.xml (author, maintainer, license, etc.)
4. Editing package
    + `cd <package>/src`
    + add/edit source files
    + `cd ..`
    + update CMakeLists.txt
    + `cd ..`
    + `catkin_make -DCMAKE_BUILD_TYPE=release`
5. Viewing with RViz
    + create launch file
    + create rviz config file
    + `roslaunch <package> <launch-script>`

## TODO

- use proper naming (http://wiki.ros.org/ROS/Patterns/Conventions#Naming_ROS_Resources)
- fix file hierarchy (http://answers.ros.org/question/9273/using-version-control-git-for-ros-development/)

## Note

I left off working with the `rrbot_gazebo` launch file.

## Testing

- Unit testing
- ROStest
- ROSlaunch Check

catkin_make_isolated

build.ros.org?

roslint
