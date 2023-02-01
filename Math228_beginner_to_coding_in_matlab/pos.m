function[answer] = pos(A)

%This fumction will take in a matrix and check if it has any negative
%values (excludes 0). It returns F if the matrix does have a negative value
%or a  0, and T if every value is positive or a 0 

%Andrew Rozniakowski

%Declare Variables
rows = 0; 
cols = 0;
[rows cols] = size(A); 
n = 0;
n = rows * cols; 
answer = 'T';

%Computing Checking for values less than or equal to 0
for i = 1:n
    if A(i) <= 0
        answer = 'F';      
    end
end
