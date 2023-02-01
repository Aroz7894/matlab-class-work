function [xfa] = False_Position_Method(f,int,tol,maxit)

%Compute False Position Method
%Declare Variables
digits(20);
a = int(1); 
b = int(2); 
p = zeros(3);
q = zeros(3);
delta = tol;
p(1) = a;
p(2) = b;
q(1) = eval(subs(f,p(1)));
q(2) = eval(subs(f,p(2)));

%computing the root
i = 1;
while i <= maxit 
    p(3) = p(2) - q(2)*((p(2) - p(1))/(q(2)-q(1)));
    if abs(p(3) - p(2)) <= delta
        break
    end
    q(3) = eval(subs(f,p(3)));
    if q(3) * q(2) < 0
        p(1) = p(2);
        q(1) = q(2);
    end
    p(2) = p(3);
    q(2) = q(3);
    i = i+1;
end
xfa = vpa(p(3));