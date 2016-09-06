# adabot


## Install virtual machine software

I am currently using VirtualBox Version 5.0.26 r108824.

## Install a guest operating system

I am currently using ubuntu-16.04.1-desktop with the following properties:

- 4 GB RAM
- 50 GB fixed storage

*Note: I also cloned the image at this point to give myself something easy to fall back on if I manage to mess up the ROS installatin.*

I had a corrupted display during my installation process, so I had to use [this fix from **askubuntu**](http://askubuntu.com/questions/541006/ubuntu-14-10-does-not-install-in-virtualbox)

`Left Cmd` + `fn` + `F1` and then `Left Cmd` + `fn` + `F7`

>This works by forcing the kernel's graphics buffer / X / XRandR to re-detect the monitor and display in the proper resolution.

## Install ROS

Follow the [ROS instructions](http://wiki.ros.org/kinetic/Installation/Ubuntu) to install ROS from packages. The previous link is the *current* release version of ROS as of this writing, which is called **Kinetic**.

### Follow some of the tutorials to test out ROS

I went through the following [tutorials on the wiki](http://wiki.ros.org/ROS/Tutorials).

I also went through the [URDF tutorials](http://wiki.ros.org/urdf/Tutorials) on the wiki.

Finally, the [Using a URDF in Gazebo](http://gazebosim.org/tutorials?tut=ros_urdf) was also quite useful.

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
