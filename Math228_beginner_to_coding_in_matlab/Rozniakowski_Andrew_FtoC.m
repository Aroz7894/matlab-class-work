%Rozniakowski_Andrew_FtoC.m
%Andrew Rozniakowski

%This program reads in a spreadsheet of temperatures, converts the 
%temperatures to Celcius, finds the avergage and plots the 
%new Celcius values and the average vs time 

%Declare Variables
H = 0;
T = 0;
avg = 0;
celcius = 0;
rng = [0 0 11 2]

%Reading in the values 
T = csvread('Temperature.csv',0,0);
fprintf('kldnkn %d\n', T); 
%Converting from F to C (C = (F-32)* 5/9)
celcius = ((T - 32) * (5/9));

%Computing Average 
avg = sum(celcius)/12;

%Printing Average  
fprint('The average temperature for this afternoon is expected to be %d degrees Celcius', avg); 

%Plotting Degrees Celcius vs Hours 
plot(H, T, '-b0', 'MarkerEdgeColor', 'r');
hold on
plot(avg, 'g');
title('Graph of Temperature in Celius vs the hour of the day');
xlabel('Hours of the day')
ylabel('Temperatures in Celius'); 
legend('Temperatures', 'Average');
