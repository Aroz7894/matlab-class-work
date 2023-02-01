function [xna] = Newton_Method(int,start,tol,maxit)

%Newton Root finding method

%Compute newton method
%Declare Variables
f =  @(x) 16*x^4 - 40*x^3 + 5*x^2 + 20*x + 6;
a = int(1); 
b = int(2);
xa = 0;
xs = start;
fp = @(x) 64*x^3 - 120*x^3 + 10*x + 20;
fx = f(xs);
fpx = fp(xs);
xa(1) = a; 
i = 2;
delta = tol;

%Compute root
while i <= maxit
    xs = xs - (fx/fpx);
    xa(i) = xs;
    fx = f(xs);
    fpx = fp(xs);
    if abs(xa(i) - xa(i-1)) <= delta
        break
    end
    i = i + 1;
end
xna = vpa(xa(end));

