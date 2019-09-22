function [Cruise] = CruiseA(refVelocity,bRef,l,r)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
i = 1;
D = 0
while (D <= l/2)
    D = D + (refVelocity)/bRef;
    refTheta(i) = 0;
    i = i+1;
end

Theta = 0
while (Theta <= pi)
    Theta = Theta + refVelocity/(bRef*r);
    refTheta(i) = refTheta(i-1) - refVelocity/(20*r);
    i = i+1;
end

D = 0;
while (D <= l)
    D = D + (refVelocity)/bRef;
    refTheta(i) = -pi;
    i = i+1;
end

Theta = 0;
while (Theta <= pi)
    Theta = Theta + refVelocity/(bRef*r);
    refTheta(i) = refTheta(i-1) - refVelocity/(20*r);
    i = i+1;
end

D = 0;
while (D <= l/2)
    D = D + (refVelocity)/bRef;
    refTheta(i) = -2*pi;
    i = i+1;
end

Cruise(:,1) = refTheta;
Cruise(:,2) = refVelocity;
Cruise(end,2) = 0; 
end

