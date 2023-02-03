clear variables
x(1) = 2; y(1) = 1; z(1) = 2;
for k = 1:100
    F(1) = x(k)^2 * y(k) + x(k)^(0.5) * y(k)^2 - z(k);
    F(2) = exp(x(k)) - z(k)^2 - sin(y(k));
    F(3) = x(k) * y(k) * z(k) - x(k) - y(k) - z(k); 
    J(1,1:3) = [2*x(k)*y(k) + x(k)^(-0.5) * y(k)^2 / 2, x(k)^2 + 2*x(k)^(0.5)*y(k), -z(k)];  % derivative of F1 wrt variables at k
    J(2,1:3) = [exp(x(k)), -cos(y(k)), -2*z(k)];  %  derivative of F2 wrt variables at k
    J(3,1:3) = [y(k) * z(k) - 1, x(k) * z(k) - 1, x(k) * y(k) - 1];  % derivative of F3 wrt variables at k
    X=[x(k);y(k);z(k)]; 
    Xnew = X - inv(J) * F';
    x(k+1)=Xnew(1); 
    y(k+1)=Xnew(2); 
    z(k+1)=Xnew(3);
    e(k+1) = max(abs(Xnew - X));
    if e(k+1)<1e-4; break; end
end

[x' y' z' e']