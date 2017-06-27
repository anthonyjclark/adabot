#!/usr/bin/env zsh

wh_radius=$(rosparam get /wh_radius)
speedcm=$1
speed=$((speedcm / 100.0))

# speed = wh_rate * wh_radius
# wh_rate = speed / wh_radius
wh_rate=$((speed / wh_radius))

printf "wh_radius : $wh_radius m\n"
printf "speed     : $speedcm cm/s\n"
printf "wh_rate   : $wh_rate rad/s\n"

rostopic pub -1 /adabot/front_left_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $wh_rate" > /dev/null &
rostopic pub -1 /adabot/front_right_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $wh_rate" > /dev/null &
rostopic pub -1 /adabot/rear_left_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $wh_rate" > /dev/null &
rostopic pub -1 /adabot/rear_right_wheel_joint_velocity_controller/command std_msgs/Float64 "data: $wh_rate" > /dev/null

printf 'done\n'
