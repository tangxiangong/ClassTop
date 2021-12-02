function y = rand1stable(alpha, size)
    if nargin == 1
        size = 1;
    end
    v = (rand(size, 1)-1/2)*pi;
    w = exprnd(1, size, 1);
    c1 = (cos(pi*alpha/2))^(-1/alpha);
    c2 = pi/2;
    temp1 = sin(alpha*(v+c2));
    temp2 = (cos(v-alpha*(v+c2))./w).^(1/alpha-1);
    temp3 = (cos(v)).^(1/alpha);
    y = c1 .* temp1 .* temp2 ./ temp3;
end