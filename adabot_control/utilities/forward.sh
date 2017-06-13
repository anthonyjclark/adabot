#!/usr/bin/env zsh

rostopic pub -1 /adabot/front_left_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $1" &

rostopic pub -1 /adabot/front_right_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $1" &

rostopic pub -1 /adabot/rear_left_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $1" &

rostopic pub -1 /adabot/rear_right_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $1"

