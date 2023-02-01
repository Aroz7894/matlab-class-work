%Rozniiakowski_Abdrew_rootfinder.m

%Andrew Rozniakowski

%This program will find the roots of the equation using both the bisection
%and newton method to at least 10 digits of precision. Newtons method 
%starts with an intitial guess of 2.5. Both methods will be between the 
%interval [2,3]. This program will output a single graph with both methods at
%each iterate for comparison.

%Part D: I know f(x) has a root because f(a)*f(b) < 0. We see, f(2) = -2
%and f(3) = 17, so f(a)*f(b) = -24 < 0. Therefore we know f(x) has a root. 
%We also know the root is unique. We know this because f'(x) is > 0 for
%every x in the interval [2,3]. Looking at the graphs of each method, 
%newtons method appears to be better and more effecient. While they both 
%finish on the exact same point, the bisection method takes longer to get 
%there. Its all around the graph, slowly getting closer to correct root 
%with each iterate. Newtons method starts at an initial value much closer 
%to the root and continues to get closer and closer. Every iterate of the 
%newtons method gives us a solid estimate of the root, while that is not 
%true for the bisection method. Newtons method is also more efficient, it
%is able to find a good estimate in only 3 iterations.

clear all 
close all

%Compute newton method
%Declare Variables
a = -1.6;
b = 1.6;
x = 2.5;
f = 17*x^2 - 8*x - x^3 - 9*x^4 + x^5 - 8;
fp = 3*x^2;
i = 1;
delta = .0001;

%Compute root
while i <= 10 && abs(f) > delta
    x = x - f/fp;
    i = i + 1;
    plot(i,x,'ro');
    hold on
    f = x^3 - 10;
    fp = 3*x^2;
end

%Compute Bisection Method
%Declare variables
ai = zeros(10);
bi = zeros(10);
m = zeros(10);
j = 0;
ai(1) = a;
bi(1) = b;
m(1) = (ai(1)-bi(1))/2;

%computing the root
for j = 1:50
    fm =  17*m(j)^2 - 8*m(j) - m(j)^3 - 9*m(j)^4 + m(j)^5 - 8;
    fa =  17*ai(j)^2 - 8*ai(j) - ai(j)^3 - 9*ai(j)^4 + ai(j)^5 - 8;
    m(j+1) = (ai(j) + bi(j))/2;
    if fm*fa < 0
        ai(j+1) = ai(j);
        bi(j+1) =  m(j);
    else 
       ai(j+1) = m(j);
       bi(j+1) = bi(j); 
    end
    plot(j,m(j),'bx');
end
%Plotting
title('Roots of x^3 -10');
legend('Newton Method (red circles)' , 'Bisection Method (blue xs)', 'Location', 'southeast');
xlabel('Iterates');
ylabel('Root');
