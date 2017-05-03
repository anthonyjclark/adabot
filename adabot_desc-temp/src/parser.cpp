
#include <urdf/model.h>
#include "ros/ros.h"

int main(int argc, char* argv[])
{
    ros::init(argc, argv, "adabot_parser");
    if (argc != 2) {
        ROS_ERROR("URDF file required as input argument");
        return EXIT_FAILURE;
    }

    std::string urdf_fname(argv[1]);

    urdf::Model model;
    if (!model.initFile(urdf_fname)) {
        ROS_ERROR("Failed to parse URDF file");
        return EXIT_FAILURE;
    }

    ROS_INFO("Successfully parsed URDF file");
    return EXIT_SUCCESS;
}

