%Rozniakowski_Andrew_FPI.m

%Andrew Rozniakowski

%This program asks the user to input an initial value that is between 1 and
%2. The program checks if the inputed value is between 1 and 2 and will
%display and appropriate error message if it is not true. The program then
%computes 100 interates of the FPI for the given fuction. It then graphs
%the iterates as blue x's and if the function converges the program plots
%the value it converges to with a green horizontal line.

%Part D: I believe this function converges by the The Fixed-Point Iteration
%Theorem. By taking the derivative of the function g(x) = (x^2 + 2)/3,
%g'(x) is less than zero for all values of x between 1 and 2.


%Declare variables 
init = 0;
init = input('Please enter an initial value between 1 and 2\n');
ans_arr = zeros(1,100);
point_arr = zeros(1,100);

%Error checking 
if init >= 2 || init <= 1
    fprintf('The number you entered is not between 1 and 2\n');
    return
end

%Computing FPI.  
ans_arr(1) = (init^2 + 2)/3;
point_arr(1) = init;
fprintf('x_1 = %f\n',ans_arr(1));
for i = 2:100
    ans_arr(i) = ((ans_arr(i-1)-1)^2 + 2)/3;
    point_arr(i) = ans_arr(i-1);
end 

%Plotting the FPI
plot(ans_arr,point_arr,'b x');
hold on
plot([.7 .7], 'r')
title('Orbit 2');