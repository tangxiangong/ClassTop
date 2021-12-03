function varargout = mullw(t_len, w, v, m, init, x0)
    if nargin == 5
        x0 = 0;
    end
    t = zeros;
    x = zeros;
    t(1) = 0;
    x(1) = x0;
    total_time = 0;
    current_position = x0;
    n = 1;
    i = randp(init);
    current_state = i;
    while true
       tau = rnd(w(current_state));
       v0 = v(current_state);
       if rand() < 0.5
           d = -1;
       else
           d = 1;
       end
       if total_time + tau >= t_len
           temp = t_len - total_time;
           current_position = current_position + d*v0*temp;
           t(n+1) = t_len;
           x(n+1) = current_position;
           break
       else
           total_time = total_time + tau;
           current_position = current_position + d*v0*tau;
           t(n+1) = total_time;
           x(n+1) = current_position;
           n = n + 1;
           next_state = randp(m(current_state, :));
           current_state = next_state;
       end
    end
    
    figure()
    plot(t,x)
    
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end

function y = rnd(alpha)
    if alpha == 1
        y = exprnd(1);
    else
        y = randpower(alpha);
    end
end