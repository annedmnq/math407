function [t,w] = euler2(f,interval,y0, y_exact)
a = interval(1);
b = interval(2);
for k = 0:5
    hprime = 0.1*2^-k;
    n = (b - a)/hprime;
    t = a:hprime:b;
    w = zeros(length(y0), n+1);
    w(:, 1) = y0;
    err = zeros(length(y0), n+1);
    err(:, 1) = 0;

    disp('Step | t       | Approximation w | Global Truncation Error');
    disp('------------------------------------------------------------');

    for j=1:n
    
        w(:,j+1) = w(:,j) + hprime*f(t(j),w(:,j));

        err(:, j+1) = abs(y_exact(t(j+1)) - w(:, j+1));
    end
    
    fprintf('%4d  | %.6f | %.6f | %.6f\n', n, t(n+1), w(1, n+1), err(1, n+1));
end