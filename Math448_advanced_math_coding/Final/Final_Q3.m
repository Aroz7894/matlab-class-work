%Final Question 3
f = @(x) sin(x);
fp = @(x) cos(x);
x = 1;
h_1 = .1;
h_2 = .1;

%Two Point Formula
fprintf('Two Point Formula\n');
for i = 1:20
    TP_fp = (f(x+h_2) - f(x))/h_2;
    fprintf('i = %d, h = %d, Error = %.16f\n', i, h_2, abs(fp(x) - TP_fp));
    h_2 = h_2/10;
end

%Richardson's Extrapolation
fprintf('Richardsons\n');
for i=1:20
    R_fp = (f(x + h_1) - f(x-h_1))/(2*h_1);
    fprintf('i = %d, h = %d, Error = %.16f\n', i, h_1, abs(fp(x) - R_fp));
     h_1 = h_1/10;
end





