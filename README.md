# PA5 — README
2ECE-C

## Project Title

Matrix Operations and System of Linear Equations Solver (PA5)

## Overview

This MATLAB script (`PA5.m`) focuses on fundamental linear algebra operations. **Problem 1** explores different transposition methods on both real and complex-valued matrices. **Problem 2** solves a $5 \times 5$ system of linear equations using two primary techniques: the **Inverse Method** and **Cramer's Rule**. This README explains the code's purpose and documents the parts cell-by-cell so you (or a grader) can understand exactly what each step does.

> **Note:** The current script uses the `j` symbol for the imaginary unit. In MATLAB, both `i` and `j` are standard conventions for $\sqrt{-1}$. Ensure your environment is set up to handle complex numbers correctly.

---

## Files in this assignment

* `PA5.m` — main MATLAB script containing the code for both problems.

---

## Requirements

* **MATLAB R2018a or newer** (recommended for standard linear algebra functions).
* A working MATLAB environment (Desktop or Online).

---

## How to run

1. Open MATLAB.
2. Ensure the directory containing `PA5.m` is on the MATLAB Path or is the current working directory.
3. Type the filename and press Enter in the **Command Window**:

```matlab
PA5

Section: Problem 1 — Matrix A (Real-valued)
Matlab

%Matrix A
A = [2 0 1 8 0 -2; 3 4 7 3 7 6; -6 4 -1 2 5 9]
% Performing the following transpositions on matrix A
transpose(A)
A'
A.'
```
Explanation:
- Defines a real-valued 3 x 6 matrix A.
- The code then calculates the transposition using three different MATLAB notations/functions.

Section: Problem 1 — Matrix B (Complex-valued)
```

%Matrix B
B = [ 3+j.*2 -6-j.*7 1-j; -5+j.*2 3+j 1+j.*7; 4-j.*3 7+j.*8 j.*3]
%Perform the following transpositions on matrix B
transpose(B)
B'
B.'
```

Explanation:
- Defines a complex 3x3 matrix B
- The three transposition operations are calculated, and the output will show the numerical difference between the standard conjugate transpose (B') and the non-conjugate transpose (B.').

Problem 2: Solving Linear SystemsThis section solves the system Xx = Y using two methods.

Section: Inverse Method
```
%Coefficients of the given system of linear equations
X = [3 4 -3 pi 1; 1 -1 5 -4 6; 3 -5^(1/2) -1 7 -9; 7 4 -7 8 2; 9 csc(3) -11 (-6/5) 2]
%Constants of the given system system of linear equations
Y = [1; 12; -7; 2; 0]
%Performing the Inverse method
x_inv = inv(X)*Y
%Displays the solution to the inverse method
disp(x_inv)
```
Explanation:
- Defines the coefficient matrix X (a 5 x 5 matrix, note the use of pi and csc(3)) and the constant vector Y (a 5 x 1 column vector).
- The solution x is found by:
- x = X^-1 Y
- inv(X)*Y computes the solution x_inv.
```

%Performing Cramer's Rule
n = length(Y)
x_cramer = zeros(n,1)
%iterating over each variable through each column of matrix X
for j = 1:n
    Xj = X;            % Copy the original matrix
    Xj(:, j) = Y;      % Replace the j-th column with Y
    x_cramer(j) = det(Xj) / det(X); %Computes the jth vriable using cramer's rule
end
%Displays the solution to the cramer's rule
disp(x_cramer)
```

Explanation:
- Cramer's Rule is implemented. For each variable xj, the j-th column of X is replaced by Y to form Xj.
- The solution is computed as xj = det(Xj) / det(X).
- The loop iterates five times, calculating each element of x_cramer.

















