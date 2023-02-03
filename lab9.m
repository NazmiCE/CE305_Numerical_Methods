clear variables;
format long;

tolerance = 0.0001;
max_iter = 100;
% x^3 + x^2/5 - x - 7 = 0
% Bisection
xl= 0;
xu = 3;
bisection(1) = 0;
iterbisection(1) = 0;
bisectionerror(1) = 10;
for i=1:max_iter
    flower = xl^3 + xl^2/5 - xl - 7;
    xr = (xl + xu)/2;
    fxr = xr^3 + xr^2/5 - xr - 7;
    if flower * fxr < 0
        xu = xr;
    elseif flower * fxr > 0
        xl = xr;
    end
    error = abs((xr - bisection(end))/xr)*100;
    bisectionerror(i+1) = error;
    bisection(end) = xr;
    iterbisection(i + 1) = i;
    if bisectionerror(end) < tolerance
        break
    end
end 

%False Position
xu = 3; % b
xl = 0; % a
false(1) = 0;
iterfalse(1) = 0;
falseerror(1) = 10;
for i=1:max_iter
   fxupper = xu^3 + xu^2/5 - xu - 7;
   fxlower = xl^3 + xl^2/5 - xl - 7;

   xrnew = xu - fxupper*(xu-xl)/(fxupper - fxlower);
   fxr = xrnew^3 + xrnew^2/5 - xrnew - 7;
   
   error = abs((xrnew - false(end))/xrnew)*100;

   falseerror(i+1) = error;
   false(end) = xrnew;
   iterfalse(i + 1) = i;

   if fxr * fxlower < 0
       xu = xrnew;
   else
       xl = xrnew;
       
   end
   if falseerror(end) < tolerance
       break
   end

end


% Newton Raphson Method
newton(1) = 0;
iternewton(1) = 0;
newtonerror(1) = 10;
xold = 1;
for i=1:max_iter
    xnew = xold - (xold^3 + xold^2/5 - xold - 7)/(3*xold^2 +2*xold/5 - 1);
    xold = xnew;
    newton(end) = xrnew;
    iternewton(i + 1) = i;
    error = abs((xrnew - newton(end))/xrnew)*100;
    newtonerror(i+1) = error;
    if newtonerror(end) < tolerance
       break
   end
end

fprintf("Method\t\tIteration Number\t\tLast x value\t\tLast error value\n");
fprintf("--------\t-----------------\t\t------------\t\t-----------------\n");
fprintf("Bisection         %i                    %f              %f \n", iterbisection(end), bisection, bisectionerror(end));
fprintf("False Position    %i                    %f              %f \n", iterfalse(end), false, falseerror(end));
fprintf("Newton Raphson    %i                     %f              %f \n", iternewton(end), newton, newtonerror(end));