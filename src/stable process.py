#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/11/29 21:22
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import levy_stable


class StableProcess(object):
    def __init__(self, t_len, stable_index, tau=1e-2):
        assert 0 < stable_index <= 2, "Argument Error: 0<alpha<=2"
        self._T = t_len
        self._alpha = stable_index
        self._tau = tau
        self._t = None
        self._x = None
        self._n = 0
        self.simulate()

    def simulate(self):
        n = int(self._T / self._tau)
        self._n = n + 1
        self._t = np.linspace(0, self._T, self._n)
        xi = levy_stable.rvs(self._alpha, 0, size=n)
        xi = np.insert(xi, 0, 0)
        self._x = np.cumsum(xi * self._tau ** (1 / self._alpha))

    def plot(self):
        plt.figure()
        plt.plot(self._t, self._x)
        plt.show()

    def __getitem__(self, item):
        return self._t[item], self._x[item]

    def __len__(self):
        return self._n

    def get(self):
        return self._t, self._x


if __name__ == "__main__":
    alpha = 1.5
    sp = StableProcess(10, alpha)
