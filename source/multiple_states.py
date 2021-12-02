#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/12/2 11:38
import numpy as np
from numpy import random
import matplotlib.pyplot as plt
from trajectory import Trajectory
from rnd import n_rand, skewed_stable_rnd


class FCP(Trajectory):
    def __init__(self, t_len, v_waiting, transition_matrix, init_state, init_position=0):
        super(Trajectory, self).__init__()
        self._T = t_len
        self._I = np.array(init_state)
        self._M = np.array(transition_matrix)
        self._alpha = np.array(v_waiting)
        self._x0 = init_position
        self._simulate()

    def _simulate(self):
        waiting_time = skewed_stable_rnd
        self._t = np.zeros(1)
        self._x = np.array([self._x0])
        total_time = 0
        n = 1
        init = n_rand(self._I)
        current_state = init
        while True:
            tau = waiting_time(self._alpha[current_state])
            if total_time + tau > self._T:
                self._t = np.append(self._t, self._T)
                self._x = np.append(self._x, self._x[-1])
                self._n = n + 1
                break
            else:
                total_time += tau
                self._t = np.append(self._t, total_time)
                next_state = n_rand(self._M[current_state])
                current_state = next_state
                xi = random.normal()
                self._x = np.append(self._x, self._x[-1] + xi)
                n += 1

    def plot(self):
        plt.figure()
        plt.step(self._t, self._x)
        plt.show()


if __name__ == "__main__":
    a = [1/3, 1/3, 1/3]
    M = [[0.3, 0.5, 0.2],
         [0.5, 0.1, 0.4],
         [0.2, 0.5, 0.3]]
    b = [0.5, 0.43, 0.6]
    model = FCP(100, b, M, a)
    model.plot()

