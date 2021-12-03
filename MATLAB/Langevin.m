function varargout = Langevin(T, f, g, alpha, x0, tau)
% Langevin equation dX(t)=f(X(t),t)dt+g(X(t),t)dL_{\alpha}(t), t\in (0, T]
% with initial value X(0)=x_0, where L_{\alpha}(t) is a alpha-stable Levy
% process.
% Example:
% >> f = @(x, t) -x;
% >> g = @(x, t) 1;
% >> T = 10;
% >> alpha = 1.5;
% >> Langevin(T, f, g, alpha)

    if nargin == 5
        tau = 1e-2;
    end
    if nargin == 4
        x0 = 0;
        tau = 1e-2;
    end
    t = 0:tau:T;
    N = length(t) - 1;
    x = zeros(1, N+1);
    x(1) = x0;
    alpha_rand = random('Stable', alpha, 0, 1, 0, N, 1);
    
    idx = alpha_rand >= 10;
    for k = 1:N
        x(k+1)=x(k)+f(x(k),t(k))*tau+g(x(k),t(k))*tau^(1/alpha)*alpha_rand(k);
    end
    
    temp = (1:N)';
    jump = temp(idx);
    L = length(jump);
    figure()
    if L == 0
        plot(t, x)
    else
        plot(t(1:jump(1)), x(1:jump(1)), 'b-')
        hold on
        for k=1:L-1
            plot(t(jump(k)+1:jump(k+1)), x(jump(k)+1:jump(k+1)), 'b-');
            hold on
        end
        plot(t(jump(end)+1:end), x(jump(end)+1:end), 'b-')
    end
%     hold on
%     for k=1:L
%         plot(t(jump(k)), x(jump(k)), 'r.')
%         hold on
%     end
    
    xlabel('t')
    ylabel('x')
    str = "Langevin equation dX(t)=f(X(t),t)dt+g(X(t),t)dL_{\alpha}(t)"+ ...
          ", \alpha="+num2str(alpha);
    title(str)
    
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end