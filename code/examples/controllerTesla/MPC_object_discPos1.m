%% create MPC controller object with sample time
mpc1 = mpc(Plant_discPos, 0.01);
%% specify prediction horizon
mpc1.PredictionHorizon = 30;
%% specify control horizon
mpc1.ControlHorizon = 5;
%% specify nominal values for inputs and outputs
mpc1.Model.Nominal.U = [0;0];
mpc1.Model.Nominal.Y = [0;0;0];
%% specify constraints for MV and MV Rate
mpc1.MV(1).Min = 0;
mpc1.MV(1).Max = 3.2;
mpc1.MV(2).Min = -25;
mpc1.MV(2).Max = 25;
%% specify constraints for OV
mpc1.OV(1).Min = 400;
mpc1.OV(1).Max = 550;
mpc1.OV(2).Min = 480;
mpc1.OV(2).Max = 520;
mpc1.OV(3).Min = -10;
mpc1.OV(3).Max = 10;
%% specify overall adjustment factor applied to weights
beta = 0.36788;
%% specify weights
mpc1.Weights.MV = [0 0]*beta;
mpc1.Weights.MVRate = [0.1 1]/beta;
mpc1.Weights.OV = [2 8 0.5]*beta;
mpc1.Weights.ECR = 100000;
%% specify overall adjustment factor applied to estimation model gains
alpha = 1.0471;
%% adjust custom output disturbance model gains
setoutdist(mpc1, 'model', mpc1_ModelOD*alpha);
%% adjust default measurement noise model gains
mpc1.Model.Noise = mpc1.Model.Noise/alpha;
%% specify simulation options
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% run simulation
sim(mpc1, 1001, mpc1_RefSignal, mpc1_MDSignal, options);
