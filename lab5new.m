clear all
x = [0, 2, 4, 6, 8, 10, 12];
y = [4, 5, 7, 11, 17, 24, 33];

sumx_4 = 0;
sumx_2 = 0;
sum_ = 0;
sumy_1 = 0;
sum_yu = 0;
sum_y = 0;
for i= 1:length(x)
    sumx_2 = sumx_2 + x(i)^2;
    sum_ = sum_+1;
    sumx_4 = sumx_4 + x(i)^4;
    sumy_1 = sumy_1 + y(i);
    sum_yu = sum_yu + (x(i)^2 * y(i));
    sum_y = sum_y + y(i);

end
J = [sumx_2 sum_; sumx_4 sumx_2];
K = [sum_y; sum_yu];
c = inv(J)*K;
fprintf('a = %.5f, and b = %.5f\n', c(1), c(2))


