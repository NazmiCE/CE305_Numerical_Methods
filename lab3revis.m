clc
clear variables 
format long
A = [-5, 2 -5; 2, -2, -1; 2, 0, 5];
[m,n] = size(A);
b = [-9, -10, 9];
X = zeros(101, m+1);

for k = 1:100
    X(k+1, 1) = (b(1) - A(1,2) * 0 - A(1,3)*0)/A(1,1);
    X(k+1, 2) = (b(2) - A(2,1) * X(k+1,1) - A(2,3) * 0)/A(2,2);
    X(k+1, 3) = (b(3) - A(3,1) * X(k+1,1) - A(3,2) * X(k+1,1))/A(3,3);
    X(k, n + 1) = max(abs(X(k)));
end
X;