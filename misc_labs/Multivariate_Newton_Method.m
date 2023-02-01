function [xna, i] = Multivariate_Newton_Method(start,tol,maxit)

%Multivariate Newton Method
%Notes: x_new = x_old - Jacobian(F(x_old))/F(x_old)  
%4 eq: w1+w2-2 = 0
%      w1x1 + w2x2 = 0
%      w1(x1)^2 + w2(x2)^2 - 2/3 = 0
%      w1(x1)^2 + w2(x2)^2 = 0
% n needs to be either 3 or 4

%Compute newton method
%Declare Variables
f1 =  @(x) 16*x^4 - 40*x^3 + 5*x^2 + 20*x + 6;
fp1 = @(x) 64*x^3 - 120*x^3 + 10*x + 20;
Jacobian = [];
xa = 0;
xs = start;
fx1 = f1(xs);
fpx1 = fp1(xs);
xa(1) = 100; 
i = 2;
delta = tol;

%Compute root
while i <= maxit
    xs = xs - (fx1/fpx1);
    xa(i) = xs;
    fx1 = f1(xs);
    fpx1 = fp1(xs);
    if abs(xa(i) - xa(i-1)) <= delta
        break
    end
    i = i + 1;
end
xna = xa(end);

