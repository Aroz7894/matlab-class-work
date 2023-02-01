function Project2part3c(M, x0, n)

%Part C
xn_new = M*x0;
i = 2;

while i <= n  
    xn_old = xn_new;
    xn_new = M*xn_old;
    if abs(xn_old - xn_new) < .00001
        break;
    end
    i = i+1;
end

fprintf('The %.0f term vector in the fixed point iteration is:\n', i);
disp(xn_new);