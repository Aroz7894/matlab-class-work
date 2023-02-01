function [xba] = Bisection_Method(f,int,tol,maxit)

%Compute Bisection Method
%Declare Variables
digits(20);
a = int(1);
b = int(2);
p = 0;
delta = tol;
j = 1;
FA = eval(subs(f,a));
FP = 0;

%computing the root
while j <= maxit
    p = a + (b-a)/2;
    FP = eval(subs(f,p));
    if FP == 0 || (b-a)/2 < delta
        break
    end
    if FA*FP > 0 
        a = p;
        FA = FP;
    else 
       b = p; 
    end
    j = j+1;
end
xba = vpa(p);