function xsa = Secant_Method(ints, inte,tol,maxit)
%Declare Variables
f = @(x) x^2 - 2;
a = ints; 
b = inte; 
fa = f(a);
fb = f(b); 
x = 0;
x(1) = a; 
x(2) = a - fa*(a-b)/(fa-fb); 
e = 0;  
i = 2; 
while (i<= maxit)
    fb = fa;
    fa = f(x(i));     
    alpha = fa*(x(i)-x(i-1))/(fa-fb);  
    x(i+1) = x(i) - alpha;     
    e(i+1) = abs(x(i+1)-x(i)); 
    if e(i+1) <= tol
        break
    end
    a = x(i+1);     
    b = x(i);    
    i = i+1;     
end
xsa = x;
