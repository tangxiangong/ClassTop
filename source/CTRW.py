#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/12/1 13:27
import numpy as np
from numpy import random
from rnd import stable_rnd, skewed_stable_rnd
import matplotlib.pyplot as plt


class CTRW(object):
    def __init__(self, t_len, ):