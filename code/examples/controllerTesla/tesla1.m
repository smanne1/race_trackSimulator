clc 
close all 
load('/home/shravan/Documents/MATLAB/Add-Ons/Toolboxes/Mobile Robotics Simulation Toolbox/code/examples/controllerTesla/slprj/sim/varcache/mrsDiffDriveModel/varInfo.mat')
load('/home/shravan/Documents/MATLAB/Add-Ons/Toolboxes/Mobile Robotics Simulation Toolbox/code/examples/controllerTesla/slprj/sim/varcache/mrsDiffDriveModel/checksumOfCache.mat')
refVelocity = 5; % in m/s
refTheta = 0; % in radians
bRef = 15; cBW = 1/bRef; % BW of the reference signal
L = 0.25; 
R = 0.06;
x = 500; y = 500; r = 50; l = 100 % center of the track, radius of the track, length of the straight path
C1 = x; C2 = y + r; % starting point
sampleTime = 0.01; %1/100
Plant = PlantA(1);
Controller = ControllerA(1,sampleTime);
Waypoint = WaypointA(x,y,l,r);
Cruise = CruiseA(refVelocity,bRef,l,r);
Cartesian = CartesianA(refVelocity,bRef,l,r,C1,C2);
Lyapunov = LyapunovA(refVelocity,bRef,l,r,C1,C2);

