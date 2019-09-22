function Motorcurves = MotorcurvesB(torque,mass,speed,power,sNo)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
subplot(2,2,1)
scatter(mass, torque)
hold on
scatter([1280 1270],[343.4 341], 'r')
%scatter([1 2 5 6],[594.7 380 297.4 263.8], 'g')
grid on
labels = {'' '' '22' '15' '16' '18' '19' '5' '21' '1' '2' '6' '11' '8' '17' '9' '13' '10' '7' '14' '12' '20'};
title('Mass vs. Torque (Models 1-22)')
xlabel('Mass (g)')
ylabel('Torque (oz-in)')
text(mass,torque,labels,'VerticalAlignment','top','HorizontalAlignment','left')
hold off

subplot(2,2,3)
hold on
scatter(mass, speed)
scatter([1280 1270],[5310 5330], 'r')
%scatter([1 2 5 6],[150 210 300 660], 'g')
grid on
title('Mass vs. Speed (Models 1-22)')
xlabel('Mass (g)')
ylabel('Speed (RPM)')
text(mass,speed,labels,'VerticalAlignment','top','HorizontalAlignment','left')
hold off

subplot(2,2,2)
hold on
scatter(mass, power)
scatter([1280 1270],[337.3 337], 'r')
%scatter([1 2 5 6],[15 14.73 15 32.2], 'g')
grid on
title('Mass vs Power (Models 1-22)')
xlabel('Mass (g)')
ylabel('Rated-Output Power(watts)')
text(mass,power,labels,'VerticalAlignment','top','HorizontalAlignment','left')
hold off

end

