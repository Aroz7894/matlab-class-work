%Nevilles Iterated Interpolation

function Neville_Inter(x, xn)       %xn an array of x's
f = @(x) cos(x);
fxn = f(xn); 
n = size(xn);
Q = zeros(n(2),n(2));
Q(1:n) = fxn; 

for i = 1:n
    for j = 1:i
        Q(i,j) = ((x - xn(i-j))*Q(i, j-1) - (x-xn(i))*Q(i-1,j-1))/(xn(i)-xn(i-j));
    end
end

disp(Q);
