function [t, w] = explicittrap(f, interval, y0, h, y_exact)
a = interval(1);
b = interval(2);
n = (b - a)/h;
t = a:h:b;
w = zeros(length(y0), n+1);
w(:, 1) = y0;
err = zeros(length(y0), n+1);
err(:, 1) = 0;

disp('Step | t       | Approximation w | Global Truncation Error');
disp('------------------------------------------------------------');

for j = 1:n 
    s(:, 1) = f(t(j), w(:, j));
    s(:, 2) = f(t(j)+h, w(:, j)+h*s(:, 1));
    w(:, j+1) = w(:, j)+h*(1/2+s(:, 1)+1/2*s(:, 2));

    err(:, j+1) = abs(y_exact(t(j+1)) - w(:, j+1));

    fprintf('%4d  | %.6f | %.6f | %.6f\n', j, t(j+1), w(:, j+1), err(:, j+1));
end