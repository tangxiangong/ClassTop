function varargout = mulfcp(t_len, v_w, tm, init, x0)
    if nargin == 4
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
       tau = rand1stable(v_w(i));
       if total_time + tau > t_len
           t(n+1) = t_len;
           x(n+1) = current_position;
           break
       else
           total_time = total_time + tau;
           current_position = current_position + randn();
           t(n+1) = total_time;
           x(n+1) = current_position;
           next_state = randp(tm(current_state,:));
           current_state = next_state;
           n = n+1;
       end
    end
    figure()
    stairs(t, x)
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end