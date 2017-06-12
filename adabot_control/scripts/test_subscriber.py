#!/usr/bin/env python

"""
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
from sensor_msgs.msg import JointState

def callback(data):
    # wheel_indices = [i for i, s in enumerate(data.name) if '_wheel_join' in s]
    # wheel_names = [data.name[i] for i in wheel_indices]
    # wheel_positions = [data.position[i] for i in wheel_indices]
    # wheel_velocities = [data.velocity[i] for i in wheel_indices]
    # wheel_efforts = [data.effort[i] for i in wheel_indices]
    # for n, p, v, e in zip(wheel_names, wheel_positions, wheel_velocities, wheel_efforts):
    #     print n, ":", p, v, e


def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('adabot/joint_states', JointState, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()
