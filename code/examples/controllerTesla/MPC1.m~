%% create MPC controller object with sample time
mpc1 = mpc(Plant, sampleTime);
%% specify prediction horizon
mpc1.PredictionHorizon = 25;
%% specify control horizon
mpc1.ControlHorizon = 5;
%% specify nominal values for inputs and outputs
mpc1.Model.Nominal.U = [0;0];
mpc1.Model.Nominal.Y = [0;0];
%% specify constraints for MV and MV Rate
mpc1.MV(1).Min = -0.523598775598299;
mpc1.MV(1).Max = 0.523598775598299;
mpc1.MV(1).RateMin = -0.261799387799149;
mpc1.MV(1).RateMax = 0.261799387799149;
mpc1.MV(2).Min = -0.523598775598299;
mpc1.MV(2).Max = 0.523598775598299;
mpc1.MV(2).RateMin = -0.261799387799149;
mpc1.MV(2).RateMax = 0.261799387799149;
%% specify constraints for OV
mpc1.OV(1).Min = -2;
mpc1.OV(1).Max = 6;
mpc1.OV(2).Min = -0.2;
mpc1.OV(2).Max = 0.2;
%% specify weights
mpc1.Weights.MV = [0 0];
mpc1.Weights.MVRate = [0 0];
mpc1.Weights.OV = [2.82921701435156 0.282921701435156];
mpc1.Weights.ECR = 100000;
%% specify simulation options
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% run simulation
sim(mpc1, 101, mpc1_RefSignal, mpc1_MDSignal, options);
