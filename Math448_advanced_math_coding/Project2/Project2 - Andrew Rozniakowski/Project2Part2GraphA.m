%Project 2 Graph for function A
clear all
close all 

%Declare Variables
x = linspace(-10,10, 30);
y = linspace(-10,10, 30);
z = zeros(20);
i = 1;
j = 1;
while i <= 30
    while j <= 30
        z(i,j) = Project2Newton2_a(x(i), y(j));
        if imag(z(i,j)) > 0 
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
title('Basin of Attraction for z^2 + 1');
xlabel('x_0');
ylabel('y_0');