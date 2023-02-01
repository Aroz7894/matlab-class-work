%Rozniakowski_Andrew_lab9.m

%Anndrew Rozniakowski

%This program computes the 4th order Lagrange interpolation polynomial and 
%the 4th order Newton's polynomial for the equation f(x) = cos(x/2) on
%the interval [-pi/2, pi/2]. To find Newton's polynomial we use the divided
%difference table to find the coefficients, then we use generalized
%horner's method to find the polynomial. This program then graphs 2
%subplots. The first plots the Lagrange polynomial in green, Newton's
%polynomial in red and the original function in blue. The second subplot
%contains the relative error for the Lagrange polynomial in green while
%Newtons is in red.

clear all
close all

%Declare Variables 
n = 5;
x = linspace(-pi/2, pi/2, n);
X = linspace(-pi/2, pi/2, 31);
y = cos(x/2);
Y = cos(X/2);
L = ones(n,length(X));
P = zeros(size(X));
D = zeros(n, n);
a = zeros(1,n);
El = zeros(size(X));
En = zeros(size(X));

%Computing Lagrange Polynomial
for i=1:n
    for j = 1:n
        if i ~= j
            L(i,:) = L(i,:).*(X-x(j))/(x(i)-x(j));
        end
    end
    P = P + y(i).*L(i,:);
end    

%Computing Newtons Divided Dif table
for i = 1:n
    D(i,1) = y(i);
end

for j = 2:n
    for k = j:n
        D(k,j) = (D(k,j-1) - D(k-1,j-1))/(x(k)-x(k-j+1));
    end
end    

%Using Horners Method to create Newtons Polynomial
S = D(end,end);
for i = n-1:-1:1
    S = S.*(X-x(i)) + D(i,i);
end

%Computing Error for Lagrange
El = abs((Y - P)./Y);

%Computiing Error for Newton
En = abs((Y - S)./Y);

%Plotting 
figure
subplot(2,1,1);
plot(X,Y,'b');
hold on
plot(X,P,'gx');
plot(X,S,'ro');
title('Lagrange vs Newton Polynomials');
legend('cos(x/2)', 'Lagranges poly.', 'Newtons poly.', 'Location' ,'northwest');
xlabel('x');
ylabel('cos(x/2)');
subplot(2,1,2);
plot(X,El,'gx');
hold on
plot(X,En,'ro');
title('Relative Error of Lagrange vs Newton Polynomials');
legend('Lagranges poly.', 'Newtons poly.', 'Location' ,'northwest');
xlabel('x');
ylabel('Relative Error');