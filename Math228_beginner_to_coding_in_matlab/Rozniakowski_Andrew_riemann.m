%Rozniakowski_Andrew_riemann.m
%Andrew Rozniakowski

%This program computes the integral of a function using Riemann
%sums and the trapezoid rule. It then computes the error and plots 
%it on a graph 

%Declare Variables
n = input('Please enter a positive number of segments for the Riemann Sum\n');
a = 1;
b = 0;
f = 0;
trap_sum = 0;
h = (b-a)/n;

t = linspace(b, a, n);

%Error Checking 
if n < 0
    fprintf('Not a positive number');
    return
end

%Computations
for i = 1:n
    for k = 1:i
        f = f + (h/2)*(t(k) * exp(1 - 4*t(k) + t(k+1)) * exp(1- 4*t(k+1)));
    end
end

%Plotting the error
