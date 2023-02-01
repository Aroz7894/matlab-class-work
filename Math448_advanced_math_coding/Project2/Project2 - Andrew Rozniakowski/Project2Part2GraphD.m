%Project 2 Graph for function D
clear all
close all 

%Declare Variables
x = linspace(-5,5, 20);
y = linspace(-5,5, 20);
z_r = zeros(20);
z_i = zeros(20);
i = 1;
j = 1;

%Computing/graphing real roots
subplot(2,1,1);
while i <= 20
    while j <= 20
        z_i(i,j) = Project2Newton2_d(x(i), y(j), 1, 1, 1);
        if imag(z_i(i,j)) > 0 
            plot(x(i), y(j), 'bo');
            hold on
        else
            plot(x(i), y(j), 'rx');
        end
        j = j+1;
    end
    i = i+1;
    j = 1;
end
xlabel('x_0');
ylabel('y_0');
title('Basin of Attraction for z^2 + ab + c, imaginary roots');

i = 1;
j = 1;
%Computing/graphing imaginary roots
subplot(2,1,2);
while i <= 20
    while j <= 20
        z_r(i,j) = Project2Newton2_d(x(i), y(j), -1, 1, -1);
        if real(z_r(i,j)) > 0 
            plot(x(i), y(j), 'bo');
        else
            hold on
            plot(x(i), y(j), 'rx');
        end
        j = j+1;
    end
    i = i+1;
    j = 1;
end    
axis([-5 5 -5 5]);
title('Basin of Attraction for z^2 + ab + c, real roots');
xlabel('x_0');
ylabel('y_0');