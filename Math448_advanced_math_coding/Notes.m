%Coding simpsons 

% [x0,x2] + [x2,x4] = h/3[(f0 + 4f1 + f2)+(f2 + 4f3 + f4)+...)]
%                   = h/3[f0 + 4*sum from k = 1 to n/2 f(2k-1) + 2*sum from k=1 to n/2 -1 of 2k + fn]
%error: sum from i=1 to n/2 of h^5/90 f''''(Ei) where x(2i-2)<Ei < x(2i) =>
%(h = (b-a)/n)
 