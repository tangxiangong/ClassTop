#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/12/1 13:27
import numpy as np
from numpy import random
import matplotlib.pyplot as plt
from trajectory import Trajectory
from rnd import stable_rnd, skewed_stable_rnd


class CTRW(Trajectory):
    def __init__(self, t_len, ind_waiting, ind_jump, init_position=0):
        super(Trajectory, self).__init__()
        self._T = t_len
        self._alpha = ind_jump
        self._beta = ind_waiting
        self._x0 = init_position
        self._simulate()

    def _simulate(self):
        if self._beta == 1:
            waiting_time = random.exponential
        else:
            waiting_time = skewed_stable_rnd
        self._t = np.zeros(1)
        self._x = np.array([self._x0])
        total_time = 0
        current_position =  self._x0
        n = 1
        while True:
            tau = waiting_time(self._beta)
            if total_time + tau > self._T:
                self._t = np.append(self._t, self._T)
                self._x = np.append(self._x, current_position)
                self._n = n + 1
                break
            else:
                xi = stable_rnd(self._alpha)
                total_time += tau
                current_position += xi
                self._t = np.append(self._t, total_time)
                self._x = np.append(self._x, current_position)
                n += 1

    def plot(self):
        plt.figure()
        plt.step(self._t, self._x)
        plt.show()


if __name__ == "__main__":
    m1 = CTRW(100, 0.7, 1.5)
    t1, x1 = m1.get()
    fig = plt.figure(1)
    plt.step(t1, x1)
    plt.xlabel("t")
    plt.ylabel("x")
    fig.savefig("ctrw4.eps")
