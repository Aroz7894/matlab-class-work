%Lag_interpolation.m
clear all 
close all

%Declare variables 
x = [.1 .125 .5 1.1 1.3 1.5];
X = linspace(.1,1.5,100);
y = x.*sin(2*pi*x);
x0 = x(1);
y0 = x(1);
x1 = x(end);
y1 = y(end);
f = 0;
L = zeros(6);

%Computing L(x)  
L0 = (x-x1)/(x0-x1);
L1 = (x-x0)/(x1-x0);

f = y0*L0 + y1*L1;

%output
plot(f, x, 'b');
hold on
plot(x,y,'ro');
