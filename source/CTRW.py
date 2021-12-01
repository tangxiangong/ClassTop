#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/12/1 13:27
import numpy as np
from numpy import random
from rnd import stable_rnd, skewed_stable_rnd
import matplotlib.pyplot as plt


class CTRW(object):
    def __init__(self, t_len, ind_waiting, ind_jump, init_position=0):
        self._T = t_len
        self._alpha = ind_jump
        self._beta = ind_waiting
        self._x0 = init_position
        self._t = None
        self._x = None
        self._n = 0
        self._simulate()

    def _simulate(self):
        if self._beta == 1:
            waiting_time = random.exponential
        else:
            waiting_time = skewed_stable_rnd
        self._t = np.zeros(1)
        self._x = np.array([self._x0])
        total_time = 0
        n = 1
        while True:
            tau = waiting_time(self._beta)
            if total_time + tau > self._T:
                self._t = np.append(self._t, self._T)
                self._x = np.append(self._x, self._x[-1])
                self._n = n + 1
                break
            else:
                total_time += tau
                self._t = np.append(self._t, total_time)
                xi = stable_rnd(self._alpha)
                self._x = np.append(self._x, self._x[-1] + xi)
                n += 1

    def plot(self):
        plt.figure()
        plt.step(self._t, self._x)
        plt.show()

    def __getitem__(self, item):
        return self._t[item], self._x[item]

    def __len__(self):
        return self._n

    def get(self):
        return self._t, self._x


if __name__ == "__main__":
    m = CTRW(100, 1, 2)
    print(len(m))
    t, x = m.get()
    print(len(x))
    print(len(t))
    m.plot()