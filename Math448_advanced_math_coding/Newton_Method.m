function [xna, i] = Newton_Method(start,tol,maxit)

%Newton Root finding method

%Compute newton method
%Declare Variables
f =  @(x) 16*x^4 - 40*x^3 + 5*x^2 + 20*x + 6;
fp = @(x) 64*x^3 - 120*x^3 + 10*x + 20;
xa = 0;
xs = start;
fx = f(xs);
fpx = fp(xs);
xa(1) =100; 
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
xna = xa(end);

