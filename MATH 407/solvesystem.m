function x = solvesystem(a, b)
n = length(b);
x = zeros(n, 1);
x(1, 1) = b(1, 1) / a(1, 1);
for i = 2:n
    for j = 1:i-1
        x(i, 1) = x(i, 1) + (a(i, j) * x(j, 1));
    end
    x(i, 1) = b(i, 1) - x(i, 1);
    x(i, 1) = x(i, 1) / a(i, i);
end