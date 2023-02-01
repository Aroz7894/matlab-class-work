%forwardElim.m

%Andrew Rozniakowski

%Does forward elimination on a matrix with forward pivoting

%Declare variables
n = input('Enter the size for an nxn matrix\n');
m = input('Enter a square matrix of the indicated size\n');
b = input('Enter a right hand side vector of size nx1\n');
t = 0;
singular = 'F'; 
copy_row = 0;
copy_b = 0;

if(m(k,k) == 0)
    singular = 'T';
    for k = 1:n-1
        for i = k+1:n
            if(a(i,k) ~= 0)
                copy_row = m(i,:);
                m(i,:) = m(k,:);
                m(k,:) = copy_row;
                singular = 'F';
                copy_b = b(i);
                b(i) = b(k);
                b(k) = copy_b;
                break;
            end
                t = m(i,k)/m(k,k);
                m(i,k) = 0;  
            for j = k+1:n
                m(i,j) = m(i,j) - t*m(k,j);
            end
            b(i) = b(i) - t*b(k);
        end
    end
end

if(singular == 'T')
    fprintf('Error, matrix is singular');
    return
end

fprintf('b = %d\n', b);