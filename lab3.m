clc
clear all 
format long
A = [-5, 2 -5; 2, -2, -1; 2, 0, 5];
[m,n] = size(A);
b = [-9, -10, 9];
X = zeros(101, m+1);

for k = 1:100
    for i = 1:n
        X(k+1, i) = (b(i) - sum(A(i,1:n).*X(k, 1:n)) + A(i,i)*X(k,i))/A(i,i);
    end
    X(k, n + 1) = max(abs(X(k+1, i:n)));
end
X;