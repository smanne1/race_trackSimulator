function [Controller] = ControllerA(i,Ts)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if (i == 1)
s = tf([1 0],[1]);
Plant = 12.688/(s + 5.113);
control = 4.53 + 296/s;
%step(Plant*control/(1 + Plant*control))
Ts = 1/100; D11 = c2d(control,Ts,'zoh'); 
Controller = [D11 0; 0 D11]; % replace this with the discrete controller
%Controller = ss(Controller);
end

end
