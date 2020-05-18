clc 
close all 
load('/home/shravan/Documents/MATLAB/Add-Ons/Toolboxes/Mobile Robotics Simulation Toolbox/code/examples/controllerTesla/slprj/sim/varcache/mrsDiffDriveModel/varInfo.mat')
load('/home/shravan/Documents/MATLAB/Add-Ons/Toolboxes/Mobile Robotics Simulation Toolbox/code/examples/controllerTesla/slprj/sim/varcache/mrsDiffDriveModel/checksumOfCache.mat')
%% Nominal Plant 
%global d Veq Weq L AR Iw dw md R sampleTime;
d = 0.0; Veq = 2, Weq = 0; L = 0.28; AR = L/0.25; Iw = 1.67e-06; dw = 0.25; md = 0;
m = 3.4;  mc = 2.76 + md; 

% Left Motor Actuator Dynamics - voltage to motor torque 
Kt = 0.0046; Kg = 50; Kb = Kt; Beta = 2.29e-06; La =1.729e-03; Ra = 5.51;

%%
refVelocity = 3; % in m/s
refTheta = 0; % in radians
bRef = 10; cBW = 1/bRef; % BW of the reference signal (Hz)
L = 0.3536; % distance between the wheels dw
R = 0.042;% radius of the motor wheel 
x = 500; y = 500; r = 10; l = 10; % r = 10,8,6,5,4,3 center of the track, radius of the track, length of the straight path
C1 = x; C2 = y + r; % starting point
sampleTime = 0.01; %1/100     limited by arduino
%I = I_calculation(d,Iw,L,md); 
I = 0.4250;
Ad = m + 2*Iw/(R*R); Bd = I + dw*dw*Iw/(2*R*R);
Plant = Plantww(d,Veq,Weq,dw,Iw,I,L,md,R);  
Plant_pos = Plantww_position(d,Veq,Weq,dw,Iw,I,L,md,R);
Plant_discPos = Plant_discPosition2();
Controller = [PI1 0; 0 PI1]; %ControllerA(1,sampleTime);
Waypoint = WaypointA(x,y,l,r);
Cruise = CruiseA(refVelocity,bRef,l,r);
OuterLoop = CruiseController(1,sampleTime);
Cartesian = CartesianA(refVelocity,bRef,l,r,C1,C2);
Lyapunov = LyapunovA(refVelocity,bRef,l,r,C1,C2);

%%

MPC_object_discPos2



