clear variables

x = [0, 2, 4, 6, 8, 10, 12];
y = [4, 5, 7, 11, 17, 24, 33];
scatter(x,y);
u = x.^2;
answer = spline(x, y, [1, 3, 6, 9, 10, 11]);


J = [sum(u) length(x); sum(u.^2) sum(u)];
K = [sum(y); sum(y.*u)];
c = inv(J)*K;

fprintf('a = %.5f, and b = %.5f\n', c(1), c(2))


