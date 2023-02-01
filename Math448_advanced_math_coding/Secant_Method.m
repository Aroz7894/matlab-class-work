function [xsa] = Secant_Method(f,int,tol,maxit)
%Declare Variables
digits(20);
a = int(1); 
b = int(2); 
fa = eval(subs(f,a));
fb = eval(subs(f,b)); 
x(1) = a; 
x(2) = a - fa*(a-b)/(fa-fb); 
e = 1;  
i = 2; 
while (i<= maxit)
    fb = fa;     
    fa = eval(subs(f,x(i)));     
    alpha = fa*(x(i)-x(i-1))/(fa-fb);     
    x(i+1) = x(i) - alpha;     
    e = abs(x(i+1)-x(i)); 
    if e <= tol
        break
    end
    a = x(i+1);     
    b = x(i);    
    i = i+1;     
end
xsa = vpa(x(end));
