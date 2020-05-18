function [Plant] = Plant_discPosition1()
%PLANTWW_POSITION Summary of this function goes here
%   Detailed explanation goes here
thetaeq = 0;
Au =      [1  0  0;
           0  1  0;
           0  0  1];  
           
Bu =      [cos(thetaeq) 0;
           sin(thetaeq) 0;
           0            1];
Cu =      [1 0 0;
           0 1 0;
           0 0 1];
Du =       zeros(3,2);

Plant = ss(Au,Bu,Cu,Du);
Plant = c2d(Plant,0.01,'ZOH');

end
