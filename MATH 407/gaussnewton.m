function c = gaussnewton(c0)
c_prev = c0;
c = [0; 0];
tol = 10^-10;

max_iter = 1000;
count = 0;

while count < max_iter

    D = [1, 0;
        exp(c_prev(2)), c_prev(1)*exp(c_prev(2));
        exp(2*c_prev(2)), 2*c_prev(1)*exp(2*c_prev(2))];

    r = -1*[c_prev(1)-1;
         c_prev(1)*exp(c_prev(2))-2;
         c_prev(1)*exp(2*c_prev(2))-6];

    s = (D'*D)\(D'*r);

    c = c_prev + s;

    n = norm(D'*r);

    if(n <= tol)
        count = 1000;
    end

    count = count + 1;
end