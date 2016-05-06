# A Homework 5 Companion

```r
library(deSolve)

## write a function for competition
comp <- function(t, y, p) {
  H <- y[1]
  P <- y[2]
  with(as.list(p), {
    dH.dt <- r * H - b * H * P
    dP.dt <- c * H * P - k * P
    return(list(c(dH.dt, dP.dt)))
  })
}

## specify parameter values and initial conditions
p <- c('r' = 1,
       'b' = 1,
       'c' = 1,
       'k' = 1)
y0 <- c('H' = .4, 'P' = .4)
t <- 1:1000

## simulations
sim <- ode(y = y0, times = t, func = comp, parms = p, method = 'lsoda')
sim <- as.data.frame(sim)

## plot time series
plot(H ~ time, data = sim, type = 'l', col = 'darkgreen', bty = 'l', lwd = 2)
points(P ~ time, data = sim, type = 'l', col = 'purple', lty = 2, lwd = 2)

## plot phase space and attractor
plot(P ~ H, data = sim, type = 'p', bty = 'l', pch = 20)
```