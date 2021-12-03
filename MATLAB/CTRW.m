function varargout = CTRW(t_len, alpha, beta, x0)
    if nargin == 3
        x0 = 0;
    end
    
    if alpha == 1
        rand_wait = @(x) exprnd(x); 
    else
        rand_wait = @(x) rand1stable(x);
    end
    
    rand_jump = @(x) rand2stable(x);
        
    total_time = 0;
    current_position = x0;
    n = 1;
    t = zeros;
    x = zeros;
    t(1) = 0;
    x(1) = x0;
    
    while true
        n = n + 1;
        tau = rand_wait(alpha);
        if total_time + tau > t_len
            t(n) = t_len;
            x(n) = current_position;
            break
        else
            total_time = total_time + tau;
            current_position = current_position + rand_jump(beta);
            t(n) = total_time;
            x(n) = current_position;
        end
    end
    
    if nargout == 0
        figure()
        stairs(t, x)
    end
    
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end