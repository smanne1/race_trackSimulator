function [Plant] = PlantA(d,Veq,Weq,dw,Iw,I,L,md)

% Plant model from e_r, e_l to V, W


s = tf([1 0],[1]);
z = tf('z');

%% Plant Model (old-robot)
m = 3.4; mc = 2.76 + md; I = I ; Iw = Iw; L = L; R = 0.0420; d = d; dw = dw; 
Weq = Weq; Veq = Veq;
Ao = m + 2*Iw/(R^2); Bo = I + (2*Iw*dw^2)/R^2;
% Linear Plant without actuator - Motor Torque to V,W 

% Linear Plant without actuator - Motor Torque to Wr, Wl
Tmain2 = [(1/(s*R*R))*((1/Ao)+(L*L/Bo)) (1/(s*R*R))*((1/Ao)-(L*L/Bo)); (1/(s*R*R))*((1/Ao)-(L*L/Bo)) (1/(s*R*R))*((1/Ao)+(L*L/Bo))];

% Right Motor Actuator Dynamics - voltage to motor torque 
Kt = 0.0337; Kg = 50; Kb = Kt; B = 1.3023e-04; La = 22.8e-06; Ra = 2.9;



% Left Motor Actuator Dynamics - voltage to motor torque 
Kt = 0.0046; Kg = 50; Kb = Kt; Beta = 2.29e-06; La =1.729e-03; Ra = 5.51;
A = m + 2*Iw/(R*R); B = I + dw*dw*Iw/(2*R*R);


% ULTIMATE - CORRECT representation of Plant using State Space form derived
% on Sept 21st
As = [-2*Beta*Kg*Kg/(A*R*R)  2*mc*d*Weq/A   (Kt*Kg/(R*A))  (Kt*Kg/(A*R));
      -mc*d*Weq/B  (-mc*d*Veq/B)-(Beta*dw*dw*Kg*Kg/(2*R*R*B)) dw*Kt*Kg/(2*R*B) -dw*Kt*Kg/(2*B*R) ;
     -Kb*Kg/(La*R)   -Kb*Kg*dw/(2*La*R)  -Ra/La      0 ;
     -Kb*Kg/(La*R)    Kb*Kg*dw/(2*La*R)    0       -Ra/La ];
Bs = [0 0; 0 0; 1/La 0; 0 1/La]; Cs = [1/R dw/(2*R) 0 0; 1/R -dw/(2*R) 0 0]; Ds = [0 0;0 0];
Mains = ss(As,Bs,Cs,Ds);
MainTfs = minreal(tf(Mains)); Mains = ss(MainTfs); MainTfs = minreal(zpk(MainTfs));

% Alternate representation of Plant from Lin's thesis ea -r,l to Wr,Wl 
% H1 = Kt/(La*m*R*R*s*s + (Ra*m*R*R + 2*La*B)*s + (2*Kb*Kt + 2*Ra*B));
% H2 = dw*dw*Kt/(I*La*R*R*s*s + (I*Ra*R*R + dw*dw*La*B)*s + (Kb*Kt*L*L + dw*dw*Ra*B));
% Plant3 = [H1+0.5*H2  H1-0.5*H2; H1-0.5*H2 H1+0.5*H2]; Plant3 = minreal(zpk(Plant3));
Plant = MainTfs;



end
