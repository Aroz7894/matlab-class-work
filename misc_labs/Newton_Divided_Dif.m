%Newton_Divided_Dif.m

%andrew Rozniakowski

%Declare Variables
n = 0;
x = 0;
y = 0;
n = input('What order should this be\n');
x = input('Input a matrix of n+1 values for x\n');
y = input('Input a matrix of n+1 values for x\n');
d = zeros(n,n);

%initialize tabel
for i = 1:n+1 
    d(i,1) = y(i);
end

for j = 1:n
    for k = j:n
        d(k,j) = (d(k,j-1) - d(k-1,j-1))/(x(k)- x(k-j));
    end
end

fprintf('%d\n', d);
