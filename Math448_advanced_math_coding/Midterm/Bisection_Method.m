function[xa,j] = Bisection_Method(ints, inte, tol, maxit)

%Compute Bisection Method
%Declare Variables
f = @(x) x^2 - 2;
a = ints;
b = inte;
e_n = 0;
p = 0;
p(1) = 0;
delta = tol;
j = 2;
FA = f(a);
FP = 0;
%computing the root
while j <= maxit
    p(j) = a + ((b-a)/2);
    FP = f(p(j));
    if FP == 0 || (b-a)/2 < delta
        break
    end
    if FA*FP > 0 
        a = p(j);
        FA = FP;
    else 
       b = p(j); 
    end
    j = j+1;
end
%Rate_Order_Convg_mod(p);
xa = p;