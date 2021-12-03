#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# @Time : 2021/12/4 06:11
from setuptools import setup
from setuptools import find_packages


VERSION = '0.1.0'

setup(
    name='anomalous',  # package name
    version=VERSION,  # package version
    description='Anomalous diffusion',  # package description
    packages=find_packages(),
    zip_safe=False,
)