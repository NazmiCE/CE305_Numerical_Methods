tolerance = 0.0001;
error = 1;
format long
% Func to find = e^x + x^2 - 4x - 2 = 0
% Func prime = e^x + 2*x - 4
% False Position Method
xu = 2; % b
xl = 1; % a

xold = 10;
result_false = [];
while error >= tolerance
   fxupper = exp(xu) + xu^2 - 4*xu - 2;
   fxlower = exp(xl) + xl^2 - 4*xl - 2;

   xrnew = xu - fxupper*(xu-xl)/(fxupper - fxlower);
   fxr = exp(xrnew) + xrnew^2 - 4*xrnew - 2;
   error = abs(xrnew - xold);
   result_false = [result_false; xrnew error];

   if fxr * fxlower < 0
       xl = xrnew;
   else
       xu = xrnew;
   end
    
   xold = xrnew;

end
result_false;

% Newton Raphson Method
result_newton = [];
error = 1;
xold = 2;
while error > tolerance
    xnew = xold - (exp(xold) + xold^2 - 4*xold - 2)/(exp(xold) + 2*xold - 4);
    error = abs(xnew - xold);
    xold = xnew;
    result_newton = [result_newton; xnew error];
end

result_newton;

