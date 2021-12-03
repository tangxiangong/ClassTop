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
    
    t = zeros;
    x = zeros;
    t(1) = 0;
    x(1) = x0;
    
    while true
        tau = rand_wait(alpha);
        if total_time + tau > t_len
            t(n+1) = t_len;
            x(n+1) = current_position;
            break
        else
            total_time = total_time + tau;
            current_position = current_position + rand_jump(beta);
            t(n+1) = total_time;
            x(n+1) = current_position;
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