#!/usr/bin/env zsh

wh_radius=$(rosparam get /wh_radius)
ax_radius=$(rosparam get /ax_radius)
wg_per_wheel=$(rosparam get /wg_per_wheel)
percent=$1
p=$((percent / 100.0))

# Calculate weg extension based on input percentage
extension=$((p * (wh_radius - ax_radius)))

printf "wh_radius    : $wh_radius m\n"
printf "ax_radius    : $ax_radius m\n"
printf "wg_per_wheel : $wg_per_wheel\n"
printf "percent      : $percent %%\n"
printf "extension    : $extension m\n"

for (( i = 1; i < $wg_per_wheel + 1; i++ )); do
    rostopic pub -1 /adabot/front_left_weg_"$i"_joint_position_controller/command std_msgs/Float64 "data: $extension" > /dev/null &
    rostopic pub -1 /adabot/front_right_weg_"$i"_joint_position_controller/command std_msgs/Float64 "data: $extension" > /dev/null &
    rostopic pub -1 /adabot/rear_left_weg_"$i"_joint_position_controller/command std_msgs/Float64 "data: $extension" > /dev/null &
    rostopic pub -1 /adabot/rear_right_weg_"$i"_joint_position_controller/command std_msgs/Float64 "data: $extension" > /dev/null &
done

bg_pid=$!
wait $bg_pid
printf 'done\n'
