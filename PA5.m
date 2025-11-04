%PA5
%problem 1
%Matrix A
A = [2 0 1 8 0 -2; 3 4 7 3 7 6; -6 4 -1 2 5 9]
% Performing the following transpositions on matrix A
transpose(A)
A'
A.'

%Matrix B
B = [ 3+j.*2 -6-j.*7 1-j; -5+j.*2 3+j 1+j.*7; 4-j.*3 7+j.*8 j.*3]
%Perform the following transpositions on matrix B
transpose(B)
B'
B.'

%problem 2
%Coefficients of the given system of linear equations
X = [3 4 -3 pi 1; 1 -1 5 -4 6; 3 -5^(1/2) -1 7 -9; 7 4 -7 8 2; 9 csc(3) -11 (-6/5) 2]
%Constants of the given system system of linear equations
Y = [1; 12; -7; 2; 0]
%Performing the Inverse method
x_inv = inv(X)*Y
%Displays the solution to the inverse method
disp(x_inv)

%Performing Cramer's Rule
n = length(Y)
x_cramer = zeros(n,1)
%iterating over each variable through each column of matrix X
for j = 1:n
    Xj = X;            % Copy the original matrix
    Xj(:, j) = Y;      % Replace the j-th column with Y
    x_cramer(j) = det(Xj) / det(X); %Computes the jth variable using cramer's rule
end
%Displays the solution to the cramer's rule
disp(x_cramer)





