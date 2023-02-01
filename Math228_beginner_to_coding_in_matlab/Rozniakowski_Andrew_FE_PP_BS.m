%Rozniakowski_Andrew_FE_PP_BS.m

%Andrew Rozniakowski

%This program takes input from the user for an nxm matrix and a nx1 column
%vecto. This program does error checking to make sure the inputed values
%are correct. It also makes a check if the matrix is singular. If it is the
%program is exited and an appropriate message is outputted. The then 
%computes the solutions to the equation using forward elimination, partial 
%pivoting and back substitution. 

%Declare variables
M = [];
M = input('Enter and n x m matrix\n');
b = [];
b = input('Enter a n x 1 column vector\n');
[rb cb] = size(b);
[rM cM] = size(M);
n = rb;
copy_row = 0;
copy_b = 0;
singular = 'F';
x = zeros(n);
x(n) = b(n)*M(n,n);

%Error checking
if rb ~= rM || cb ~= 1 
    fprintf('Error: The correct dimensions were not entered');
    return
end

%Forward Elimination with Partial Pivoting
t = 0;
for k = 1:n-1
    if M(k,k) == 0
        singular = 'T';
        for i = k+1:n
            if(M(i,k) ~= 0)
                copy_row = M(i,:);
                M(i,:) = M(k,:);
                M(k,:) = copy_row;
                copy_b = b(i);
                b(i) = b(k);
                b(k) = copy_b;
                singular = 'F';
                break
            end
        end
    end
    if singular == 'T'
        fprintf('Error: Matrix is singular\n');
        return;
    end
    for i = k+1:n
        t = M(i,k)/M(k,k);
        M(i,k) = 0;  
        for j = k+1:n
            M(i,j) = M(i,j) - t*M(k,j);
        end
        b(i) = b(i) - t*b(k);
    end
end

%Back substitiution to find the solution
for i = n:-1:1
    s = b(i);
    for j = i+1:n
        s = s - M(i,j)*x(j);
    end
    x(i) = s/M(i,i);
end

%Outputting the solutions
fprintf('The solutions are:\n')
for i = 1:n
    fprintf('x_%d = %d\n',i, x(i));
end