function x = gaussseidel(n, K)
x = zeros(n, 1);

for k = 1:K
    for i = 1:n
        if i==1
            x(1, 1) = (2 + x(2, 1))/3;
        elseif i==n
            x(n, 1) = (2 + x(n-1, 1))/3;
        else
            x(i, 1) = (1 + x(i-1, 1) + x(i+1, 1))/3;
        end
    end
end

exact_sol = ones(n, 1);
difference = x - exact_sol;
magnitude = norm(difference);

disp(['The magnitude when K = ', num2str(K), ' is: ' , num2str(magnitude)]);