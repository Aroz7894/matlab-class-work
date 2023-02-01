%Project Spline
function SplineProject(alpha, t)    

%Declare Variables
%delta ti = t(i) - t(i-1)
n = 3;       %order + 1
w = 2;     %window size
k = length(alpha);      %k is steps
m = 2*(n-1);
delta_t = zeros(1,w);
start = 2; %start of window
s = 0;
s_alpha = 0;
s_j = 0;
c = zeros(n,1);
b = zeros(n,1);
A = zeros(n,n);
S = zeros(m,k-(w-1));
S_alpha = zeros(n,k-(w-1)); 
alpha_new = 0;

%computing delta t
delta_t(1) = 0;
for i = 2:k
    delta_t(i) = t(i) - t(i-1);
end    
    
%computing S(m,k)
 S(1,1) = w*delta_t(start) + (w-1)*delta_t(start+1) + (w-2)*delta_t(start+2);
 S(2,1) = delta_t(start)^2 + (delta_t(start)+delta_t(start+1))^2 + (delta_t(start)+delta_t(start+1) + delta_t(start+2))^2;
 S(3,1) = delta_t(start)^3 + (delta_t(start)+delta_t(start+1))^3 + (delta_t(start)+delta_t(start+1) + delta_t(start+2))^3;
 S(4,1) = delta_t(start)^4 + (delta_t(start)+delta_t(start+1))^4 + (delta_t(start)+delta_t(start+1) + delta_t(start+2))^4;
for l = 2:k
    if start > k-(w-1)
        break
    end
        for p = start:start+(w-1)
            s = s + delta_t(p);
        end
        for g = 1:m
            for j = 1:g-1
                s_j = s_j - (factorial(g)/(factorial(j)*factorial(g-j)))*delta_t(start)^j*(S(g-j,l) + s^(g-j));
            end
            S(g,l) = S(g,l-1) + (w-1)*delta_t(start)^g - s_j + s^g;
        end
        start = start+1;
        s = 0;
        s_j = 0;
end
disp(S);

%computing S_alpha(m,k) 
start = 2;
s = 0;
s_j = 0;
S_alpha(1,1) = alpha(start) + alpha(start+1) + alpha(start+2);
S_alpha(2,1) = alpha(start)*t(start) + alpha(start+1)*(t(start)+t(start+1)) + alpha(start+2)*(t(start)+t(start+1)+t(start+2));
S_alpha(3,1) = alpha(start)*t(start)^2 + alpha(start+1)*(t(start)+t(start+1))^2 + alpha(start+2)*(t(start)+t(start+1)+t(start+2))^2;
for l = 2:k
    if start > k-(w-1)
        break
    end
        for p = start:start+(w-1)
            s_alpha = s_alpha + alpha(p);
        end
        for f = start:start+(w-1)
            s = s + delta_t(f);
        end
        for g = 1:n
            for j = 1:g-1
                s_j = s_j - (factorial(g)/(factorial(j)*factorial(g-j)))*delta_t(start)^j*(S_alpha(g-j,l) - alpha(start+(w-1))*s^(g-j));
            end
            S_alpha(g,l) = S_alpha(g,l-1) + (s_alpha*delta_t(start)^g) - s_j - alpha((w-1)+start)*s^g;
        end
        start = start+1;
        s = 0;
        s_j = 0;
end
disp(S_alpha);

A(1,1) = w;
for i = 2:n
    A(i,1) = S(i-1,k-(w-1));
end   
for i = 1:n
   A(i,2) = S(i,k-(w-1));
end   
for i = 1:n
    A(i,3) = S(i+1,k-(w-1));
end

for i = 1:n
    b(i) = S_alpha(i,k-(w-1));
end
c = A\b;
disp(c);

alpha_new = @(x) c(1) + c(2)*x.^(1) + c(3)*x.^(2);

close all

x = linspace(0,1,20);
plot(t,alpha, 'r-x');
hold on;
plot(x,alpha_new(x), 'b-o');
legend('Actual sin(x)', 'Recursive Method sin(x)');
xlabel('time');
title('Actual vs Interpulation of Sin(x)');

