%Mullers Method
function [xm , i] = Mullers_Method(x0, x1, x2, tol, maxit)
f = @(x) x^2 + 1;
h1 = x1 - x0;
h2 = x2 - x1; 
p1 = (f(x1) - f(x0))/h1;
p2 = (f(x2) - f(x1))/h2;
d = (p2 - p1)/(h2+h1);
i = 3;

while i <= maxit
    b = p2 + h2*d;
    D = (b^2 - 4*f(x2)*d)^(1/2);
    if abs(b - D) < abs(b+D)
        E = b + D;
    else
        E = b - D;
    end
    h = -2 * f(x2)/E;
    p = x2 + h;
    %y = Rate_Order_Convg(f,x0,p,h);
    %fprintf('Rate of Convergence: %d\n', y);
    if abs(h) < tol
        break
    end
    x0 = x1;
    x1 = x2;
    x2 = p;
    h1 = x1 - x0;
    h2 = x2 - x1;
    p1 = (f(x1) - f(x0))/h1; 
    p2 = (f(x2) - f(x1))/h2;
    d = (p2 - p1)/(h2+h1);
    fprintf('it count = %d, it = %4.16f + %5.4fi\n',i, real(p), imag(p));
    i = i+1;
end  
xm = p;