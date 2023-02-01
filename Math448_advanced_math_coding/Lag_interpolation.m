%Lag_interpolation.m
function Lag_interpolation(xn, fx) %xn is array of x's, fx = f(xn)

%Declare variables 
n = length(xn);       %Lagrange Polynomial + 1
%f = @(x) cos(x/2);
%x = linspace(-pi/2, pi/2, n);
X = linspace(-10, 10, 31);
%y = f(x);
%Y = f(X);
L = ones(n,length(X));
P = zeros(size(X));
El = zeros(size(X));

%Computing Lagrange Polynomial
for i=1:n
    for j = 1:n
        if i ~= j
            L(i,:) = L(i,:).*(X-xn(j))/(xn(i)-xn(j));
        end
    end
    P = P + fx(i).*L(i,:);
end    
disp(P);

%Computing Error
%El = abs((Y - P)./Y);

%Plotting 
% figure
% subplot(2,1,1);
% plot(X,Y,'b');
% hold on
% plot(X,P,'rx');
% title('Lagrange Polynomial');
% legend('cos(x/2)', 'Lagranges poly.', 'Location' ,'northwest');
% xlabel('x');
% ylabel('cos(x/2)');
% subplot(2,1,2);
% plot(X,El,'rx');
% title('Relative Error of Lagrange Polynomial');
% legend('Lagranges poly.', 'Location' ,'northwest');
% xlabel('x');
% ylabel('Relative Error');
