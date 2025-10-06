function x = newton(f,fprime,x0,tol,maxiter)
x = x0;
n = 0;
while abs(f(x)/fprime(x)) > tol
    n = n+1;
    if n > maxiter
        error('Did not converge.');
    end
    x = x - f(x)/fprime(x);
end