%backsub.m

%Andrew Rozniakowski

%declare variables 
u = [1 2 3; 0 4 5; 0 0 6];
d =[6; 8; 12];
n = length(d);
x = zeros(n);
x(n) = d(n)*u(n,n);

for i = n-1:-1:1
    s = d(i);
    for k = i+1:n
        s = s - u(i,k)*x(k);
    end
    x(i) = s/u(i,i);
end

for j = 1:n
    fprintf('x_%d = %d\n',j, x(j));
end