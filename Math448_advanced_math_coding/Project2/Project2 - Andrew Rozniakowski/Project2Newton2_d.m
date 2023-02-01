%Project 2, Question 2 part d

function output = Project2Newton2_d(x0, y0, a, b, c)
z0 = x0 + y0*1i;
f = @(x)x^2 + a*b + c;
fp = @(x) 2*x;
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
%fprintf('it count = %d, I.C = %.2f + %.2fi, root = %4.4f + %5.4fi\n',j,x0, y0, real(output), imag(output));