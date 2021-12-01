#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/11/30 14:29
import sys
sys.path.append("..")


def f(x, y):
    return x+y

g = lambda x: f(x, 3)

print(g(2))

