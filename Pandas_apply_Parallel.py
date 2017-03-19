#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar 18 22:25:45 2017

@author: zhenshan
"""

from joblib import Parallel, delayed
import multiprocessing as mp
from functools import partial

funcPartial = partial(func, args_ = args)
# By column
partResult = Parallel(n_jobs=mp.cpu_count())(delayed(funcPartial)(col) for colName, col in df.iteritems())
dfParalled = pd.concat(partResult, axis = 0)
# By row
partResult = Parallel(n_jobs=mp.cpu_count())(delayed(funcPartial)(col) for rowName, row in df.iterrows())
dfParalled = pd.concat(partResult, axis = 0)

def func(args_):