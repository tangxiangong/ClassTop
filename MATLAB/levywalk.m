function varargout = levywalk(t_len, alpha, v, x0)
    if nargin == 3
        x0 = 0;
    end
    t = zeros;
    x = zeros;
    n = 1;
    t(1) = 0;
    x(1) = x0;
    total_time = 0;
    current_position = x0;
    while true
       n = n + 1;
       tau = randw(alpha);
       if rand() < 0.5
           d = -1;
       else
           d = 1;
       end
       if total_time + tau >= t_len
           temp_t = t_len - total_time;
           current_position = current_position + d*v*temp_t;
           t(n) = t_len;
           x(n) = current_position;
           break
       else
           total_time = total_time + tau;
           current_position = current_position + d*v*tau;
           t(n) = total_time;
           x(n) = current_position;
       end
    end
    
    figure()
    plot(t, x)
    
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end