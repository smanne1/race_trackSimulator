function [Plant] = PlantA(i)
if (i == 1)
%% Plant Model 
m = 2.96; mc = 2.96 - 0.279; I = 0.0285 ; Iw =   8.0306e-05; L = 0.28/2; R = 0.0610; d = 0.0; dw = 2*L; 
Weq = 3.14/2; Veq = 1.2;
Ao = m + 2*Iw/(R^2); Bo = I + (2*Iw*L^2)/R^2;
Kt = 0.0337; Kg = 9.68; Kb = Kt; B = 1.3023e-04; La = 22.8e-06; Ra = 2.9;

% Alternate representation of Plant using State Space form ACC paper 
Kg = 1; Iw = 0;

As = [(-2*B*Kg^2)/((m*R^2)+Iw) 0 Kt*Kg/(La*R*Ao) Kt*Kg/(La*R*Ao)
       0   -2*L*L*Kg*Kg*B/(2*R*R*Bo) Kt*Kg*L/(La*R*Bo) -Kt*Kg*L/(La*R*Bo)
       -Kb*Kg/R -Kb*Kg*L/R -Ra/La 0
       -Kb*Kg/R Kb*Kg*L/R 0 -Ra/La];
Bs = [0 0; 0 0; 1 0; 0 1]; Cs = [1/R L/R 0 0; 1/R -L/R 0 0]; Ds = [0 0;0 0];
Plant = ss(As,Bs,Cs,Ds);

end
end

