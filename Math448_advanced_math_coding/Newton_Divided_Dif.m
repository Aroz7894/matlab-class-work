%Newton_Divided_Dif.m
function Newton_Divided_Dif(xn, fx) %xn is array of x's, fx = f(xn)

%Declare Variables 
n = length(xn);   %Polynomial + 1
%f = @(x) cos(x/2);
%x = linspace(-pi/2, pi/2, n);
X = linspace(-10, 10, 31);
%y = f(x);
%Y = f(X);
D = zeros(n, n);
a = zeros(1,n);
En = zeros(size(X));

%Computing Newtons Divided Dif table
for i = 1:n
    D(i,1) = fx(i);
end

for j = 2:n
    for k = j:n
        D(k,j) = (D(k,j-1) - D(k-1,j-1))/(xn(k)-xn(k-j+1));
    end
end    

%Using Horners Method to create Newtons Polynomial
S = D(end,end);
for i = n-1:-1:1
    S = S.*(X-xn(i)) + D(i,i);
end
disp(D);
disp(S);

%Computiing Error for Newton
En = abs((Y - S)./Y);

%Plotting 
% figure
% subplot(2,1,1);
% plot(X,Y,'b');
% hold on
% plot(X,S,'ro');
% title('Newton Polynomials');
% legend('cos(x/2)', 'Newtons poly.', 'Location' ,'northwest');
% xlabel('x');
% ylabel('cos(x/2)');
% subplot(2,1,2);
% plot(X,En,'ro');
% title('Relative Error of Newton Polynomials');
% legend('Newtons poly.', 'Location' ,'northwest');
% xlabel('x');
% ylabel('Relative Error');
