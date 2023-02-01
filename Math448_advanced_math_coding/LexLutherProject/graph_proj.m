%graphs
clear all
close all

x = linspace(-10,10,100);
f_1 = (exp(2.*x-1) - (2.*x.^2) - 1/2);
f_2 = (cos(x) - exp(-x.^2) + 1);
f_3 = x.^5 - 9.*x.^4 - x.^3 + 17.*x.^2 - 8.*x - 8;


%plot(x,f_1);
plot(x,f_2);
%plot(x,f_3);
axis([-10 10 -3 3]);
legend('cos(x) - exp(-x.^2) + 1');
%'exp(2.*x-1) - (2.*x.^2) - 1/2', 'cos(x) - exp(-x.^2) + 1', 'x^5 - 9*x^4 - x^3 + 17*x^2 - 8*x - 8','Location','Southwest');