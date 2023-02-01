%Hermite Interpolation
function Hermite_Int(xn, fx, fpx) %xn is array of x's, f(xn) = fxn

%f = @(x) cos(x);
%fp = @(x) sin(x);
%fx = f(xn);
%fpx = fp(xn); 
n = length(xn);
Q = zeros(2*n,2*n);
z = zeros(1,2*n);

for i = 1:n
    z(2*i-1) = xn(i);
    z(2*i) = xn(i);
    Q(2*i-1,1) = fx(i);
    Q(2*i,1) = fx(i);
    Q(2*i,2) = fpx(i);
    if i ~= 1
        Q(2*i-1,2) = (Q(2*i-1,1)-Q(2*i-2,1))/(z(2*i-1) - z(2*i-2));
    end
end
for i = 3:2*n
    for j = 3:i
        Q(i,j) = (Q(i,j-1) - Q(i-1,j-1))/(z(i)-z(i-(j-1)));
    end
end
for k = 1:2*n
    q(k) = Q(k,k);
end
disp(Q);
disp(q);
    
% for i = 1:2*n
%     for j = 1:i
%         H = @(x) q(i)*
%         p = p + H(x);
%     end
% end    
    
    