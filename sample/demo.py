#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/11/30 14:29
# import sys
# sys.path.append("..")
from source.CTRW import CTRW
from source.trajectory import Trajectory
import matplotlib.pyplot as plt

model = CTRW(100, 0.8, 1.5)
t, x = model.get()
fig = plt.figure()
plt.step(t, x)
fig.savefig("../figure/ctrw.eps")
