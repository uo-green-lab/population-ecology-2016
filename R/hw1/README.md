# Population Ecology
## Spring 2016

> 6)   For five consecutive days, you measure the size of a growing population of nematodes as 100, 158, 315, 398, and 794 individuals.  Plot the logarithm (base e) of population size vs.  time to estimate *r*. Show and annotate your code; embed your figure. Hint: `?lm` might be helpful.

First I'll make two vectors. One called `time` containing values for days 1 through 5, and another called `N` containing my population abundances.

```r
time <- c(1:5)
N <- c(100, 158, 315, 398, 794)
```

Now I'll plot log base *e* N vs. time. `plot` has the general syntax `plot(y ~ x)`.

```r
plot(log(N) ~ time, type = 'b', pch = 21, bg = 'blue', bty = 'l')
```
Here, the arguments are my `y variable ~ x variable`, `type = 'b'` sets the type to *"both"* data points and lines connecting them, `pch = 21` sets the point shape to shape #21, which is a round black circle filled with color, `bg = 'blue'` makes that background color blue and `bty = 'l'` makes the border *"L"* shaped.

Now to estimate *r*, all I need to do is estimate the slope of this relationship. I can do that using:

```r
lm(log(N) ~ time)$coefficients
```

`lm` fits a linear model to data in the form `y ~ x`, and the `$coefficients` pulls out the coefficients from the fitted model, i.e., the intercept and the slope. You should see a `time` effect, which is your slope of ~0.51. This is your *r* value.

> 7)   Simulate a population growing exponentially in continuous time for 100 time steps; *r* = 0.25 and *N0* = 1. Store the results of this simulation in a data frame. Repeat this for two additional values of *r*, of your choosing. Visualize the results of all three simulations on a single plot, coloring each line a different color. Add a legend so it’s clear which runs correspond to which values of *r*. Show and annotate your code; embed your figure. Hint: check `?points` and `?legend`.

First, I'll define my model. This model needs three pieces of information: time, parameters and initial conditions.

```r
exp.growth <- function(t, y, p) {
  N <- y[1]
  with(as.list(p), {
    dN.dt <- r * N
    return(list(dN.dt))
    })
}
```

And my 3 pieces of info: time, parameters and initial conditions...

```r
p <- c('r' = 0.25)
y0 <- c('N' = 1)
t <- c(1:100)
```
Load `deSolve`, simulate the model and store your results in a data frame. Remember, a data frame is an object that holds data in R. Data frames can have named columns, which you can call using a `$`.

```r
library(deSolve)
sim <- ode(y = y0, times = t, func = exp.growth, parms = p, method = 'lsoda')
sim <- as.data.frame(sim)
```

`as.data.frame` coerces most objects into data frames. Plot the results:

```r
plot(N ~ time, data = sim, type = 'l', lwd = 3, bty = 'l', col = 'blue')
```
Here, `lwd = 3` is for line width. You're still telling plot `y ~ x`, but now you're pointing to named columns in a data frame. So, naturally you have to specify which data frame, which you do with `data = sim`.

I'll repeat this three more times, and change the values of *r* by assigning new parameter vectors with different names. I'll also store each new simulation in a new data frame. I didn't ask you to change `y0` or `t`, so we'll just use the old ones throughout. 

```r
p.2 <- c('r' = 0.26)
sim.2 <- ode(y = y0, times = t, func = exp.growth, parms = p.2, method = 'lsoda')
sim.2 <- as.data.frame(sim.2)

p.3 <- c('r' = 0.27)
sim.3 <- ode(y = y0, times = t, func = exp.growth, parms = p.3, method = 'lsoda')
sim.3 <- as.data.frame(sim.3)
```

Now we'll plot these on top of my last plot. `points` is exactly like plot, except it just pastes whatever you're plotting on top of what's already in the graphics pane.

```r
points(N ~ time, data = sim.2, type = 'l', lwd = 2, bty = 'l', lty = 2, col = 'red')
points(N ~ time, data = sim.3, type = 'l', lwd = 2, bty = 'l', lty = 3, col = 'purple')
```

And now I'll use `legend` to tell you what's what.

```r
legend(10, 5e10, c('r = 0.25', 'r = 0.26', 'r = 0.27'), lty = c(1, 2, 3), col = c('blue', 'red', 'purple'), bty = 'n')
```