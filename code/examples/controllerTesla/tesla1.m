clc 
close all 
load('/home/smanne1/Documents/MATLAB/Add-Ons/Toolboxes/Mobile Robotics Simulation Toolbox/code/examples/controllerTesla/slprj/sim/varcache/mrsDiffDriveModel/varInfo.mat')
load('/home/smanne1/Documents/MATLAB/Add-Ons/Toolboxes/Mobile Robotics Simulation Toolbox/code/examples/controllerTesla/slprj/sim/varcache/mrsDiffDriveModel/checksumOfCache.mat')
%% Nominal Plant 
%global d Veq Weq L AR Iw dw md R sampleTime;
<<<<<<< HEAD
d = 0.0; Veq = 2, Weq = 0; L = 1.0; AR = L/0.25; Iw = 1.67e-06; dw = L/sqrt(2); md = 0;
=======
d = 0.08; Veq = 2, Weq = 0; L = 1.0; AR = L/0.25; Iw = 1.67e-06; dw = L/sqrt(2); md = 0;
>>>>>>> 8bfb28ccfe50e68808f8081cfca5a8102e74ec84
m = 3.4;  mc = 2.76 + md; 

% Left Motor Actuator Dynamics - voltage to motor torque 
Kt = 0.0046; Kg = 50; Kb = Kt; Beta = 2.29e-06; La =1.729e-03; Ra = 5.51;   

%%
refVelocity = 2.0; % in m/s
refTheta = 0; % in radians
bRef = 100; cBW = 1/bRef; % BW of the reference signal (Hz)
R = 0.042;% radius of the motor wheel 
<<<<<<< HEAD
x = 500; y = 500; r = 2.0; l = 3; % r = 10,8,6,5,4,3 center of the track, radius of the track, length of the straight path
=======
x = 500; y = 500; r = 1.0; l = 2; % r = 10,8,6,5,4,3 center of the track, radius of the track, length of the straight path
>>>>>>> 8bfb28ccfe50e68808f8081cfca5a8102e74ec84
C1 = x; C2 = y + r; % starting point
sampleTime = 0.01; %1/100 limited by arduino
%I = I_calculation(d,Iw,L,md); 
I = 1.7;
Ad = m + 2*Iw/(R*R); Bd = I + dw*dw*Iw/(2*R*R);
Plant = Plantww(d,Veq,Weq,dw,Iw,I,L,md,R);  
Plant_pos = Plantww_position(d,Veq,Weq,dw,Iw,I,L,md,R);
Plant_discPos = Plant_discPosition2();
<<<<<<< HEAD
D1 = c2d(KD1B9, 0.01, 'zoh');
D2 = c2d(KD1B10, 0.01, 'zoh');
=======
D1 = c2d(KD4M2(1,1), 0.01, 'zoh');
D2 = c2d(KD4M2(2,2), 0.01, 'zoh');
>>>>>>> 8bfb28ccfe50e68808f8081cfca5a8102e74ec84
Controller = [D1 0; 0 D1]; %ControllerA(1,sampleTime);
Waypoint = WaypointA(x,y,l,r);
Cruise = CruiseA(refVelocity,bRef,l,r);
OuterLoop = CruiseController(1,sampleTime);
Cartesian = CartesianA(refVelocity,bRef,l,r,C1,C2);
Lyapunov = LyapunovA(refVelocity,bRef,l,r,C1,C2);

%%



