function varargout = poisson(t_len, lambda)
    if nargin == 1
        lambda = 1;
    end
    total_time = 0;
    n = 1;
    t = zeros;
    x = zeros;
    t(1) = 0;
    x(1) = 0;
    while true
        tau = exprnd(1/lambda);
        if tau + total_time > t_len
            t(n+1) = t_len;
            x(n+1) = x(n);
            break
        else
            total_time = total_time + tau;
            t(n+1) = total_time;
            x(n+1) = x(n) + 1;
            n = n + 1;
        end
    end
    figure()
    stairs(t, x)
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end