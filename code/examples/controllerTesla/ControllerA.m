function [Controller] = ControllerA(i,Ts)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if (i == 1)
s = tf([1 0],[1]);
control11 = 1/s;
Ts = 1/100; D11 = c2d(control11,Ts,'zoh'); 
Controller = [D11 0; 0 D11];
Controller = ss(Controller);
end
end

