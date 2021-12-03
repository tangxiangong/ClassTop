function varargout = poisson(t_len, lambda)
    if nargin == 1
        lambda = 1;
    end
    total_time = 0;
    current_positon = 0;
    n = 1;
    t = zeros;
    x = zeros;
    t(1) = 0;
    x(1) = 0;
    while true
        n = n + 1;
        tau = exprnd(1/lambda);
        if tau + total_time > t_len
            t(n) = t_len;
            x(n) = current_positon;
            break
        else
            total_time = total_time + tau;
            current_position = current_positon + 1;
            t(n+1) = total_time;
            x(n+1) = current_position;
        end
    end
    figure()
    stairs(t, x)
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end