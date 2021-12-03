function y = randw(alpha)
    if alpha == 1
        y = exprnd(1);
    else
        y = randpower(alpha);
    end
end