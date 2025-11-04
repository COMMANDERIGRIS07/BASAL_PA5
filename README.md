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

matlab
PA5
Alternatively, open the script in the Editor and click the Run button.The output (matrices, transpositions, and solutions) will be displayed in the Command Window.High-level script flowProblem 1 (Matrix Transpositions):Define a real-valued matrix A.Define a complex-valued matrix B.Compute and display the three types of transpositions for both A and B, followed by an explanation of the method differences.Problem 2 (Linear System Solution):Define the coefficient matrix X and the constant vector Y.Compute and display the solution vector $\mathbf{x}_{\text{inv}}$ using the Inverse Method ($\mathbf{X}^{-1}\mathbf{Y}$).Compute and display the solution vector $\mathbf{x}_{\text{cramer}}$ using Cramer's Rule (ratio of determinants).Script — cell-by-cell explanationI refer to cells based on the logical groupings defined by the code comments (%problem 1, %problem 2, etc.).Section: Problem 1 — Matrix A (Real-valued)Matlab%Matrix A
A = [2 0 1 8 0 -2; 3 4 7 3 7 6; -6 4 -1 2 5 9]
% Performing the following transpositions on matrix A
transpose(A)
A'
A.'
Explanation:Defines a real-valued $3 \times 6$ matrix A.The code then calculates the transposition using three different MATLAB notations/functions.Section: Transposition Method ComparisonThis section explains the output observed in the previous step for both real and complex matrices.Key Differences in MATLAB Transpose Operations:transpose(A) or A.' (Dot Transpose): This performs the non-conjugate transpose. It simply swaps rows and columns ($A_{ij} \rightarrow A'_{ji}$).For a real matrix (like A), this is the only meaningful transpose, and all three operations yield the same result.For a complex matrix (like B), the complex values remain unchanged (e.g., $3+2j$ stays $3+2j$).A' (Apostrophe/Prime): This performs the conjugate transpose (also known as the Hermitian transpose, denoted $\mathbf{A}^H$). It swaps rows/columns AND takes the complex conjugate of every element ($A_{ij} \rightarrow \overline{A'_{ji}}$).For the complex matrix B, this operation will change the sign of the imaginary part of every element compared to B.'.Analogy: Think of the simple transpose (.') as flipping a physical card on a table. Think of the conjugate transpose (') as flipping the card and changing its color from red to blue (or vice-versa, representing conjugation).Section: Problem 1 — Matrix B (Complex-valued)Matlab%Matrix B
B = [ 3+j.*2 -6-j.*7 1-j; -5+j.*2 3+j 1+j.*7; 4-j.*3 7+j.*8 j.*3]
%Perform the following transpositions on matrix B
transpose(B)
B'
B.'
Explanation:Defines a complex-valued $3 \times 3$ matrix B.The three transposition operations are calculated, and the output will show the numerical difference between the standard conjugate transpose (B') and the non-conjugate transpose (B.').Problem 2: Solving Linear SystemsThis section solves the system $\mathbf{X}\mathbf{x} = \mathbf{Y}$ using two methods.Section: Inverse MethodMatlab%Coefficients of the given system of linear equations
X = [3 4 -3 pi 1; 1 -1 5 -4 6; 3 -5^(1/2) -1 7 -9; 7 4 -7 8 2; 9 csc(3) -11 (-6/5) 2]
%Constants of the given system system of linear equations
Y = [1; 12; -7; 2; 0]
%Performing the Inverse method
x_inv = inv(X)*Y
%Displays the solution to the inverse method
disp(x_inv)
Explanation:Defines the coefficient matrix X (a $5 \times 5$ matrix, note the use of $\pi$ and $\csc(3)$) and the constant vector Y (a $5 \times 1$ column vector).The solution $\mathbf{x}$ is found by $\mathbf{x} = \mathbf{X}^{-1}\mathbf{Y}$.inv(X)*Y computes the solution $\mathbf{x}_{\text{inv}}$.Section: Cramer's RuleMatlab%Performing Cramer's Rule
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
Explanation:Cramer's Rule is implemented. For each variable $x_j$, the $j$-th column of $\mathbf{X}$ is replaced by $\mathbf{Y}$ to form $\mathbf{X}_j$.The solution is computed as $x_j = \frac{\det(\mathbf{X}_j)}{\det(\mathbf{X})}$.The loop iterates five times, calculating each element of $\mathbf{x}_{\text{cramer}}$.Suggestions and improvementsEfficiency and Stability: For Problem 2, use the backslash operator (\) for solving the system, as it is generally the preferred method in MATLAB for numerical stability:Matlab% More stable solution method
x_backslash = X\Y;
disp(x_backslash);
Error Check: Add a check to ensure the determinant of $\mathbf{X}$ is non-zero before attempting the Inverse Method or Cramer's Rule:Matlabif abs(det(X)) < eps % Use 'eps' for floating-point comparison
    disp('Matrix X is singular or near-singular. Cannot find a unique solution.');
end
Comparison: Display the difference between the two solutions ($\mathbf{x}_{\text{inv}}$ and $\mathbf{x}_{\text{cramer}}$) to demonstrate they are nearly identical (up to floating-point precision):Matlabsolution_difference = x_inv - x_cramer;
disp('Difference between solutions (Inverse - Cramer):');
disp(solution_difference);
TroubleshootingIncorrect output for complex matrix B: If B' and B.' are the same, check that the j in your matrix definition is correctly recognized as the imaginary unit.Inaccurate Solutions: If $\mathbf{x}_{\text{inv}}$ and $\mathbf{x}_{\text{cramer}}$ are significantly different (more than minor precision errors), double-check the values in the $\mathbf{X}$ and $\mathbf{Y}$ matrices for typos.Matrix Dimensions: Ensure $\mathbf{X}$ is square ($5 \times 5$) and $\mathbf{Y}$ is a column vector ($5 \times 1$).End of README
