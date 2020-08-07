clc
close all 
clear all 

torque = [594.7 380 343.4 341 297.4 263.8 165 155.5 120 110 98 87.49 85 84 66.6 51.3 44.4 34.44 30 27.77 13.88 4.8];
power = [15 14.73 337.3 337 15 32.2 6.41 7.54 250 7.1225 3.91 32.37 7.86 7.77 2 16 8.04 9.26 80 30 30 1.2];
speed = [150 210 5310 5330 300 660 210 480 3400 350 216 2000 500 500 500 750 980 557 10000 6000 3000 1360];
mass = [350 332 1280 1270 436 289 101 250 504 215 136 289 98 215 101 498 498 250 354 460 460 95];
sNo =  [1 2 3 4 5 6 7 8 22 9 10 11 12 13 14 15 16 17 21 18 19 20];
Voltage = [12 12 12 12 12 24 12 12 24 12 12 24 12 12 12 12 12 12 12 24 12 12];
stallCurrent = [8.5 9.2 133 131 8.5 11 5.6 10 28 5 2.5 11 5.6 5 2.1 15 15 10 20 0.5 0.5 1.3]*10^3; % should be in mA
noloadCurrent = [0.4 0.25 2.7 2.7 0.4 0.4 0.3 0.25 1.5 0.3 0.15 0.4 0.3 0.3 0.18 0.2 0.15 0.25 1 0.25 0.25 0.04]*10^3; % should be in mA
close all;
MotorcurvesA(torque, stallCurrent, Voltage, noloadCurrent, speed, sNo);


torque = [343.4 341 120 51.3 44.4 27.77 13.88 297.4 30 594.7 380 263.8 87.49 155.5 34.44 110 84 98 165 66.6 85 4.8];
power = [337.3 337 250 16 8.04 30 30 15 80 15 14.73 32.2 32.37 7.54 9.26 7.1225 7.77 3.91 6.41 2 7.86 1.2];
speed = [5310 5330 3400 750 980 6000 3000 300 10000 150 210 660 2000 480 557 350 500 216 210 500 500 1360];
mass = [1280 1270 504 498 498 460 460 436 354 350 332 289 289 250 250 215 215 136 101 101 98 95];
sNo =  [3 4 22 15 16 18 19 5 21 1 2 6 11 8 17 9 13 10 7 14 12 20];
close all;
MotorcurvesB(torque,mass, speed,power,sNo);



subplot(2,2,1)
scatter(sNo, torque)
hold on
scatter([3 4],[343.4 341], 'r')
scatter([1 2 5 6],[594.7 380 297.4 263.8], 'g')
grid on
title('Torque vs DC Motors (1 - 22)')
xlabel('Motor Models (1 - 22)')
ylabel('Torque (oz-in)')
subplot(2,2,3)
hold on
scatter(sNo, speed)
plot(sNo, 232)
scatter([3 4],[5310 5330], 'r')
scatter([1 2 5 6],[150 210 300 660], 'g')
grid on
title('Speed vs DC Motors (1 - 22)')
xlabel('Motor Models (1 - 22)')
ylabel('Speed (RPM)')
subplot(2,2,2)
hold on
scatter(sNo, power)
scatter([3 4],[337.3 337], 'r')
scatter([1 2 5 6],[15 14.73 15 32.2], 'g')
grid on
title('Power vs DC Motors (1 - 22)')
xlabel('Motor Models (1 - 22)')
ylabel('Output Power (W)')
subplot(2,2,4)
hold on
scatter(sNo, mass)
scatter([3 4],[1280 1270], 'r')
scatter([1 2 5 6],[350 332 436 289], 'g')
grid on
title('Mass vs DC Motors (1 - 22)')
xlabel('Motor Models (1 - 22)')
ylabel('Mass (g)')