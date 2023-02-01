ln = @(x)(log(x));
%Rozniakowski_Andrew_hypcosine

%Andrew Rozniakowski

%This program uses the expression "-ln(x - sqrt(x^2 - 1))" to calculate the
%inverse hyperbolic cosine function for x between 1,000,000 and 100,000,000
%at increments of 10,000 and then it plots it. But this function fails for 
%large values of x like we're using. So I rewrote the original expression 
% and used the new expression: 2ln((sqrt(x+1)/2)+(sqrt(x-1)/2) instead. 
%This program plots the old and new expression with the same parameters on
%x. 

%Part C: The incorrect expression (f_old) creates a graph that has line 
%segmets going up. When using very large numbers with this expression, the 
%(x-sqrt(x^2 - 1) part of the equation goes to zero. This is called the
%catasrophic loss of significance. Because of this some numbers dont change
%for a period of time, this is the straight line segments in the graph. The 
%correct expression (f_new) does not have this computing error 
%and therefore gives the correct smooth graph created by the inverse 
%hyperbolic cosine funtion.  

%Declare variables
xs_limit = 1000000;
xl_limit = 100000000;
x = linspace(xs_limit, xl_limit, 10000);
f_old = [];
f_new = [];

%Computing the functions 
for i = 1:length(x)
   f_old(end + 1) = -ln(x(i) - sqrt(x(i)^2 - 1));
   f_new(end + 1) = 2*ln((sqrt(x(i)+1)/2)+(sqrt(x(i)-1)/2));
end

%Plotting the functions
scatter(x, f_old, 'r', 'Marker', 'x');
hold on
scatter(x, f_new, 'b',  'Marker', 'o');
title('Original Exp vs. Rewritten Expr');
xlabel('1,000,000 < x < 100,000,000') 
ylabel('inverse hyperbolic cosine values') 
legend('y1 = -ln(x - sqrt(x^2 - 1))','y2 = 2*ln((sqrt(x+1)/2)+(sqrt(x-1)/2))','Location','southwest')
    