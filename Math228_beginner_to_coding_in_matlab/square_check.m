function[answer] = square_check(A)

%This fumction will take in a matrix and check if it is square, meaning the
%matrix is n by n. It will return T if it is square and F if it is not 

%Andrew Rozniakowski

%Declare Variables
rows = 0; 
cols = 0;
[rows cols] = size(A); 
answer = 'F';

%Computing zeros 
if rows == cols
    answer = 'T';      
end
