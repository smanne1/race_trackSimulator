function [Plant] = Plantww_position(d, Veq, Weq, dw, Iw, I, L, md,R)
%PLANTWW_POSITION Summary of this function goes here
%   Detailed explanation goes here
thetaeq = 0;
x = Plantww(d,Veq,Weq,dw,Iw,I,L,md,R);
Au =      [0  0  -Veq*sin(thetaeq) cos(thetaeq)  0  0  0;
           0  0  Veq*cos(thetaeq) sin(thetaeq)  0  0  0;
           0  0  0                 0            1  0  0;  
           zeros(4,3) x.A]
Bu =      [0 0;
           0 0;
           0 0;
           x.B]
Cu =      [1 0 0 0 0 0 0;
           0 1 0 0 0 0 0;
           0 0 1 0 0 0 0]
Du =       zeros(3,2)



Plant = ss(Au,Bu,Cu,Du);
end

