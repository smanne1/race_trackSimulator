 function [Plant] = Plantww(d, Veq, Weq, dw, Iw, I, L, md,R)

% Plant model from e_r, e_l to W_r, W_l



R = R; dw = dw;

Temp = Plantvw(d,Veq,Weq, dw, Iw, I,L,md,R);
%MainTfs = ([1/R dw/(2*R); 1/R -dw/(2*R)])*Temp;    % This code is for
%obtaining the transfer function represntation of the plant
%MainTfs = minreal(tf(MainTfs)); MainTfs = minreal(zpk(MainTfs));

Temp.C =  ([1/R dw/(2*R); 1/R -dw/(2*R)])*Temp.C;
Plant = Temp;

end

