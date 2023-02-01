function xfa = False_Position_Method(ints, inte,tol,maxit)

%Compute False Position Method
%Declare Variables
f = @(x) x^3 + 2*x^2-3*x -1;
a = ints; 
b = inte; 
p = zeros(3);
q = zeros(3);
delta = tol;
p(1) = a;
p(2) = b;
q(1) = f(p(1));
q(2) = f(p(2));

%computing the root
i = 1;
while i <= maxit 
    p(3) = p(2) - q(2)*((p(2) - p(1))/(q(2)-q(1)));
    y = Rate_Order_Convg(f,a,p(2),p(3));
    fprintf('Rate of Convergence: %d\n', y);
    if abs(p(3) - p(2)) <= delta
        break
    end
    q(3) = f(p(3));
    if q(3) * q(2) < 0
        p(1) = p(2);
        q(1) = q(2);
    end
    p(2) = p(3);
    q(2) = q(3);
    i = i+1;
end
xfa = p(3);