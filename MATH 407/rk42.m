function [t,w] = rk42(f,interval,y0, y_exact)
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
        s(:,1) = f(t(j),w(:,j));
        s(:,2) = f(t(j)+hprime/2, w(:,j)+hprime/2*s(:,1));
        s(:,3) = f(t(j)+hprime/2, w(:,j)+hprime/2*s(:,2));
        s(:,4) = f(t(j)+hprime, w(:,j)+hprime*s(:,3));
        w(:,j+1) = w(:,j) + hprime*(1/6*s(:,1) + 1/3*s(:,2) + 1/3*s(:,3) + 1/6*s(:,4));
    
        err(:, j+1) = abs(y_exact(t(j+1)) - w(:, j+1));
    end

     fprintf('%4d  | %.6f | %.6f | %.6f\n', n, t(n+1), w(1, n+1), err(1, n+1));
end
