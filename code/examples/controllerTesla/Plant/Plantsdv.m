function [Plant] = Plantsdv(d, Veq, Weq, dw, Iw, I, L, md,R)


% Plant model from (e_r + e_l), (e_r-e_l) to V, W


 dw = dw;

Temp = Plantvw(d,Veq,Weq,dw,Iw,I,L,md,R);
%MainTfs = Temp*[0.5 0.5; 0.5 -0.5];     % this code is for transfer function
%representation of the plant
%MainTfs = minreal(tf(MainTfs)); MainTfs = minreal(zpk(MainTfs));

Temp.B = Temp.B*[0.5 0.5; 0.5 -0.5];
Plant = Temp;

end

