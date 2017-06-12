#!/usr/bin/env python

"""
This node is responsible for turning join state information
into wheel-encoder based odometry.





For detecting slippage, we'll need to do the following:

1. Subscribe to the /adabot/joint_states topic.
2. Convert wheel angular velocities into linear velocity
    a. This requies us to know the radius of the wheels (parameter server?)
    b. We'll also need to take into acount the weg extension length
3. Subscribe to the


> rosmsg show sensor_msgs/JointState
std_msgs/Header header
  uint32 seq
  time stamp
  string frame_id
string[] name
float64[] position
float64[] velocity
float64[] effort
"""

import rospy
from std_msgs.msg import Header
from nav_msgs.msg import Odometry
from sensor_msgs.msg import JointState

from gazebo_msgs.msg import LinkStates

def joint_state_callback(data):
    # wheel_indices = [i for i, s in enumerate(data.name) if '_wheel_join' in s]
    # wheel_names = [data.name[i] for i in wheel_indices]
    # wheel_positions = [data.position[i] for i in wheel_indices]
    # wheel_velocities = [data.velocity[i] for i in wheel_indices]
    # wheel_efforts = [data.effort[i] for i in wheel_indices]

    # print wheel_velocities[0] * 0.08

    # print data.twist[data.name.index('adabot::base_link')]
    # print '-----'

def publish_odometry():
    pass

if __name__ == '__main__':
    # Initialize this node
    rospy.init_node('adabot_odometry', anonymous=True)

    # Listen to the joint states published by ros_control
    # rospy.Subscriber('adabot/joint_states', JointState, joint_state_callback)
    rospy.Subscriber('gazebo/link_states', LinkStates, joint_state_callback)

    # Go into the publish loop
    # while
    rospy.spin()
