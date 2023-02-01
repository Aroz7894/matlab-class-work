%Gen_Horners.m

%Andrew Rozniakowsi

%Declare Variables
a = [-1 1 2 4]; 
x = [.1 1.1 1.4 1.6];
X = 1.6;
Y = linspace(.1,1.6,31);
S = [];
S = zeros(4);
P = a(1) + (a(2)*(X-x(1))) + (a(3)*(X-x(1))*(X-x(1))) + (a(4)*(X-x(1))*(X-x(2))*(X-x(3)));
S = a(end);

for i = 3:-1:1
    S = (S.*(X - x(i))) + a(i);
end

%Plotting
plot(Y,S);
hold on
plot(Y,P);