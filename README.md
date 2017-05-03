
[![Build Status](https://travis-ci.org/anthony-jclark/adabot.svg?branch=master)](https://travis-ci.org/anthony-jclark/adabot)

# adabot

This is a stack for the adabot robot.

## Environment Setup

- Ubuntu 16.04.2 LTS (xenial)
- ROS Kinetic Kame (sudo apt-get install ros-kinetic-desktop-full)

## Directory Structure

Below is the top-level (workspace) directory structure. I've decided to keep all adabot packages together. This makes it easier to develop code, and this code is not likely to be reused by other projects. [This ROS Answers Post](http://answers.ros.org/question/257855/git-strategy-for-catkin-and-package-folders/) has a good explanation of how to effectively use a git repository for multiple packages.

```
adabot
└── src
    ├── CMakeLists.txt -> /opt/ros/kinetic/share/catkin/cmake/toplevel.cmake
    ├── adabot_description
    └── adabot_gazebo
```

### adabot_description Package

### adabot_gazebo Package

## Commonly Used Commands

Before running any commands, the ROS environment needs to be setup. You can run the following command each time you need to use ROS or you can place it in your shell configuration file (e.g., `.bashrc` or `.zshrc`):

- General version: `source /opt/ros/{version}/setup.{bash|zsh}`
- What I use: `source /opt/ros/kinetic/setup.zsh`

To have this command run whenever you start your shell you can run the following command (you only need to do this once):

`echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc`

## Initial Workspace Setup from the adabot Repository

In general it is a good idea to keep your workspace separate from your git repository (based on "ROS Best Practices"). The main reason to do this is if you'd like to use a cloned package in multiple workspaces. Thus, a good series of commands for getting started on adabot are:

```bash
cd ~/git/
git clone https://github.com/anthony-jclark/adabot.git
mkdir -p ~/ros_workspaces/adabot_ws/src/
ln -s ~/git/adabot ~/ros_workspaces/adabot_ws/src/
cd ~/ros_workspaces/adabot_ws/
catkin init
catkin build
```

To checkout a specific branch of the repository you can use the following in place of the second command above:

`git clone https://github.com/anthony-jclark/adabot.git -b branch_name`

Once you have your workspace in this configuration, you need to update the ROS environmental variables with your package information. To do this you can source the new configuration file:

- General version: `source <path-to-workspace>/devel/setup.{bash|zsh}`
- What I use: `source devel/setup.zsh`

If adabot is the only ROS package that you will be working on, then you can add this to your shell configuration file as well.

`echo "source ~/ros_workspaces/adabot_ws/devel/setup.zsh" >> ~/.zshrc`

## Checking and Cleaning the Workspace

If you run into trouble or something gets mixed up you can clean the directory with `clean`. This will delete the *devel* and *build* folder, but it will not touch the *src* folder.

`catkin clean`

You can check your catkin workspace setup with the following command:

`catkin config`

## Building the Workspace

`catkin build <package-name>`

To build packages in release mode add the following to the catkin configuration before building.

`catkin config -DCMAKE_BUILD_TYPE=Release`

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

# Other Tips

- Never edit files in */opt/ros/...*
- Always use version control
    + Don't check in binaries
    + Don't check in generated files (use .gitignore, etc.)
- Leverage 3rd party libraries
- Use ROS Overlays for managing ROS versions
    + Install `rosws`
    + `rosws init ~/fuerte /opt/ros/fuerte/`
    + `source ~/fuerte/setup.zsh`
    + [More Info Here](http://robohow.eu/_media/meetings/first-integration-workshop/ros-best-practices.pdf)
    + [ROS Official Documentation Here](http://wiki.ros.org/catkin/Tutorials/workspace_overlaying)
- You can use an IDE (e.g., Eclipse) to develop and build ROS code









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

## Note

- Working with the `rrbot_gazebo` launch file.
- Fixing the file hierarchy (workspace doesn't belong in repo)

## Testing

- Unit testing
- ROStest
- ROSlaunch Check

catkin_make_isolated

build.ros.org?

roslint
