#!/usr/bin/env python

"""
This node is responsible for turning smoothing the velocity
odometry data using a moving average.
"""

from collections import deque

import rospy
from std_msgs.msg import Float64
from nav_msgs.msg import Odometry


MAX_LEN = 10
vxs = deque(maxlen=MAX_LEN)
vxs.append(0)
total = 0


def odometry_callback(data):
    global total

    # Get the oldest speed value (if it exists)
    old_val = vxs.popleft() if len(vxs) == MAX_LEN else 0

    # Get the new speed value from the given data
    new_val = data.twist.twist.linear.x

    # Replace the oldest value with the new value
    total = total - old_val + new_val
    vxs.append(new_val)


def publish_smoothed_velocity():

    rate = rospy.Rate(30)
    smooth_publisher = rospy.Publisher('adabot/smooth_velocity', Float64, queue_size=1)

    while not rospy.is_shutdown():

        # AJC: this should probably be a stamped message
        data = Float64()
        data.data = total / len(vxs)
        smooth_publisher.publish(data)

        rate.sleep()


if __name__ == '__main__':
    # Initialize this node
    rospy.init_node('adabot_velocity_smoother')

    # Listen to the joint states published by ros_control
    rospy.Subscriber('adabot/filtered/odometry', Odometry, odometry_callback)

    # Go into the publish loop
    try:
        publish_smoothed_velocity()
    except rospy.ROSInterruptException:
        pass
