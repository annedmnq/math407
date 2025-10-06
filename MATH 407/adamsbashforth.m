function [t,w] = adamsbashforth(f,interval,y0,h, y_exact)
a = interval(1);
b = interval(2);
n = (b-a)/h;
t = a:h:b;
w = zeros(length(y0),n+1);
w(:,1) = y0;
w(:,2) = w(:,1) + h*f(t(1),w(:,1));
err = zeros(length(y0), n+1);
err(:, 1) = 0;

disp('Step | t       | Approximation w | Global Truncation Error');
disp('------------------------------------------------------------');

for j=2:n
    w(:,j+1) = w(:,j) + h*(3/2*f(t(j),w(:,j)) - 1/2*f(t(j-1),w(j-1)));

    err(:, j+1) = abs(y_exact(t(j+1)) - w(:, j+1));
    
    fprintf('%4d  | %.6f | %.6f | %.6f\n', j-1, t(j), w(:, j), err(:, j));
end

fprintf('%4d  | %.6f | %.6f | %.6f\n', n, t(n+1), w(1, n+1), err(1, n+1));