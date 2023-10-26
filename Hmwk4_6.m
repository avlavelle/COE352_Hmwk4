endpoints = [1, 2];
maxit = 100;
tol = 1e-10;
[iterations, root] = bisection(tol, maxit, endpoints, @f)


function y = f(x)
    y = x^2-3;
end

function [it, root] = bisection(tol, maxit, endpoints, func)
    a = endpoints(1,1);
    b = endpoints(1,2);
    
    if func(a) * func(b) >= 0
        error('Bracketing region is invalid, and no root exists.');
    end

    for count = 1:maxit
        c = (a + b) / 2;

        if func(c) == 0
            root = c;
            it = count;
            return;
        end

        if (func(c)<0) && (func(a)<0)
            a = c;
        else
            b = c;
        end

        ea = abs(b - a);
        er = ea / (abs(c) + tol);

        if ea <= tol || er <= tol
            root = c;
            it = count;
            return;
        end
    end
end

