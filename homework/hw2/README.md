#### A Homework 2 Companion

First I'm going to load the `deSolve` library I know I'm going to use later. If you've never installed `deSolve` on the machine you're using, you'll need to do that, first.

```r
install.packages('deSolve')
```

```r
library(deSolve)
```

I'm going to write a function to simulate the theta logistic growth equation.

```r
log.growth <- function(t, y, p) {
  N <- y[1]
  with(as.list(p), {
    dN.dt <- r * N * (1 - (N / K)^theta)
    return(list(dN.dt))
  })
}
```

Then I'm going to simulate the model for the following parameter set...

```r
p <- c('r' = 0.5, 'K' = 20, 'theta' = 1)
y0 <- c('N' = 0.05)
t <- 1:100
```

using...

```r
sim <- ode(y = y0, times = t, func = log.growth, parms = p, method = 'lsoda')

sim <- as.data.frame(sim)
```
and plot it using...

```r
plot(N ~ time, data = sim, type = 'l', lwd = 2, bty = 'l', col = 'blue')
```

Suppose I want to compute the derivatives of dN/dt w.r.t. time, in order to estimate a particular feature of the system ***(cough, cough)***. I can get a very precise estimate using `?diff`. I want to add this new value onto my `sim` data frame in a column called `deriv`.

```r
sim$deriv <- diff(sim$N)
```

But, this bounces back an error. Why? Well, the length of `diff(sim$N)` is one shorter than that of `sim$N`, and so R breaks since you are trying to merge vectors of different lengths. Why might these be different lengths? Think about how many values are required to compute some value describing the `change in something`... Let's deal with this issue by tacking on a dummy placeholder element onto the end of our vector.

```r
sim$deriv <- c(diff(sim$N), NA) 
```

Great! Now what does plotting this vs. population abundance look like?

```r
plot(deriv ~ N, data = sim, type = 'l', col = 'blue', bty = 'l')
```

These derivatives are your instantaneous population growth rates! What if I want to know the population abundance at the maximum value of `deriv`?

```r
max(sim$deriv, na.rm = TRUE)
```

... tells me the maximum value of `deriv` in the `sim` data frame. But I don't want to know this value, I want to know which element in my vector it is.

```r
which(sim$deriv == max(sim$deriv, na.rm = TRUE))
```

This tells you which element in your `deriv` vector in your `sim` data frame is equal to the the biggest value in the `deriv` vector in your `sim` data frame. Try to read this aloud as you read the code.

Now I want the value of `N` in `sim` with the same index as the biggest `deriv` value. I can do this by nesting what we just wrote in brackets, like:

```r
sim$N[which(sim$deriv == max(sim$deriv, na.rm = TRUE))]
```




