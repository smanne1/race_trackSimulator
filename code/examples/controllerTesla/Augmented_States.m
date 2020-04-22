clc
close all 
clear all 
d = 0.0107; Veq = 2, Weq = 0; L = 0.28; AR = L/0.25; Iw = 1.67e-06; dw = 0.25; md = 0;
d = 0; thetaeq = pi/4; 


%%
refVelocity = 3; % in m/s
refTheta = 0; % in radians
bRef = 10; cBW = 1/bRef; % BW of the reference signal (Hz)
L = 0.25; % distance between the wheels dw
R = 0.042;% radius of the motor wheel 
x = 500; y = 500; r = 10; l = 10; % center of the track, radius of the track, length of the straight path
C1 = x; C2 = y + r; % starting point
sampleTime = 0.01; %1/100     limited by arduino
I = I_calculation(d,Iw,L,md);
Plant = Plantww(d,Veq,Weq,dw,Iw,I,L,md,R);  

% States x,y,theta, V,W, Iar,Ial 

Au =      [0  0  -Veq*sin(thetaeq) cos(thetaeq)  0  0  0;
           0  0  Veq*cos(thetaeq) sin(thetaeq)  0  0  0;
           0  0  0                 0            1  0  0;  
           zeros(4,3) Plant.A]
Bu =      [0 0;
           0 0;
           0 0;
           Plant.B]
Cu =      [1 0 0 0 0 0 0;
           0 1 0 0 0 0 0;
           0 0 1 0 0 0 0;
           zeros(2,3) Plant.C]
Du =       zeros(5,2)
       
Plantaug = ss(Au,Bu,Cu,Du)

       