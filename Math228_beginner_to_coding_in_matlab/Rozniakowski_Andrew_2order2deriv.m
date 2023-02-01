%Rozniakowski_Andrew_2order2deriv.m

%Andrew Rozniakowski

%This program computes the second derivative of the function:
%f(x) = xcos(x/2) on the interval [-1,1], using the second order central 
%difference formula. It also uses forward and backward difference formulas 
%at the end points. This program prints out 2 graph. The first graph 
%compares the exact second derivative of f(x) with our difference formula
%using an h value of 1/8, 1/16, 1/32, and 1/64. The second graph plots the
%error for each h value.  

clear all
close all

%for loop for h
for i=3:6 
    %Declare variables 
    h = (1/2)^i;
    n = (2^i) + 1;
    x = linspace(-1,1,n);
    f = x.*cos(x/2);
    fp_exact = -sin(x/2) - (1/4)*x.*cos(x/2);
    fp = zeros(size(x));
    err = zeros(size(x)); 


    %computing f'(x) numerical interior points

    for k = 2:n-1 
        fp(k) = (f(k+1) - 2*f(k) + f(k-1))/(h^2);
    end

    %computing left most point
    fp(1) = (2*f(1) - 5*f(2) + 4*f(3) - f(4))/(h^2);

    %computing right most point
    fp(n) = (2*f(n) - 5*f(n-1) + 4*f(n-2) - f(n-3))/(h^2);

    %computing error
    err = abs(fp_exact - fp);

    %Plotting
    figure(1)
    subplot(2,1,1);
    plot(x,fp,'x');
    hold all
    subplot(2,1,2);
    plot(x,err,'o');
    hold all
end

subplot(2,1,1);
plot(x,fp_exact);
legend('h = 1/8', 'h = 1/16', 'h = 1/32', 'h = 1/64', 'Exact');
title('Second Derivative of f(x) = xcos(x/2)');
xlabel('x');
ylabel('f''''(x)');
subplot(2,1,2);
legend('h = 1/8', 'h = 1/16', 'h = 1/32', 'h = 1/64');
title('Absolut Error');
xlabel('x');
ylabel('error');
