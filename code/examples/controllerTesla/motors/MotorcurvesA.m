function Motorcurves = MotorcurvesA(stallTorque, stallCurrent, ratedVoltage, noloadCurrent, noloadSpeed, sNo)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

discreteBins = 500;
for i = 1:length(sNo)
    StallTorque = stallTorque(i);
    StallCurrent = stallCurrent(i);
    RatedVoltage = ratedVoltage(i);
    NoLoadCurrent = noloadCurrent(i);
    NoLoadSpeed = noloadSpeed(i);
    
    
    %Here we calculate basic stuff to get all the variables and outputs.
    Resistance = RatedVoltage / (StallCurrent/1000);
    %Torque line
    TorqueLine = 0:(StallTorque/discreteBins):StallTorque;
    %Current Line
    CurrentLine = NoLoadCurrent:(StallCurrent-NoLoadCurrent)/discreteBins:StallCurrent;
    %Speed Line
    SpeedLine = NoLoadSpeed: (0-NoLoadSpeed)/discreteBins : 0;
    % Torque Constant in Torque per current is
    SlopeOfTorqueVsCurrent = (StallCurrent - NoLoadCurrent) / (StallTorque);
    
    
    %Output Mechanical Power in watts is Torque * Speed * 0.00074 watts
    OutputPower = 0.00074 * TorqueLine .* SpeedLine;
    %Input Electrical Power to the motor is Voltage * Current
    InputPower = CurrentLine * RatedVoltage / 1000; %We are dividing by 1000 as the input was in mA and we need power in Watts.
    
%Plot part of the functions    
    
    subplot(2,2,1)
    hold on
    grid on
    plot(TorqueLine, SpeedLine); %This is the TorqueLoad vs. Motor Speed graph
    title('Torque vs. Speed (Models 1 - 22)');
    xlabel('Torque (oz-in)');
    ylabel('Speed (RPM)');
    
    hold off   
    
    %This is the plot of the Output Mechanical power in watts vs. Input
    %Electrical power in Watts.
    subplot(2,2,2);
    hold on
    grid on
    plot(TorqueLine, OutputPower);
    xlabel('Torque (oz-in)');
    ylabel('OutputPower (watts)');
    title('Torque vs. Output Power (Models (1 - 22))');
    hold off
    
    subplot(2,2,4);
    hold on
    grid on
    plot(TorqueLine, InputPower);
    xlabel('Torque (oz-in)');
    ylabel('InputPower (watts)');
    title('Torque vs. Input Power (Models 1 -22)');
    hold off
    %This is the plot of the Power Efficiency of the motor.
    
    subplot(2,2,3);
    hold on;
    grid on
    plot(SpeedLine, OutputPower);
    xlabel('Speed (RPM)');
    ylabel('OuputPower (watts) ');
    title('Speed vs. Output Power (Models 1 -22)');
    hold off
 

end
end

