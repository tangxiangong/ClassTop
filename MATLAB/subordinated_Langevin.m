function varargout = subordinated_Langevin(T, x0, alpha, beta,f, g, tau)
    if nargin==5
        tau = 1e-2;
    end
    [t, E] = inverse_subordinator(alpha, T, tau);
    N = length(t);
    x = zeros(N, 1);
    x(1) = x0;
    stable_rand = rand2stable(beta, N-1);
    for k=2:N
        delta_t = E(k)-E(k-1);
        x(k) = x(k-1) + f(x(k-1), E(k-1)) * delta_t + ...
            g(x(k-1), E(k-1))*(delta_t)^(1/2)*stable_rand(k-1);
    end
    if nargout==0
        figure()
        plot(t, x)
    end
    if nargout==2
        varargout{1} = t;
        varargout{2} = x;
    end
end