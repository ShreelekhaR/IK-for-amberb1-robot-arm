# InverseKinematics
Code to generate trajectories for the amber b1 robot arm.

## Installation

I used MathWorks to run the code online. You can find it [here](https://matlab.mathworks.com/).

## Dependencies

Follow [this](https://www.youtube.com/watch?v=5DnKot3mMSc) tutorial to install the dependencies.

## Usage

Run TrajectoryGenerator.m to generate the trajectory and the plot of the trajectory, it will automatically creating a moving plot of the trajectory and will print the trajectory in the command window. These are the degrees in radians for each joint and can directly be copied into the code for the robot arm API to move the robot arm.

The main thing to note: The trajectory plotted are the positions of the arm at those points IT DOES NOT visualize how the arm moves from one point to another. The arm WILL NOT move smoothly from one position to the other, the path is just a visualization of the positions of the arm at those points.
Please look at the demo video to understand this better.


Feel free to play around with the code and change the trajectory to your liking. :)


<!-- Add video link on img https://youtu.be/1v5fvSyELg0-->

## Demo

[![Demo](https://img.youtube.com/vi/1v5fvSyELg0/0.jpg)](https://www.youtube.com/watch?v=1v5fvSyELg0)