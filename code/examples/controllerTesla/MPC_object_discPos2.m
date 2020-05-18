%% create MPC controller object with sample time
mpc2 = mpc(Plant_discPos, 0.01);
%% specify prediction horizon
mpc2.PredictionHorizon = 15;
%% specify control horizon
mpc2.ControlHorizon = 3;
%% specify nominal values for inputs and outputs
mpc2.Model.Nominal.U = [0;0];
mpc2.Model.Nominal.Y = [0;0;0];
%% specify constraints for MV and MV Rate
mpc2.MV(1).Min = 0;
mpc2.MV(1).Max = 3.2;
mpc2.MV(2).Min = -25;
mpc2.MV(2).Max = 25;
%% specify constraints for OV
mpc2.OV(1).Min = 400;
mpc2.OV(1).Max = 550;
mpc2.OV(2).Min = 480;
mpc2.OV(2).Max = 520;
mpc2.OV(3).Min = -10;
mpc2.OV(3).Max = 10;
%% specify overall adjustment factor applied to weights
beta = 0.3396;
%% specify weights
mpc2.Weights.MV = [0 0]*beta;
mpc2.Weights.MVRate = [0.1 0.6]/beta;
mpc2.Weights.OV = [1 1 1.2]*beta;
mpc2.Weights.ECR = 100000;
%% specify overall adjustment factor applied to estimation model gains
alpha = 5.7544;
%% adjust default output disturbance model gains
setoutdist(mpc2, 'model', getoutdist(mpc2)*alpha);
%% adjust default measurement noise model gains
mpc2.Model.Noise = mpc2.Model.Noise/alpha;
%% specify simulation options
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% run simulation
sim(mpc2, 1001, mpc2_RefSignal, mpc2_MDSignal, options);
