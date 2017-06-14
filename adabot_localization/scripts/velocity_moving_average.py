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

    old_val = vxs.popleft() if len(vxs) == MAX_LEN else 0
    new_val = data.twist.twist.linear.x

    total = total - old_val + new_val
    vxs.append(new_val)


def publish_odometry():

    rate = rospy.Rate(50)
    smooth_publisher = rospy.Publisher('adabot/smooth_speed', Float64, queue_size=10)
    # odom_broadcaster = TransformBroadcaster()

    while not rospy.is_shutdown():

        # current_time = rospy.get_rostime()

        # # Publish the transform over tf
        # odom_transform = TransformStamped()
        # odom_transform.header.stamp = current_time
        # odom_transform.header.frame_id = 'odom'
        # odom_transform.child_frame_id = 'base_link'
        # odom_transform.transform.rotation.w = 1
        # odom_broadcaster.sendTransform(odom_transform)

        # # Publish the odometry message over ROS
        # odom = Odometry()
        # odom.header.stamp = current_time
        # odom.header.frame_id = 'odom'
        # odom.child_frame_id = 'base_link'
        # # odom.pose.pose = 0
        # odom.twist.twist.linear.x = vx
        # odom_publisher.publish(odom)

        data = Float64()
        data.data = total / len(vxs)
        smooth_publisher.publish(data)

        rate.sleep()


if __name__ == '__main__':
    # Initialize this node
    rospy.init_node('adabot_smoother')

    # Listen to the joint states published by ros_control
    rospy.Subscriber('adabot/filtered/odometry', Odometry, odometry_callback)

    # Go into the publish loop
    try:
        publish_odometry()
    except rospy.ROSInterruptException:
        pass
