# A Homework 4 Companion

Load libraries and write my competition function.

```r
library(deSolve)

## write a function for competition
comp <- function(t, y, p) {
  N1 <- y[1]
  N2 <- y[2]
  with(as.list(p), {
    dN1.dt <- (r1 * N1 / K1) * (1 - N1 - a12 * N2)
    dN2.dt <- (r2 * N2 / K2) * (1 - N2 - a21 * N1)
    return(list(c(dN1.dt, dN2.dt)))
  })
}
```

Define my parameter set.

```r
## specify parameter values and initial conditions
p <- c('r1' = 0.1, 'K1' = 1.05, 'r2' = 0.1, 'K2' = 0.8,
       'a12' = 0.5,
       'a21' = 0.2,
       'H' = 0.5)
y0 <- c('N1' = 0.3, 'N2' = 0.1)
t <- 1:100
```

Simulate and plot the results.

```r
## simulations
sim <- ode(y = y0, times = t, func = comp, parms = p, method = 'lsoda')
sim <- as.data.frame(sim)

## plot time series
plot(N1 ~ time, data = sim, type = 'l', col = 'darkgreen', ylim = c(0, 1.1), bty = 'l')
points(N2 ~ time, data = sim, type = 'l', col = 'purple', lty = 2)

## plot phase space and attractor
plot(N1 ~ N2, data = sim, type = 'l', ylim = c(0, 1.1), bty = 'l')
points(sim$N1[nrow(sim)] ~ sim$N2[nrow(sim)], pch = 21, bg = 'red', cex = 2.5)
```