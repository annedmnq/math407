function x = bisection(f,a,b,tol)
if f(a)*f(b) >= 0
    error('Cannot proceed.  f(a) and f(b) must have opposite sign.');
end
while (b-a)/2 > tol
    c = (a+b)/2;
    if f(a)*f(c) < 0
        b=c;
    else
        a=c;
    end
end
x = (a+b)/2;