%Final Question 2

clear all
close all

%Declare Variables 
n = 5;
x = linspace(-2, 2, n);
X = linspace(-2, 2, 3);
y = x.^2;
Y = X.^2;
L = ones(n,length(X));
P = zeros(size(X));
D = zeros(n, n);
a = zeros(1,n);
El = zeros(size(X));
En = zeros(size(X));
Ev = zeros(size(X));

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

%computing Vandermonde 
V = polyfit(X, Y, (n-1));
Vy = polyval(V,X);


%Computing Error for Lagrange
El = abs((Y - P)./Y);

%Computiing Error for Newton
En = abs((Y - S)./Y);

%Computiing Error for Newton
EV = abs((Y - Vy)./Y);

%Plotting 
figure
subplot(2,1,1);
plot(X,Y,'black');
hold on
plot(X,P,'g--x');
plot(X,S,'ro');
plot(X,Vy,'c*');
title('Lagrange vs Vandermonde vs Newton Polynomials');
legend('x^2', 'Lagranges poly.', 'Newtons poly.', 'Vandermond poly');
xlabel('x');
ylabel('x^2');
subplot(2,1,2);
plot(X,El,'gx');
hold on
plot(X,En,'ro');
plot(X,EV,'c*');
title('Relative Error of Lagrange vs Newton Polynomials');
legend('Lagranges poly.', 'Newtons poly.', 'Vandermonde poly.');
xlabel('x');
ylabel('Relative Error');