% Target f(x) = x + 4sinx

i = 1;
h = 0.5;
range_vector = 0:h:2*pi;

if range_vector(end) ~= 2*pi
    range_vector(end + 1) = 2*pi;
end

summation = 0;
summation = summation + range_vector(1) + 4 * sin(range_vector(1)); % first
summation = summation + range_vector(end - 1) + 4 * sin(range_vector(end - 1)); % fourth
even_numbers = range_vector(2:2:end -1);
second_term = 4 * sum(even_numbers + 4.*sin(even_numbers));
odd_numbers = range_vector(3:2:end-1);
third_term = 2 * sum(odd_numbers + 4.*sin(odd_numbers));
summation = summation + second_term + third_term;
I = h/3*summation;
%I = I + (range_vector(end) - range_vector(end - 1))*(range_vector(end - 1) + 4 * sin(range_vector(end - 1)) + range_vector(end) + 4 * sin(range_vector(end)))/2;
I = I + (range_vector(end) - range_vector(end - 1)) * (range_vector(end) + 4 * sin(range_vector(end)) - range_vector(end -1) - 4 * sin(range_vector(end - 1)))/2