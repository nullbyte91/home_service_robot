#!/bin/bash

dRootPath="../../../"

function launch_world(){
    # Launch world file
    xterm -e "pushd ${dRootPath}
    source devel/setup.bash
    export GAZEBO_MODEL_PATH=`rospack find turtlebot3_gazebo`/models/aws_warehouse/:$GAZEBO_MODEL_PATH 
    roslaunch turtlebot3_gazebo turtlebot3_world.launch" &
    sleep 2
}

function launch_navigation(){
    xterm -e "pushd ${dRootPath}
    source devel/setup.bash
    roslaunch turtlebot3_navigation turtlebot3_amcl.launch" &
    sleep 2
}

function launch_rviz(){
    # Launch rviz 
    xterm -e "pushd ${dRootPath}
    source devel/setup.bash
    roslaunch turtlebot3_rviz_launchers view_markers.launch" &
    sleep 2
}

function launch_markers(){
    #Launch markers
    xterm -e "pushd ${dRootPath}
    source devel/setup.bash
    rosparam load src/home_service_robot/add_markers/config/markers.yaml
    rosrun add_markers add_markers" &
    sleep 2
}

#Main starts from here
launch_world
launch_navigation
launch_rviz
launch_markers