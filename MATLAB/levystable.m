function varargout = levystable(t_len, alpha, x0, tau)
    if nargin == 2
        tau = 1e-2;
        x0 = 0;
    end
    
    t = 0:tau:t_len;
    n = length(t);
    jump = rand2stable(alpha, n-1)';
    x = x0 + cumsum([0, jump])*(tau)^(1/alpha);
    
    if nargout == 0
        figure()
        plot(t, x);
    end
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end