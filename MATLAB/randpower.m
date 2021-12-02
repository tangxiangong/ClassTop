function y = randpower(alpha, size)
    if nargin == 1
        size = 1;
    end
    u = rand(size, 1);
    y = (1-u).^(-1/alpha)-1;
end