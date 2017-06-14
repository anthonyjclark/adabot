#!/usr/bin/env python

"""
Extend wegs when it detect slippage.
"""

import rospy
from std_msgs.msg import Float64


weg_extender_topics = [
    'adabot/front_left_weg_1_joint_position_controller/command',
    'adabot/front_left_weg_2_joint_position_controller/command',
    'adabot/front_left_weg_3_joint_position_controller/command',
    'adabot/front_left_weg_4_joint_position_controller/command',
    'adabot/front_left_weg_5_joint_position_controller/command',
    'adabot/front_left_weg_6_joint_position_controller/command',
    'adabot/front_left_weg_7_joint_position_controller/command',
    'adabot/front_left_weg_8_joint_position_controller/command',
    'adabot/front_left_weg_9_joint_position_controller/command',
    'adabot/front_right_weg_1_joint_position_controller/command',
    'adabot/front_right_weg_2_joint_position_controller/command',
    'adabot/front_right_weg_3_joint_position_controller/command',
    'adabot/front_right_weg_4_joint_position_controller/command',
    'adabot/front_right_weg_5_joint_position_controller/command',
    'adabot/front_right_weg_6_joint_position_controller/command',
    'adabot/front_right_weg_7_joint_position_controller/command',
    'adabot/front_right_weg_8_joint_position_controller/command',
    'adabot/front_right_weg_9_joint_position_controller/command',
    'adabot/rear_left_weg_1_joint_position_controller/command',
    'adabot/rear_left_weg_2_joint_position_controller/command',
    'adabot/rear_left_weg_3_joint_position_controller/command',
    'adabot/rear_left_weg_4_joint_position_controller/command',
    'adabot/rear_left_weg_5_joint_position_controller/command',
    'adabot/rear_left_weg_6_joint_position_controller/command',
    'adabot/rear_left_weg_7_joint_position_controller/command',
    'adabot/rear_left_weg_8_joint_position_controller/command',
    'adabot/rear_left_weg_9_joint_position_controller/command',
    'adabot/rear_right_weg_1_joint_position_controller/command',
    'adabot/rear_right_weg_2_joint_position_controller/command',
    'adabot/rear_right_weg_3_joint_position_controller/command',
    'adabot/rear_right_weg_4_joint_position_controller/command',
    'adabot/rear_right_weg_5_joint_position_controller/command',
    'adabot/rear_right_weg_6_joint_position_controller/command',
    'adabot/rear_right_weg_7_joint_position_controller/command',
    'adabot/rear_right_weg_8_joint_position_controller/command',
    'adabot/rear_right_weg_9_joint_position_controller/command',
]


command_velocity = 0
low_velocity_count = 0

def smooth_velocity_callback(data):
    global low_velocity_count

    if data.data < 0.95 * command_velocity and command_velocity > 0:
        low_velocity_count += 1
    else:
        low_velocity_count = 0


def command_callback(data):
    global command_velocity

    command_velocity = data.data * 0.08


def publish_weg_extend():

    # AJC: make this configurable
    rate = rospy.Rate(1)
    weg_publishers = [rospy.Publisher(topic, Float64, queue_size=10) for topic in weg_extender_topics]

    while not rospy.is_shutdown():

        # Publish the odometry message over ROS
        if low_velocity_count > 50:
            print 'Extending wegs.'
            msg = Float64()
            msg.data = 0.05
            for weg_publisher in weg_publishers:
                weg_publisher.publish(msg)

        rate.sleep()


if __name__ == '__main__':
    # Initialize this node
    rospy.init_node('adabot_extender')

    # Listen to the velocity commands
    rospy.Subscriber('adabot/front_left_wheel_joint_velocity_controller/command', Float64, command_callback)

    # Listen to the smooted velocity
    rospy.Subscriber('adabot/smooth_velocity', Float64, smooth_velocity_callback)

    # Go into the publish loop
    try:
        publish_weg_extend()
    except rospy.ROSInterruptException:
        pass
