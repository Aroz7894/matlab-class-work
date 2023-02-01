%LexLutherProject
clear all
digits(20);
syms x;
LexsFunc = [exp(2*x-1) - (2*x^2) - 1/2, cos(x) - exp(-x^2) + 1, x^5 - 9*x^4 - x^3 + 17*x^2 - 8*x - 8]; 

%Finding Roots of x^5 - 9*x^4 - x^3 + 17*x^2 - 8*x - 8
f3_1 = False_Position_Method(LexsFunc(3), [8,9], 1*10^-14, 100); %8.9
s3_1 = Secant_Method(LexsFunc(3), [-10,10], 1*10^-14, 100); 

f3_2 = False_Position_Method(LexsFunc(3), [-1.3,1.3], 1*10^-14, 100); %-0.51
s3_2 = Secant_Method(LexsFunc(3), [-1.3,1.3], 1*10^-14, 100);

f3_3 = False_Position_Method(LexsFunc(3), [-1.5,1.5], 1*10^-14, 100); % -1.3
s3_3 = Secant_Method(LexsFunc(3), [-1.5,1.5], 1*10^-14, 100);

%Printing out roots for x^5 - 9*x^4 - x^3 + 17*x^2 - 8*x - 8
fprintf('Roots for %s:\n', char(LexsFunc(3)));
fprintf('Using False Position Methd = %.14f\n',double(f3_1));
fprintf('Using Secant Method = %.14f\n\n', double(s3_1));

fprintf('Using False Position Method = %.14f\n', double(f3_2));
fprintf('Using Secant Method = %.14f\n\n', double(s3_2));

fprintf('Using False Position Method = %.14f\n', double(f3_3));
fprintf('Using Secant Method = %.14f\n\n', double(s3_3));

%Finding Roots of exp(2*x-1) - (2*x^2) - 1/2
b1_1 = Bisection_Method(LexsFunc(1), [-0.6,0.6], 1*10^-14, 100); %.5 root
s1_1 = Secant_Method(LexsFunc(1), [-1,1], 1*10^-14, 200);

%Printing Roots of exp(2*x-1) - (2*x^2) - 1/2
fprintf('Roots for %s:\n', char(LexsFunc(1)));
fprintf('Using Bisection Method = %.14f\n', double(b1_1)); %.5 root
fprintf('Using Secant Method = %.14f\n\n', double(s1_1));

%Finding Roots of cos(x) - exp(-x^2) + 1
f2_1 = False_Position_Method(LexsFunc(2), [3.5,4], 1*10^-14, 200); %3.15
n2_1 = Newton_Method(LexsFunc(2), [-10,10],3.5, 1*10^-4, 100);

n2_2 = Newton_Method(LexsFunc(2), [-10,10], 3, 1*10^-4, 100); %3.13
f2_2 = False_Position_Method(LexsFunc(2), [3,4], 1*10^-14, 200);

f2_3 = False_Position_Method(LexsFunc(2), [-3,-1], 1*10^-14, 200); %-3.13
n2_3 = Newton_Method(LexsFunc(2), [-10,10], -3, 1*10^-4, 100);

f2_4 = False_Position_Method(LexsFunc(2), [-4,-3.5], 1*10^-14, 400); %-3.15
n2_4 = Newton_Method(LexsFunc(2), [-10,10], -3.5, 1*10^-4, 100);


%Printing out roots for cos(x) - exp(-x^2) + 1
fprintf('Roots for %s:\n', char(LexsFunc(2)));
fprintf('Using False Position Method = %.14f\n', double(f2_1)); %3.15
fprintf('Using Newton Method = %.14f\n\n', double(n2_1));

fprintf('Using False Position Method = %.14f\n', double(f2_2)); %3.13
fprintf('Using Newton Method = %.14f\n\n', double(n2_2));

fprintf('Using False Position Method = %.14f\n', double(f2_3)); %-3.13
fprintf('Using Newton Method = %.14f\n\n', double(n2_3));

fprintf('Using False Position Method = %.14f\n', double(f2_4)); %-3.15
fprintf('Using Newton Method = %.14f\n\n', double(n2_4));

%Decaring Variables for Part 3
finalx = zeros(1,8);
r = zeros(8,1);
rk = zeros(8,1);
a = zeros(8,1);
b = zeros(8,1);
z_b = zeros(8,1);
z_s = zeros(8,1);
Lex_will_Perish = ones(8,3);
%Lex_Lock_Box = zeros(8,1);
y = zeros(8,1);

%Computing with 4 decimal points for Part 3
r(1) = double((f3_1 + s3_1)/2); % average of 8.91 root 4 decimal places
r(2) = double((f2_1 + n2_1)/2); %average of 3.15 root 4 decimal places
r(3) = double((f2_2 + n2_2)/2); %average of 3.13 root 4 decimal places
r(4) = double((b1_1 + s1_1)/2); %average of .5 root 4 decimal places
r(5) = double((f3_2 + s3_2)/2); % average of -.051 root 4 decimal places
r(6) = double((f3_3 + s3_3)/2); % average of - 1.3875 root 4 decimal places
r(7) = double((f2_3 + n2_3)/2); %average of -3.13 root 4 decimal places
r(8) = double((f2_4 + n2_4)/2); %average of -3.15 root 4 decimal places

%computing with 14 decimal points
r_14(1) = vpa((f3_1 + s3_1)/2); % average of 8.91 root 4 decimal places
r_14(2) = vpa((f2_1 + n2_1)/2); %average of 3.15 root 14 decimal places
r_14(3) = vpa((f2_2 + n2_2)/2); %average of 3.13 root 14 decimal places
r_14(4) = vpa((b1_1 + s1_1)/2); %average of .5 root 14 decimal places
r_14(5) = vpa((f3_2 + s3_2)/2); % average of -.051 root 14 decimal places
r_14(6) = vpa((f3_3 + s3_3)/2); % average of - 1.3875 root 14 decimal places
r_14(7) = vpa((f2_3 + n2_3)/2); %average of -3.13 root 14 decimal places
r_14(8) = vpa((f2_4 + n2_4)/2); %average of -3.15 root 14 decimal places


%Part 3B
rk(1) = abs(r(1) - r(2));
rk(8) = abs(r(7) - r(6));
for i = 2:7
    rk(i) = min(abs(r(i) - r(i-1)), abs(r(i) - r(i+1)));
end    


%Part 3C-3E
for i = 1:8
    a(i) = rk(i)* .1;
    b(i) = rk(i) * .3;
    z_b(i) = Bisection_Method(LexsFunc(1)*LexsFunc(2)*LexsFunc(3), [r(i)-a(i),r(i)+(i)], 1*10^-14, 4);
    z_s(i) = Secant_Method(LexsFunc(1)*LexsFunc(2)*LexsFunc(3), [r(i)-a(i),r(i)+(i)], 1*10^-14, 5);
    Lex_will_Perish(i) = r(i);
    Lex_will_Perish(i+8) = a(i);
    Lex_will_Perish(i+16) = b(i);
    y(i) = log(abs(z_b(i) - z_s(i)));
end    

%Printing Lex_will Perish
fprintf('Lex_will_perish = \n');
disp(Lex_will_Perish);
fprintf('\n');

%Lock box codes
%Lex_Lock_Box(1) = '(4,0)(2,9)(6,0)(3,0)';
%Lex_Lock_Box(2) = '(9,5)(0,0)(9,7)(1,9)';
%Lex_Lock_Box(3) = '(8,3)(3,1)(1,5)(0,2)';
%Lex_Lock_Box(4) = '(9,0)(7,9)(3,4)(3,6)';
%Lex_Lock_Box(5) = '(3,4)(2,8)(1,7)(8,3)';
%Lex_Lock_Box(6) = '(1,0)(5,5)(8,2)(6,2)';
%Lex_Lock_Box(7) = '(8,3)(3,3)(4,9)(3,1)';
%Lex_Lock_Box(8) = '(2,4)(5,1)(1,3)(3,1)';


%Printing Final Coordinates and lock box
fprintf('Final (x,y) coordinates:\n');
for i = 1:8
    fprintf('(%.6f, %f) ', double(r_14(i)), double(y(i)));
    Distance(double(r_14(i)), double(y(i)));
end

