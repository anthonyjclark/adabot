#!/usr/bin/env zsh

rostopic pub -1 /adabot/front_left_weg_1_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_left_weg_2_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_left_weg_3_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_left_weg_4_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_left_weg_5_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_left_weg_6_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_left_weg_7_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_left_weg_8_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_left_weg_9_joint_position_controller/command std_msgs/Float64 "data: $1" &

rostopic pub -1 /adabot/front_right_weg_1_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_right_weg_2_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_right_weg_3_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_right_weg_4_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_right_weg_5_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_right_weg_6_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_right_weg_7_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_right_weg_8_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/front_right_weg_9_joint_position_controller/command std_msgs/Float64 "data: $1" &

rostopic pub -1 /adabot/rear_left_weg_1_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_left_weg_2_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_left_weg_3_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_left_weg_4_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_left_weg_5_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_left_weg_6_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_left_weg_7_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_left_weg_8_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_left_weg_9_joint_position_controller/command std_msgs/Float64 "data: $1" &

rostopic pub -1 /adabot/rear_right_weg_1_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_right_weg_2_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_right_weg_3_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_right_weg_4_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_right_weg_5_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_right_weg_6_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_right_weg_7_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_right_weg_8_joint_position_controller/command std_msgs/Float64 "data: $1" &
rostopic pub -1 /adabot/rear_right_weg_9_joint_position_controller/command std_msgs/Float64 "data: $1"
