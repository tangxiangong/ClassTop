function y = rand2stable(alpha, size)
    if nargin == 1
        size = 1;
    end
    v = (rand(size, 1)-1/2)*pi;
    w = exprnd(1, size, 1);
    temp1 = sin(alpha*v);
    temp2 = (cos(v-alpha*v)./w).^(1/alpha-1);
    temp3 = (cos(v)).^(1/alpha);
    y = temp1 .* temp2 ./ temp3;
end