function varargout = alternating(t_len, lw, bm, v0, x0)
    if nargin == 3
        v0 = 1;
        x0 = 0;
    end
    t = zeros;
    x = zeros;
    t(1) = 0;
    x(1) = x0;
    total_time = 0;
    current_position = x0;
    n = 1;
    while true
       if rand() < 0.5
           d = 1;
       else
           d = -1;
       end
       tau_p = randpower(lw);
       n = n+1;
       if total_time + tau_p >= t_len
           t(n) = t_len;
           temp = t_len - total_time;
           current_position = current_position + d*v0*temp;
           x(n) = current_position;
           break
       else
           total_time = total_time + tau_p;
           current_position = current_position + d*v0*tau_p;
           t(n) = total_time;
           x(n) = current_position;
       end
       tau_m = randpower(bm);
       if total_time + tau_m >= t_len
           temp = t_len - total_time;
           [t_temp, x_temp] = levystable(temp, 2, 0, ...
               current_position, temp*1e-2);
           l = length(t_temp);
           t(n+1:n+l-1) = total_time + t_temp(2:end);
           x(n+1:n+l-1) = x_temp(2:end);
           break
       else
           [t_temp, x_temp] = levystable(tau_m, 2, ...
               current_position, tau_m*1e-2);
           l = length(t_temp);
           t(n+1:n+l-1) = total_time + t_temp(2:end);
           x(n+1:n+l-1) = x_temp(2:end);
           total_time = total_time + tau_m;
           current_position = x(end);
           n = n + l - 1;
       end
    end
    
    if nargout == 0
        figure()
        plot(t, x)
    end
           
    if nargout == 2
       varargout{1} = t;
       varargout{2} = x;
    end
end
