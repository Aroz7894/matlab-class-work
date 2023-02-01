%Rozniakowsi_Andrew_primitive.m

%Andrew Rozniakowski

%This program prompts the user to enter a square nonnegative matrix A and 
%checks if it is primitive. First the inputed matrix is checked to be both 
%square and nonnegative using functions i wrote called square_check and 
%nonneg_check, that both take a Matrix as their parameters. Then the 
%matrix is put to the power k until A^k is primitive (positive square matrix)
% or it reaches its limit of ((n - 1)^2) + 1, where n by n is the size of 
%the matrix. I check if the matrix A^k is positive 
%using another fucntion i wrote called pos (dont need to chheck if its 
%square again, all square matrices multiplied together will result in a 
%square matrix). If it is primitive the program will output to the 
%screen "A to the power k is positive" if the matrix is not primitive it 
%will say "There is no value k such that A^k is primitive before k eceeds 
%its limit".

CLEAR ALL

%Declare Variables
A = input('Enter a nonnegative square matrix\n');
k = 1; 
B = size(A);
n = B(1);
limit = ((n - 1)^2) + 1;
pos_ans = '';
square_ans = '';
non_neg_ans = '';

%Check A is nonegative and square for the inputed matrix, if not true, return
non_neg_ans = nonneg_check(A);
square_ans = square_check(A);

if non_neg_ans == 'F' || square_ans == 'F'
    fprintf('The matrix you entered was not square or included a negative number\n');
    return
end

%Computing matrix A^k, and checking if A^k is positive
for k = k:limit
    A = A^k;
    pos_ans = pos(A);
    if pos_ans == 'T'
        %Is primitive output
        fprintf('A to the power %d is positive\n', k );
        return
    end
end 

%Not primitive output
fprintf('There is no value k such that A^k is primitive before k exceeds its limit\n');

