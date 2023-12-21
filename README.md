# InverseKinematics
Code to generate trajectories for the amber b1 robot arm.

## Installation

I used MathWorks to run the code online. You can find it [here](https://matlab.mathworks.com/).

## Dependencies

Follow [this](https://www.youtube.com/watch?v=5DnKot3mMSc) tutorial to install the dependencies.

## Usage

Run TrajectoryGenerator.m to generate the trajectory and the plot of the trajectory, it will automatically creating a moving plot of the trajectory and will print the trajectory in the command window. These are the degrees in radians for each joint and can directly be copied into the code for the robot arm API to move the robot arm.

Please note that for different positions if you find the arm not reaching, increase the time to reach the position, additionally double check your orientation of the arm to avoid ramming into whatever the arm is mounted on.

Feel free to play around with the code and change the trajectory to your liking. :)