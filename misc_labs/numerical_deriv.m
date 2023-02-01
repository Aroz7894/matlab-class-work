%numerical_deriv.m

%Computes actual and numerical deriv of f(x) = 1/2xsin(2x) on [0,1] with h
%= 1/8.

clear all 
close all

%for loop for h
for i=3:4 
    %Declare variables 
    h = (1/2)^i;
    n = (2^i) + 1;
    x = linspace(0,1,n);
    f = .5*x.*sin(2*x);
    fp_exact = .5*sin(2*(x)) + x.*cos(2*x);
    fp_num = zeros(size(x));
    err = zeros(size(x)); 


    %computing f'(x) numerical interior points
    for k = 2:n-1 
        fp_num(k) = (f(k+1)-f(k-1))/(2*h);
    end

    %computing left most point
    fp_num(1) = (-3*f(1) + 4*f(2)-f(3))/(2*h);

    %computing right most point
    fp_num(n) = (3*f(n) - 4*f(n-1) + f(n-2))/(2*h);

    %computing error
    err = abs(fp_exact - fp_num);

    %Plotting
    figure(1)
    subplot(2,1,1);
    plot(x,fp_num,'x');
    hold all
    subplot(2,1,2);
    plot(x,err,'r');
    hold all

end


subplot(2,1,1);
plot(x,fp_exact);
legend('h = 1/8', 'h = 1/16', 'Exact');
subplot(2,1,2);
legend('h=1/8', 'h=1/16');


