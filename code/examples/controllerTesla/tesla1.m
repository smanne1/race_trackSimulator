clc 
close all 
load('/home/shravan/Documents/MATLAB/Add-Ons/Toolboxes/Mobile Robotics Simulation Toolbox/code/examples/controllerTesla/slprj/sim/varcache/mrsDiffDriveModel/varInfo.mat')
load('/home/shravan/Documents/MATLAB/Add-Ons/Toolboxes/Mobile Robotics Simulation Toolbox/code/examples/controllerTesla/slprj/sim/varcache/mrsDiffDriveModel/checksumOfCache.mat')
%% Nominal Plant 
d = 0.0107; Veq = 2, Weq = 0; L = 0.28; AR = L/0.25; Iw = 1.67e-06; dw = 0.25; md = 0;



%%
refVelocity = 4; % in m/s
refTheta = 0; % in radians
bRef = 10; cBW = 1/bRef; % BW of the reference signal (Hz)
L = 0.25; % distance between the wheels dw
R = 0.042;
x = 500; y = 500; r = 10; l = 10 % center of the track, radius of the track, length of the straight path
C1 = x; C2 = y + r; % starting point
sampleTime = 0.01; %1/100     limited by arduino
I = I_calculation(d,Iw,L,md);
Plant = PlantA(d,Veq,Weq,dw,Iw,I,L,md);
Controller = ControllerA(1,sampleTime);
Waypoint = WaypointA(x,y,l,r);
Cruise = CruiseA(refVelocity,bRef,l,r);
OuterLoop = CruiseController(1,sampleTime);
Cartesian = CartesianA(refVelocity,bRef,l,r,C1,C2);
Lyapunov = LyapunovA(refVelocity,bRef,l,r,C1,C2);

