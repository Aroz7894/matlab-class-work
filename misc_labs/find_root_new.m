%root_find_new.m

%Takes in an intitial guess from user and checks if its in the interval. It
%computes the root using newtons method and output a graph of the
%iterations and the root approximaion after n iterations 

clear all 
close all

%Declare variables 
a = -2;
b = 0;
x0 = 0;
x0 = input('Enter an initial guess between -2 and 0\n');


if x0 < a || x0 > b
    fprintf('That was not within the interval');
    return 
end    

x = x0;
f = exp(2*x) - x^2 + 2*x;
fp = 2*exp(2*x) - 2*x+2;
i =0;
delta = .0001;

%Compute Newton root
while i < 100 && abs(f) > delta
    x = x - f/fp;
    i = i + 1;
    plot(i,x,'bo');
    hold on
    f = exp(2*x) - x^2 + 2*x;
    fp = 2*exp(2*x) - 2*x+2;
end

%output
if abs(f) < delta 
    fprintf('After %d iterations the root is approx %d\n', i ,x);
end