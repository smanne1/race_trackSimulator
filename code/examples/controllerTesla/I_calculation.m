function [I] = I_calculation(d,Iw,L,md)
% I as a function of d, dw
 m = 3.4;
 mc = 2.76;
 mw = (m - mc)*0.5 ;
 dw = 0.25;
%% Iw estimation  (max and min value estimation)

% rw =  0.0610 ; m_wheel = 0.181;
% rm = 0.0248  ; m_motor = 0.096;
% maxval =  m_motor*rm*rm + m_wheel*rw*rw;    
% minval =  maxval/8;

%% Ic calculation
% 
% plate
Ic = md*(L/2)^2; % initial value, md is the additional mass that has to be added to manipulate d, 
m_plate = 0.411;


Ic = Ic + (2/12)*m_plate*(L*L + dw*dw) + 2*m_plate*d*d;   % for the two acryllic sheets
% 3d print
% m3d = 0.055;
% l3d = 0.079;
% Ic = Ic + 2*m3d*l3d*l3d;
% Nvidia
m_nvidia = 0.4;
l_nvidia = 0.12*dw;
Ic = Ic + m_nvidia*((l_nvidia^2) + (d^2)); 
% battery Nvidia
m_bat = 0.492;
l_cam = 0.404*L;
l = 0.108;
w = 0.101;
Ic = Ic + (1/12)*m_bat*(l*l + w*w) + m_bat*d*d;
% camera 
m_cam = 0.077;
l_cam = 0.404*L;
Ic = Ic + m_cam*(l_cam - d)*(l_cam - d);
% LiPo
m_lipo = 0.185;
l_lipo = 0.404*L;
l = 0.10;
w = 0.034;
Ic = Ic + m_lipo*((l_lipo - d)*(l_lipo - d)) + (1/12)*m_lipo*(l*l + w*w);
% arduino + motor shield 
m_ard_shield = 0.062;
L_ard_shield = 0.033;
Ic = Ic + m_ard_shield*(L_ard_shield)^2; % doesn't really matter
%% I approximation

I_approx = (1/12)*m*(L*L + dw*dw); % in order to verify if the calculated I is right or wrong
%% I original
% Iw = maxval;
% Iw = from matlab gre-box model
I = Ic + (mc+md)*d*d + 2*mw*dw*dw + Iw;


end

