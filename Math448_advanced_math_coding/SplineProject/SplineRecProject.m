%Project Spline
function SplineRecProject(alpha, t)    

%Declare Variables
%delta ti = t(i) - t(i-1)
n = 3;       %order + 1
w = 60;     %window size
k = 4;      %k is steps
m = 2*(n-1);
i = k - (w-1);   %start if the window
delta_t = zeros(1,w);
c = zeros(1,n);
S = zeros(m,k);

%computing delta t
for i = 2:w+1
    delta_t(i) = t(i) - t(i-1);
end    
    
%computing S(m,k)  
for i = 2:w+1
    S(1,1) = S(1,1) + delta_t(3) + delta_t(3);
    S(2,1) = S(2,1) ;
    S(3,1) = S(3,1);
    S(4,1) = S(4,1);
end
for j = 1:k+1
    for l = 2:4
        S(l,j) = S(l, j-1) - (w-1)*delat_t(1)^l;
    end
end