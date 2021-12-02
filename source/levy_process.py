#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/11/29 21:22
import numpy as np
from numpy import random
from trajectory import Trajectory
import matplotlib.pyplot as plt
from rnd import skewed_stable_rnd
from scipy.stats import levy_stable


class StableProcess(Trajectory):
    def __init__(self, t_len, stable_index,  cls="symmetric", initial_position=0, tau=1e-2):
        super(Trajectory, self).__init__()
        assert cls in ["subordinator", "symmetric"]
        if cls == "symmetric":
            assert 0 < stable_index <= 2, "Argument Error: 0<alpha<=2"
            self._x0 = initial_position
        else:
            assert 0 < stable_index < 1, "Argument Error, 0<alpha<1"
            self._x0 = 0
        self._class = cls
        self._T = t_len
        self._alpha = stable_index
        self._tau = tau
        self._simulate()

    def _simulate(self):
        n = int(self._T / self._tau)
        self._n = n + 1
        self._t = np.linspace(0, self._T, self._n)
        if self._class == "symmetric":
            xi = levy_stable.rvs(self._alpha, 0, size=n)
        else:
            xi = skewed_stable_rnd(self._alpha, size=n)
        xi = np.insert(xi, 0, 0)
        self._x = np.cumsum(xi * self._tau ** (1 / self._alpha))+self._x0


class PoissonProcess(Trajectory):
    def __init__(self, t_len, intensity):
        super(Trajectory, self).__init__()
        self._T = t_len
        self._lambda = intensity
        self._simulate()

    def _simulate(self):
        self._t = np.zeros(1)
        self._x = np.array([0])
        total_time = 0
        n = 1
        while True:
            tau = random.exponential(1/self._lambda)
            if total_time + tau > self._T:
                self._t = np.append(self._t, self._T)
                self._x = np.append(self._x, self._x[-1])
                self._n = n + 1
                break
            else:
                total_time += tau
                self._t = np.append(self._t, total_time)
                self._x = np.append(self._x, self._x[-1] + 1)
                n += 1

    def plot(self):
        plt.figure()
        plt.step(self._t, self._x)
        plt.show()


if __name__ == "__main__":
    # sp = StableProcess(100, 2, "symmetric")
    sp = PoissonProcess(100, 1)
    t, x = sp.get()
    fig = plt.figure()
    plt.step(t, x)
    plt.xlabel("t")
    plt.ylabel("N")
    fig.savefig("poisson.eps")