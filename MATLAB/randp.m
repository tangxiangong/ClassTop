function y = randp(p)
    n = length(p);
    index = 1:n;
    q = cumsum(p);
    u = rand();
    temp = index(q>=u);
    y = temp(1);
end