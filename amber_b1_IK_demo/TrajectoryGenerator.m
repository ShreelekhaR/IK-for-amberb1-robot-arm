clear
clc
addpath(genpath(pwd));

robot = importrobot('product_b1.urdf');
showdetails(robot)
axes = show(robot);
axes.CameraPositionMode = 'auto';

% Creating trajectory for robot arm
circr = @(radius,rad_ang)  [radius*cos(rad_ang);  radius*sin(rad_ang)];
circd = @(radius,deg_ang)  [radius*cosd(deg_ang);  radius*sind(deg_ang)];
N = 10; 
r_angl = linspace(pi/4, 3*pi/4, N);
radius = 0.3;
xy_r = circr(radius,r_angl);
new_z = xy_r(1,:)+0.25;
new_y = xy_r(2,:)-0.5;
new_x = linspace(0.,0.,N);
disp(new_y);
disp(new_z *2);
% Plotting trajectory
xyz = [new_x; new_y; new_z];
hold on
trajectory = cscvn(xyz);
fnplt(trajectory,'r',2)

eeOffset = 0.12;
eeBody = robotics.RigidBody('end_effector');
%link 7 is end effector
eeBody.Inertia = [0 0 0 0 0 0];
setFixedTransform(eeBody.Joint,trvec2tform([eeOffset 0 0]));
addBody(robot,eeBody,'link7');


ik = robotics.InverseKinematics('RigidBodyTree',robot);
weights = [1 1 1 1 1 1];
initialguess = robot.homeConfiguration;

disp(trajectory);
disp(trajectory.breaks(end));
numTotalPoints = 10;
eePositions = ppval(trajectory,linspace(0,trajectory.breaks(end),numTotalPoints));
disp(eePositions); 

% disp(eePositions(:,8)'); 
% tform = trvec2tform(eePositions(:,8)');
% [configSoln,solnInfo] = ik('link6',tform,weights,initialguess);
% show(robot,configSoln);

% Call inverse kinematics solver for every end-effector position using the
% previous configuration as initial guess
for idx = 1:size(eePositions,2)
    tform = trvec2tform(eePositions(:,idx)');
    configSoln(idx,:) = ik('link6',tform,weights,initialguess);
    initialguess = configSoln(idx,:);
end

%  show(robot,configSoln);

%% Visualize robot configurations
for i = 1:5
    title('Robot waypoint tracking visualization')
    for idx = 1:size(eePositions,2)
        show(robot,configSoln(idx,:), 'PreservePlot', false,'Frames','off');
        pause(0.1)
    end
end
hold off






