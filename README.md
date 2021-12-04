# Stochastic Process Simulation
## Random generator 
- symmetric stable distribution
- totally skewed stable distribution
- power-law distribution
- discrete finite probability distribution

## Levy process
- stable Levy process
- subordinator
- Poisson process
## Continuous-time random walk(CTRW)
- finite and diverging characteristic waiting time
- finite and diverging jump length variance 
## Alternating process
- two-states process with Levy walk and Brownian motion
## Fractional Brownian motion

## Multiple internal states process
- fractional compound Poisson process
- Levy walk

## Description of Classes and Functions (Chinese)
### `./MATLAB/` MATLAB 函数

- `[t, x] = alternating(T, alpha1, alpha2, v0, x0)`

莱维游走和布朗运动的交替过程，先莱维游走（莱维态）后布朗运动（布朗态），在两种态的逗留时间服从幂律分布

`T` 为轨迹长度，`alpha1`和`alpha2`分别为在莱维态和布朗态的逗留时间的幂律指数，`v0`为在莱维态中的速度，`x0`为初始位置。`[t, x]`为模拟出来的时间、位置向量。

- `[t, x] = CTRW(T, alpha, beta, x0)`

连续时间随机游走模型

等待时间为幂律分布（指数小于1）或者指数分布，跳跃步长为幂律分布或正态分布。`T`为轨迹长度，`alpha`为等待时间的幂律指数，`alpha`=1 代表等待时间为均值为1的指数分布，`beta`为跳跃步长的幂律指数，`beta`=2 时为标准正态分布，`x0`是初始位置。`[t, x]`为模拟出来的时间、位置向量。

- `[t, E]=inverse_subordinator(T, alpha, tau)`

稳定subordinator的逆过程

`T`为轨迹长度，`alpha`为对应的subordinator的稳定指数，`tau`为均匀划分的时间步长。`[t, E]`为模拟出来的时间、因变量的值向量。

- `[t, x] = Langevin(T, f, g, alpha, x0, tau)`

朗之万方程
![1](http://latex.codecogs.com/svg.latex?\mathrm{d}X_t=f(X_t,t)\mathrm{d}t+g(X_t,t)\mathrm{d}L_{\alpha}(t)), 其中 ![1](http://latex.codecogs.com/svg.latex?L_{\alpha}(t)) 为 ![1](http://latex.codecogs.com/svg.latex?\alpha) 稳定的莱维过程

`T`为轨迹长度，`f`和`g`分别为外力项和乘性噪声项，`x0`为初始值，`alpha`为莱维过程的稳定指数。`[t, x]`为模拟出来的时间、位置向量。

- `[t, x] = levystable(T, alpha, x0, tau)`

稳定莱维过程

`T`为轨迹长度，`alpha`为莱维过程的稳定指数，`x0`为初始值。`[t, x]`为模拟出来的时间、位置向量。

- `[t, x] = levywalk(T, alpha, v, x0)`

莱维游走模型，等待时间为幂律分布（指数小于2不等于1）或者指数分布

`T`为轨迹长度，`alpha`为等待时间的幂律指数，`alpha`=1 代表等待时间为均值为1的指数分布，`v`为速度，`x0`是初始位置。`[t, x]`为模拟出来的时间、位置向量。

- `[t, x] = mulfcp(T, alpha, m, init, x0)`

多内部状态的分数复合柏松过程

`T` 为轨迹长度，`alpha`为各个状态下逗留时间的幂律指数组成的指数向量，`m`为状态转移矩阵，`init`为初始状态分布，`x0`为初始位置。`[t, x]`为模拟出的时间、位置向量。

- `[t, x] = mullw(t_len, alpha, v, m, init, x0)`

多内部状态的莱维游走

`T` 为轨迹长度，`alpha`为各个状态下逗留时间的幂律指数组成的指数向量，`v`是各个状态下的速度组成的速度向量，`m`为状态转移矩阵，`init`为初始状态分布，`x0`为初始位置。`[t, x]`为模拟出的时间、位置向量。

- `[t, x] = poisson(T, lambda)`

泊松过程

`T` 为轨迹长度，`lambda`为泊松过程的参数。`[t, x]`为模拟出的时间、位置向量。

- `rand1stable(alpha, N)`

生成`N`个单边无偏移的`alpha`稳定分布的随机数

- `rand2stable(alpha, N)`

生成`N`个双边对称的`alpha`稳定分布的随机数

- `randp(alpha)`

有限离散的概率分布`p`，随机数返回值（下标）所对应的值。

- `randpower(alpha, N)`

生成`N`个`alpha`幂律分布的随机数，其概率密度函数为
![1](http://latex.codecogs.com/svg.latex?f(x)=\alpha(t+1)^{-\alpha})


### `./source/` Python 类和函数

- `alternating_process.py`

`AlternatingProcess`类，莱维游走和布朗运动的交替过程

- `CTRW.py`

`CTRW`类，连续时间随机游走模型

- `FBM.py`

`fbm(T, H)`函数，模拟长度为`T`的Hurst指数为`H`的分数布朗运动




