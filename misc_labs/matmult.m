%matmult.m

%Andrew Roz

%Matrix mult program

clear all

%Declare variables
A = [];
B = [];
rowA = 0;
colA = 0;
rowB = 0;
colB = 0;
A = input('Please enter a matrix\n');
[rowA colA] = size(A);
Bstr = strcat('Please enter a matrix with \ ', num2str(colA), ' rows\n'); 
B = input(Bstr);
[rowB colB] = size(B);

%Error checking
while colA ~= rowB
    fprintf('These matricies are not the right dimensions to multiply\n');
    str = strcat('Please enter a matrix with \ ', num2str(colA), ' rows\n'); 
    B = input(Bstr);  
    [rowB colB] = size(B);
end

%computing product
C = zeros(rowA, colB);
for j = 1:rowA
    for i = 1:colA
        for k = 1:colB
        C(j,i) = C(j,i) + A(j,k)*B(k,j);
        end
    end
end
        
fprintf('C = %d\n', C);
