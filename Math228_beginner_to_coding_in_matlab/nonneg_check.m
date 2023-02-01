function[answer] = nonneg_check(A)

%This fumction will take in a matrix and check if it has any negative values
%(includes 0). It will return true if every value of the matrix is either
%positive or 0, or it will return false if the matrix does contain 
%a negative number

%Andrew Rozniakowski

%Declare Variables
rows = 0; 
cols = 0;
[rows cols] = size(A); 
n = 0;
n = rows * cols; 
answer = 'T';

%Checking for negative values 
for i = 1:n
    if A(i) < 0
        answer = 'F';      
    end
end
