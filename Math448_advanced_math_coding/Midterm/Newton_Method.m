function xna = Newton_Method(start,tol,maxit)

%Newton Root finding method

%Compute newton method
%Declare Variables
f =  @(x)  1/x - 2;
fp = @(x) -(1/x^2);
xs = start;
fx = f(xs);
fpx = fp(xs);
xa(1) = 20; 
i = 2;
delta = tol;

%Compute root
while i <= maxit
    xs = xs - (fx/fpx);
    xa(i) = xs;
    fx = f(xs);
    fpx = fp(xs);
    fprintf('%d',xs);
    if abs(xa(i) - xa(i-1)) <= delta
        break
    end
    i = i + 1;
end
xna = xa;

