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
`./MATLAB/` MATLAB functions

- `[t, x] = alternating(T, alpha1, alpha2, v0, x0)`

莱维游走和布朗运动的交替过程，先莱维游走（莱维态）后布朗运动（布朗态），在两种态的逗留时间服从幂律分布。`T` 为轨迹长度，`alpha1`和`alpha2`分别为在莱维态和布朗态的逗留时间的幂律指数，`v0`为在莱维态中的速度，`x0`为初始位置。`[t, x]`为模拟出来的时间、位置向量。

- `[t, x] = CTRW(T, alpha, beta, x0)`

连续时间随机游走。等待时间为幂律分布（指数小于1）或者指数分布，跳跃步长为幂律分布或正态分布。`T`为轨迹长度，`alpha`为等待时间的幂律指数，`alpha`=1 代表等待时间为均值为1的指数分布，`beta`为跳跃步长的幂律指数，`beta`=2 时为标准正态分布，`x0`是初始位置。`[t, x]`为模拟出来的时间、位置向量。

- `[t, E]=inverse_subordinator(T, alpha, tau)`

稳定subordinator的逆过程。`T`为轨迹长度，`alpha`为对应的subordinator的稳定指数，`tau`为均匀划分的时间步长。`[t, E]`为模拟出来的时间、因变量的值向量。

- `[t, x] = Langevin(T, f, g, alpha, x0, tau)`

朗之万方程 $$