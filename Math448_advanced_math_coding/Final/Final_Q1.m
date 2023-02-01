%Final Question 1
%Newton Root finding method for system of nonlinear equations 

function Final_Q1(xstart, ystart,tol,maxit)

%Compute newton method
%Declare Variables
f =  @(x,y) x^2 - 2*y^2 + 2;
g =  @(x,y) x*y + 2;
fpx = @(x,y) 2*x;
fpy =  @(x,y) -4*y;
gpx = @(x,y) y;
gpy = @(x,y) x;
xa(1) = xstart;
ya(1) = ystart;
fx = f(xa(1),ya(1));
gx = g(xa(1),ya(1));
JI = [fpx(xa(1),ya(1)) fpy(xa(1),ya(1)); gpx(xa(1),ya(1)) gpy(xa(1),ya(1))]^-1;
i = 2;
delta = tol;

%Compute root
while i <= maxit
    p = JI*[fx;gx];
    xa(i)  = xa(i-1) - p(1);
    ya(i) = ya(i-1) - p(2); 
    fx = f(xa(i),ya(i));
    gx = g(xa(i),ya(i));
    JI = [fpx(xa(i),ya(i)) fpy(xa(i),ya(i)); gpx(xa(i),ya(i)) gpy(xa(i),ya(i))]^-1;
    ex(i) = abs(xa(i) - xa(i-1));
    ey(i) = abs(ya(i) - ya(i-1));
    if ex(i) <= delta && ey(i) <= delta
        break
    end
    i = i + 1;
end
Rate_Order_Convg_mod(ex,ey);
fprintf('(x,y) = (%f,%f)\n', xa(end),ya(end));


