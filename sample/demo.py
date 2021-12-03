#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/11/30 14:29
# import sys
# sys.path.append("..")
import numpy as np
import matplotlib.pyplot as plt

t = np.array([0, 1, 2, 3, 4])
x = np.array([0, 1, 2, 3, 3])
plt.step(t, x, where="post")

plt.show()
