function [I] = I_ARcalculation(d,Iw,L)
% I calculation the is valid only for the AR calculation; to verify the
% decoupling in the wr,wl model
% Ic = mc(L^2 + dw^2)/12
m = 3.4;
mc = 2.76;
mw = (m - mc)*0.5 ;
dw = 0.25;

I = mc*(L*L + dw*dw)/12 + mc*d*d + 0.5*mw*dw*dw + Iw;


end

