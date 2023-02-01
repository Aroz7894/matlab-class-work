%ProjectPart2GraphE
clear all
close all
%Declare Variables
x = linspace(-10,10, 30);
y = linspace(-10,10, 30);
z = zeros(30);
i = 1;
j = 1;
while i <= 30
    while j <= 30
    z(i,j) = Project2Newton2_e(x(i), y(j));
    if z(i,j) == -1
        plot(x(i), y(j), 'bx');
        hold on
    elseif z(i,j) == 0
        plot(x(i), y(j), 'go');
    else
        plot(x(i), y(j), 'rx');
    end
    j = j+1;
    end
    i = i+1;
    j = 1;
end    
title('Basin of Attraction for z^3 - z');
xlabel('x_0');
ylabel('y_0');
