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
p <- c('r' = 0.2, 'K' = 1.05, 'theta' = 1.05) ## tomato
p.2 <- c('r' = 0.28, 'K' = 0.75, 'theta' = 1.25) ## grape
p.3 <- c('r' = 0.15, 'K' = 1, 'theta' = 1) ## peaches
y0 <- c('N' = 0.01)
t <- 1:100

## simulations
sim <- ode(y = y0, times = t, func = log.growth, parms = p, method = 'lsoda')
sim <- as.data.frame(sim)

sim.2 <- ode(y = y0, times = t, func = log.growth, parms = p.2, method = 'lsoda')
sim.2 <- as.data.frame(sim.2)

sim.3 <- ode(y = y0, times = t, func = log.growth, parms = p.3, method = 'lsoda')
sim.3 <- as.data.frame(sim.3)

## basic plot
plot(N ~ time, data = sim, type = 'l', lwd = 2, bty = 'l', col = 'blue')
points(N ~ time, data = sim.2, type = 'l', lwd = 2, bty = 'l', lty = 2, col = 'red')
points(N ~ time, data = sim.3, type = 'l', lwd = 2, bty = 'l', lty = 3, col = 'purple')

## --- COMPUTE 'DERIVATIVES'
sim$deriv <- c(diff(sim$N), NA)
sim.2$deriv <- c(diff(sim.2$N), NA)
sim.3$deriv <- c(diff(sim.3$N), NA)

## plot
plot(deriv ~ N, data = sim, type = 'l', lwd = 2, bty = 'l', col = 'blue')
points(deriv ~ N, data = sim.2, type = 'l', lwd = 2, bty = 'l', lty = 2, col = 'red')
points(deriv ~ N, data = sim.3, type = 'l', lwd = 2, bty = 'l', lty = 3, col = 'purple')

max.Ns <- c(sim$N[which.max(sim$deriv)],
  sim.2$N[which.max(sim.2$deriv)],
  sim.3$N[which.max(sim.3$deriv)])

prices <- c(1.3, 2, 1.5)

prods <- max.Ns * prices

which.max(prods)
