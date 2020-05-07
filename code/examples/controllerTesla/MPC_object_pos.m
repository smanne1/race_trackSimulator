%% create MPC controller object with sample time
mpc_pos = mpc(Plant_pos, sampleTime);
%% specify prediction horizon
mpc_pos.PredictionHorizon = 25;
%% specify control horizon
mpc_pos.ControlHorizon = 4;
%% specify nominal values for inputs and outputs
mpc_pos.Model.Nominal.U = [0;0];
mpc_pos.Model.Nominal.Y = [C1;C2;0];
%% specify weights
mpc_pos.Weights.MV = [0 0];
mpc_pos.Weights.MVRate = [0.1 0.1];
mpc_pos.Weights.OV = [1 1 1];
mpc_pos.Weights.ECR = 100000;
%% specify simulation options
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% run simulation
sim(mpc_pos, 1001, mpc1_RefSignal, mpc1_MDSignal, options);
