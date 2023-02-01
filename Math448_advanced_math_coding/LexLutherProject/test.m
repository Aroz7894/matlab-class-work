%test
clear all
syms x;
%fh = Lexs_Function;
LexsFunc = [exp(2*x-1) - (2*x^2) - 1/2, cos(x) - exp(-x^2) + 1, x^5 - 9*x^4 - x^3 + 17*x^2 - 8*x - 8]; 
%[g, i] =  Newton_Method(LexsFunc(2), [-10,10], -3.5, 1*10^-4, 100);
[g, i] = False_Position_Method(LexsFunc(2), [-4,-3.5], 1*10^-14, 400);