library(deSolve)

## write a function for logistic population growth in continuous time
mod.1 <- function(t, y, p) {
  H <- y[1]
  Z <- y[2]
  with(as.list(p), {
    dH.dt <- r * H * (1 - (H / K)) - b*H*Z
    dZ.dt <- c*H*Z - m*Z
    return(list(c(dH.dt, dZ.dt)))
  })
}

p <- c('r' = 1, 'K' = 1, 'b' = 1, 'c' = 1, 'm' = 0.1)
y0 <- c('H' = 1, 'Z' = 0.1)
t <- 1:100

sim <- ode(y = y0, times = t, func = mod.1, parms = p, method = 'lsoda')
sim <- as.data.frame(sim)

plot(H ~ time, data = sim, type = 'l', lwd = 2, bty = 'l', col = 'blue', ylim = c(0, 2))
points(Z ~ time, data = sim, type = 'l', lwd = 2, bty = 'l', col = 'red')

## human / zombie ratio
sim$H[nrow(sim)] / sim$Z[nrow(sim)]

##-------------------
## write a function for logistic population growth in continuous time
mod.2 <- function(t, y, p) {
  H <- y[1]
  Z <- y[2]
  P <- y[3]
  with(as.list(p), {
    dH.dt <- r * H * (1 - (H / K)) - b*H*Z
    dZ.dt <- c*H*Z - m*Z - d*P*Z
    dP.dt <- e*P*Z - n*P
    return(list(c(dH.dt, dZ.dt, dP.dt)))
  })
}

p.2 <- c('r' = 1, 'K' = 1, 'b' = 1, 'c' = 1, 'm' = 0.1,
         'd' = 1, 'e' = 1, 'n' = 0.1)
y0.2 <- c('H' = 1, 'Z' = 0.1, 'P' = 0.1)
t <- 1:100

sim.2 <- ode(y = y0.2, times = t, func = mod.2, parms = p.2, method = 'lsoda')
sim.2 <- as.data.frame(sim.2)

plot(H ~ time, data = sim.2, type = 'l', lwd = 2, bty = 'l', col = 'blue', ylim = c(0, 2))
points(Z ~ time, data = sim.2, type = 'l', lwd = 2, bty = 'l', col = 'red')
points(P ~ time, data = sim.2, type = 'l', lwd = 2, bty = 'l', col = 'green')

## human / zombie ratio
sim.2$H[nrow(sim.2)] / sim.2$Z[nrow(sim.2)]

