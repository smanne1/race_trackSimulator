function [Controller] = CruiseController(i,Ts)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if (i == 1)
s = tf([1 0],1);
Plant = 68.25/(s*(s + 68.25));
control = 14.5 + 26.1/s;
%step(Plant*control/(1 + Plant*control))
Ts = 1/100; D11 = c2d(control,Ts,'zoh'); 
Controller = 10; % replace this with the discrete controller
Controller = ss(Controller);
end
end

