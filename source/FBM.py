#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/12/2 15:49
import matplotlib.pyplot as plt
from stochastic.processes.continuous import FractionalBrownianMotion


def fbm(t_len, hurst):
    f = FractionalBrownianMotion(hurst=hurst, t=t_len)
    n = int(t_len) * 100
    t = f.times(n)
    x = f.sample(n)
    return t, x


if __name__ == "__main__":
    t, x = fbm(100, 0.75)
    fig = plt.figure()
    plt.plot(t, x)
    plt.xlabel("t")
    plt.ylabel("x")
    fig.savefig("fbm2.eps")