#!/usr/bin/env zsh

wh_radius=$(rosparam get /wh_radius)
ch_width=$(rosparam get /ch_width)
theta_dot=$1

# theta_dot = (v1 - v2) / wheel_base
# v = v1 = -v2
# theta_dot = 2v / wheel_base
# v = theta_dot * wheel_base / 2
v=$((theta_dot * ch_width / 2.0))

# speed = wh_rate * wh_radius
# wh_rate = speed / wh_radius
wh_rate=$((v / wh_radius))

printf "wh_radius : $wh_radius m\n"
printf "ch_width  : $ch_width m\n"
printf "turn rate : $theta_dot rad/s\n"
printf "speed     : $v m/s\n"
printf "wh_rate   : $wh_rate rad/s\n"

rostopic pub -1 /adabot/front_left_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $wh_rate" > /dev/null &
rostopic pub -1 /adabot/rear_left_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $wh_rate" > /dev/null &

rostopic pub -1 /adabot/front_right_wheel_joint_velocity_controller/command std_msgs/Float64 "data: -$wh_rate" > /dev/null &
rostopic pub -1 /adabot/rear_right_wheel_joint_velocity_controller/command std_msgs/Float64 "data: -$wh_rate" > /dev/null

printf 'done\n'
