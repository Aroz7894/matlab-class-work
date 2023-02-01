%root_find_fpi.m

%This program will attempy to find a root of f(x) = 0 by using fpi

%Declare variables 
x0 = 0;
x0 = input('Enter an initial value\n');
x = x0;
g = 0;
i=0;
delta = 0.001;
f = exp(x)-x^2+2*x;

while abs(f)>delta || i < 100
    i = i + 1;
    g = -0.5 * (exp(x) - x^2);
    x = g;
    f = exp(x)-x^2+2*x;
    plot(i,x,'bo');
    hold on;
end

fprintf('The root is approx. %d after %d iterations\n',x,i);