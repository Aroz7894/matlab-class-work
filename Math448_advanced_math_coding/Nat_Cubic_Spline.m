%Natural Cubic Spline
function Nat_Cubic_Spline(xn) %xn array of inputs where xn(1) < xn(2)< ...<xn(n)

%Declare Variables
n = length(xn);
f = @(x) cos(x/2);
a = f(xn);
h = zeros(1,n);
alpha = zeros(1,n);
l = zeros(1,n);
mu = zeros(1,n);
z = zeros(1,n);
c = zeros(1,n);
b = zeros(1,n);
d = zeros(1,n);

for i = 1:n-1
    h(i) = xn(i+1) - xn(i);
end
for i = 2:n-1
    alpha(i) = 3/h(i)*(a(i+1) -a(i)) - 3/h(i-1)*(a(i)-a(i-1));
end
l(1) = 1;
mu(1) = 0;
z(1) = 0;

for i = 2:n-1
    l(i) = 2*(xn(i+1)-xn(i-1))-h(i-1)*mu(i-1);
    mu(i) = h(i)/l(i);
    z(i) = (alpha(i)- (h(i-1)*z(i-1)))/l(i);
end

l(n) = 1;
z(n) = 0;
c(n) = 0;

for j = n-1:-1:1
    c(j) = z(j) - mu(j)*c(j+1);
    b(j) = (a(j+1) - a(j))/h(j) - (h(j)*(c(j+1) + 2*c(j))/3);
    d(j) = (c(j+1)-c(j))/(3*h(j));
end    

fprintf('a = \n');    
disp(a(1:n-1)); 

fprintf('b = \n');    
disp(b(1:n-1)); 

fprintf('c = \n');    
disp(c(1:n-1));

fprintf('d = \n');    
disp(d(1:n-1)); 