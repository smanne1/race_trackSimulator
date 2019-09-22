function [Lyapunov] = LyapunovA(refVelocity,bRef,l,r,C1,C2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
i = 1;
D = 0
while (D <= l/2)
    D = D + (refVelocity)/bRef;
    refX(i) = C1 + D; 
    refY(i) = C2;
    refTheta(i) = 0;
    refW(i) = 0;
    i = i+1;
end

Theta = 0;
while (Theta <= pi)
    Theta = Theta + refVelocity/(bRef*r);
    refTheta(i) = refTheta(i-1) - refVelocity/(bRef*r);
    refX(i) = C1 + D + r*sin(Theta);
    refY(i) = C2 - (r-r*cos(Theta));
    refW(i) = refVelocity/r;
    i = i+1;
end
D1 = D;
D = 0;
while (D <= l)
    D = D + (refVelocity)/bRef;
    refX(i) = C1 + D1 - D; 
    refY(i) = C2 - r + r*cos(Theta);
    refTheta(i) = -pi;
    refW(i) = 0;
    i = i+1;
end

Theta1 = - r + r*cos(Theta);
Theta = 0;
while (Theta <= pi)
    Theta = Theta + refVelocity/(bRef*r);
    refTheta(i) = refTheta(i-1) - refVelocity/(bRef*r);
    refX(i) = C1 + D1 - D - r*sin(Theta);
    refY(i) = C2 + Theta1 + (r-r*cos(Theta));
    refW(i) = refVelocity/r;
    i = i+1;
end

D2 = D;
D = 0;
while (D <= l/2)
    D = D + (refVelocity)/bRef;
    refX(i) = C1 + D1 - D2 + D; 
    refY(i) = C2 + Theta1 + r - r*cos(Theta);
    refTheta(i) = -2*pi;
    refW(i) = 0;
    i = i+1;
end

Lyapunov(:,1) = refX;
Lyapunov(:,2) = refY;
Lyapunov(:,3) = refTheta;
Lyapunov(:,4) = (refX./refX)*refVelocity;
Lyapunov(:,5) = refW;
end

