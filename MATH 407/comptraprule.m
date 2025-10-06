function y = comptraprule(f, m, a, b)

h = (b - a) / m;
sum = 0;
a_prime = a;

while a_prime < b
    sum = sum + h*(0.5*f(a_prime) + 0.5*f(a_prime+h));
    a_prime = a_prime + h;
end

y = sum;
approximation = sum;
exact_value = integral(f, a, b);
error = abs(approximation - exact_value);
disp(['Approximation: ', num2str(approximation), '. Exact Value: ', ...
    num2str(exact_value), '. Error: ', num2str(error), '.']);