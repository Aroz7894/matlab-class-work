%Newton Polynomial

%To find Newton's polynomial we use the divided
%difference table to find the coefficients, then we use generalized
%horner's method to find the polynomial.

clear all
close all

%Declare Variables 
n = 4;
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

%Computiing Error for Newton
En = abs((Y - S)./Y);

%Plotting 
figure
subplot(2,1,1);
plot(X,Y,'b');
hold on
plot(X,S,'ro');
title('Newton Polynomials');
legend('cos(x/2)', 'Newtons poly.', 'Location' ,'northwest');
xlabel('x');
ylabel('cos(x/2)');
subplot(2,1,2);
hold on
plot(X,En,'ro');
title('Relative Error of Newton Polynomials');
legend('Newtons poly.', 'Location' ,'northwest');
xlabel('x');
ylabel('Relative Error');