%Project 2, Question 2 part e

function output = Project2Newton2_e(x0, y0)
z0 = x0 + y0*1i;
f = @(x)x^3 - x;
fp = @(x) 3*x^2 - 1;
fx = f(z0);
fpx = fp(z0);
xa(1) = z0;
j = 2;

while j <= 100
    z0 = z0 - (fx/fpx);
    xa(j) = z0;
    fx = f(z0);
    fpx = fp(z0);
    if abs(xa(j) - xa(j-1)) <= .00001*x0
        break
    end
    j = j + 1;
end
output = xa(end);
%fprintf('it count = %d, root = %4.4f + %5.4fi\n',j, real(output), imag(output));
