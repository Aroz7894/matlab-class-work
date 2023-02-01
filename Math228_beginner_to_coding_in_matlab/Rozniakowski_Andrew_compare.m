%Rozniakowski_Andrew_compare.m

%This program computes the Newton polynomial for the 2 functions: f(x) =
%e^2x and g(x) = sin(x) with evenly spaced nodes on the interval [0,2].

%Part C: Looking at the graph the Newton Polynomial for sin(x) is much
%better. It's only slightly off as it approaches the end of the interval, 
%compared to e^(-2x) which turns upwards and is way off by the end of the 
%interval. This is true because the derivatives of the function controls
%the bound on its error. So for the function g(x) = sin(x) its derivatives 
%will never be greater than one or less than -1. While f(x) = e^(-2x) 
%derivatives continually grow more negative or positive. Therefore the 
%bound for f(x)'s error will continually grow larger.       

clear all
close all

%Declare variables 
n = 3;
a = 0;
b = 2;
h = (b-a)/n;
x = zeros(1,n);
X = linspace(0, 2, 31);
Y_f = exp(-2*X);
Y_g = sin(X);
D_f = zeros(n, n);
D_g = zeros(n, n);

%Computing evenly spaced nodes
x(1) = a;
for p = 1:n
    x(p+1) = x(1) + p*h;
end

%Declaring y values
y_f = exp(-2*x);
y_g = sin(x);

%Computing divided difference table for f(x) and g(x)
for i = 1:n
    D_f(i,1) = y_f(i);
    D_g(i,1) = y_g(i);
end

for j = 2:n
    for k = j:n
        D_f(k,j) = (D_f(k,j-1) - D_f(k-1,j-1))/(x(k)-x(k-j+1));
        D_g(k,j) = (D_g(k,j-1) - D_g(k-1,j-1))/(x(k)-x(k-j+1));
    end
end    

%Using Horners Method to create Newtons Polynomials
S_f = D_f(end,end);
S_g = D_g(end,end);
for i = n-1:-1:1
    S_f = S_f.*(X-x(i)) + D_f(i,i);
    S_g = S_g.*(X-x(i)) + D_g(i,i);
end

%Plotting
figure
subplot(2,1,1);
plot(X,Y_f,'b');
hold on
plot(X,S_f,'gx');
title('Newton Polynomial of e^{-2x}');
legend('e^{-2x}', 'Newtons poly.', 'Location' ,'northeast');
xlabel('x');
ylabel('e^{-2x}');
subplot(2,1,2);
plot(X,Y_g,'b');
hold on
plot(X,S_g,'ro');
title('Newton Polynomial of sin(x)');
legend('sin(x)', 'Newtons poly.', 'Location' ,'northwest');
xlabel('x');
ylabel('sin(x)');
