function varargout = levystable(t_len, alpha, plt, x0, tau)
    if nargin == 2
        plt = 1;
        tau = 1e-2;
        x0 = 0;
    end
    
    t = 0:tau:t_len;
    n = length(t);
    jump = rand2stable(alpha, n-1)';
    x = x0 + cumsum([0, jump])*(tau)^(1/alpha);
    if plt == 1
        figure()
        plot(t, x);
    end
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end