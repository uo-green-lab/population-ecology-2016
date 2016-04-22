# Population Ecology
## Spring 2016

> 2)  **(a)** Write a function to simulate continuous time logistic growth in `R`. Using the values `r` = 0.25 and `K` = 100, simulate and plot this model over the time range `t` = 1 to `t` = 100, using `runif()` to randomly draw the initial conditions 0.01 < `N0` < 0.1 from a uniform distribution. Include any code and figures.

> **(b)** Simulate this model two additional times for the same parameter set, but with `K` = 50 and `K` = 25. Plot the population level growth rate (hint: `?diff`) vs. population abundance for all three simulations (on the same plot). Include any code and figures.

This is largely a repeat of the iteration on homework 1. This code snippet will simulate the logistic growth model 

```r
library(deSolve)

## write a function for logistic population growth in continuous time
log.growth <- function(t, y, p) {
  N <- y[1]
  with(as.list(p), {
    dN.dt <- r * N * (1 - (N / K)^theta)
    return(list(dN.dt))
  })
}

## specify parameter values and initial conditions
p <- c('r' = 0.25, 'K' = 20, 'theta' = 1)
y0 <- c('N' = runif(1, min = 0.01, max = 0.1)
t <- 1:100

library(deSolve)
sim <- ode(y = y0, times = t, func = log.growth, parms = p, method = 'lsoda')

## show them that converting to data.frame object makes plotting/manipulation easy-peasy
sim <- as.data.frame(sim)

## basic plot
plot(N ~ time, data = sim, type = 'l', lwd = 2, bty = 'l', col = 'blue', ylim = c(0, 50))

## change K
p.2 <- c('r' = 0.25, 'K' = 50, 'theta' = 1)
sim.2 <- ode(y = y0, times = t, func = log.growth, parms = p.2, method = 'lsoda')
sim.2 <- as.data.frame(sim.2)

points(N ~ time, data = sim.2, type = 'l', lwd = 2, bty = 'l', lty = 2, col = 'red')

p.3 <- c('r' = 0.25, 'K' = 25, 'theta' = 1)
sim.3 <- ode(y = y0, times = t, func = log.growth, parms = p.3, method = 'lsoda')
sim.3 <- as.data.frame(sim.3)

points(N ~ time, data = sim.3, type = 'l', lwd = 2, bty = 'l', lty = 3, col = 'purple')
```

Now, I'll compute my population level growth rate by taking derivatives along the curves I just plotted. `diff` is an easy way to do this in R. Remember, `diff` will spit out a vector of length `x - 1`, if x is the length of the vector I feed it. Trying to merge, plot, etc. vectors of different lengths will break R. We'll get around this issue by just tacking on a dummy `NA` value onto the end.

```r
sim$deriv <- c(diff(sim$N), NA)
plot(deriv ~ N, data = sim, type = 'l', col = 'blue', xlim = c(0, 60), ylim = c(0, 3.5), bty = 'l')

sim.2$deriv <- c(diff(sim.2$N), NA)
points(deriv ~ N, data = sim.2, type = 'l', col = 'red')

sim.3$deriv <- c(diff(sim.3$N), NA)
points(deriv ~ N, data = sim.3, type = 'l', col = 'purple')
```
> **(c)** Find the population abundance that yields the maximum population growth rate for each of the above three simulations. Visualize the effect of `carrying capacity` on `population size at maximum growth rate` by plotting these values against their corresponding `K` parameter. Include any code and figures.

Now I'll plot the peak of each one of those curves against it's corresponding value of K, to complete number 2.

```r
## plot the max growth rate vs. K
max.growths <- c(max(sim$deriv, na.rm = TRUE),
                 max(sim.2$deriv, na.rm = TRUE),
                 max(sim.3$deriv, na.rm = TRUE))

Ks <- c(p['K'], p.2['K'], p.3['K'])

plot(max.growths ~ Ks, pch = 21, bg = 'skyblue', type = 'b', lty = 2, bty = 'l')
```
> 3)   Suppose you manage a [fishery](https://en.wikipedia.org/wiki/Fishery) and are tasked with maximizing the fishery's yield by managing the populations of three fish species that grow according to the theta logistic growth model (see [Hastings Ch. 4](https://github.com/uo-green-lab/population-ecology-2016/blob/master/additional-readings/hasting-ch-4.pdf)). A scientist visited the fishery and determined the `theta` value for each fish:  `0.5 for species A`, `1 for species B` and `1.8 for species C`. Which species will be maintained at the highest population abundance in your fishery? Include any code and figures.
4.	Extra credit.  In class we reviewed logistic population growth, starting with the model dN/dt = rN(1-N/K).  Go through the steps to derive the solution for this model at time t = T, or N(T).

This code snippet will answer the question for you. The answer is `species A`.

```r
## write a function for logistic population growth in continuous time
log.growth.theta <- function(t, y, p) {
  N <- y[1]
  with(as.list(p), {
    dN.dt <- r * N * (1 - (N / K)^theta)
    return(list(dN.dt))
    })
}

## specify parameter values and initial conditions
p <- c('r' = 0.25, 'K' = 2, 'theta' = 0.5)
y0 <- c('N' = 0.05)
t <- 1:100

sim <- ode(y = y0, times = t, func = log.growth.theta, parms = p, method = 'lsoda')

## show them that converting to data.frame object makes plotting/manipulation easy-peasy
sim <- as.data.frame(sim)

## basic plot
plot(N ~ time, data = sim, type = 'l', lwd = 2, bty = 'l', col = 'blue')

## change theta
p.2 <- c('r' = 0.25, 'K' = 2, 'theta' = 1)
sim.2 <- ode(y = y0, times = t, func = log.growth.theta, parms = p.2, method = 'lsoda')
sim.2 <- as.data.frame(sim.2)

points(N ~ time, data = sim.2, type = 'l', lwd = 2, bty = 'l', lty = 2, col = 'red')

p.3 <- c('r' = 0.25, 'K' = 2, 'theta' = 2)
sim.3 <- ode(y = y0, times = t, func = log.growth.theta, parms = p.3, method = 'lsoda')
sim.3 <- as.data.frame(sim.3)

points(N ~ time, data = sim.3, type = 'l', lwd = 2, bty = 'l', lty = 3, col = 'purple')

##----------------------
sim$deriv <- c(diff(sim$N), NA)
plot(deriv ~ N, data = sim, type = 'l', col = 'blue', ylim = c(0, 0.25), bty = 'l')

sim.2$deriv <- c(diff(sim.2$N), NA)
points(deriv ~ N, data = sim.2, type = 'l', col = 'red')

sim.3$deriv <- c(diff(sim.3$N), NA)
points(deriv ~ N, data = sim.3, type = 'l', col = 'purple')

## plot abundance that yields max growth rate vs. theta
max.Ns <- c(sim$N[which(sim$deriv == max(sim$deriv, na.rm = TRUE))],
            sim.2$N[which(sim.2$deriv == max(sim.2$deriv, na.rm = TRUE))],
            sim.3$N[which(sim.3$deriv == max(sim.3$deriv, na.rm = TRUE))])

thetas <- c(p['theta'], p.2['theta'], p.3['theta']

plot(max.Ns ~ thetas, pch = 21, bg = 'skyblue', type = 'b', lty = 2)
```

