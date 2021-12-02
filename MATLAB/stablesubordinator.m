function varargout = stablesubordinator(t_len, alpha, tau)
    if nargin == 2
        tau = 1e-2;
    end
    t = 0:tau:t_len;
    n = length(t);
    increments = rand1stable(alpha, n-1)';
    x = cumsum([0, increments])*(tau)^(1/alpha);
    figure()
    plot(t,x)
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end