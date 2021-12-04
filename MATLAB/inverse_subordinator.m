function varargout = inverse_subordinator(T, alpha, tau)
    if nargin==2
        tau=1e-2;
    end
    t = (0:tau:T)';
    N = length(t)-1;
    E = zeros(N+1,1);
    n = 1;
    while true
        [tt, S] = stablesubordinator(n*T, alpha,tau/5);
        if S(end) > T
            break
        end
        n = 2*n;
    end
    for k=2:N+1
        temp = tt(S>=t(k));
        E(k) = temp(1);
    end
    if nargout == 0
        figure()
        plot(t, E)
    end
    if nargout == 2
        varargout{1} = t;
        varargout{2} = E;
    end
end