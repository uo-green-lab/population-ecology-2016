# Population Ecology
## Spring 2016
###A brief introduction to R computing

By the end of this quick crash course, you'll understand assignment, data structures, creating functions and basic plotting. I'm going to urge you **NOT** to copy/paste these code snippets into your programming environment. Instead, take the time to write everything out on your own, dissect and understand each argument.
> R is a language. Use it everyday and you will learn quickly.
> -Henry Stevens

#### 1. Assignment
In general in R, you perform an action, take the results of that action and
assign the results to a new object. Here I add
two numbers and assign the result to an object called `a`.

```r
a <- 2 + 3
a
```
Use an arrow to make the assignment with a
less-than sign, <, and a dash. Note also, that to reveal the contents of the object,
you can type the name of the object. You can also make assignments with the `=` operator.

```r
a = 2 + 3
a
```
But, this is non-conventional and I'll discourage you from getting into this habit for a couple of reasons. First, general preference in the R community for using `<-` for assignment (but not in function calls) is for compatibility with old versions of *S-Plus*. That doesn't apply to anybody in 2016, but old habits die hard. Another reason is that in certain cases, assigments made with `=` won't be stored in your machine's RAM, and we like it that way. For instance:

```r
mean(x = 1:10)
x
```

What happens when we do this?

```r
mean(x <- 1:10)
x
```

In practice, storing function calls in RAM can be a waste of space.

You can then use the new object to perform another action, and assign:

```r
b <- a + a
```

You can also perform multiple actions on the same line by using a semicolon. I generally discourage this approach, as it makes debugging and reading code tougher. We also use `#` to annotate our code.

```r
# this is a bad idea...
a + a; a + b
```

#### 2. Data structures
A single real number is called a *scalar*. But, most
objects in R are more complex. Here I'll describe some of these other objects that will make your life easier: *vectors*, *functions* and *data frames*. R operates (does stuff) to objects.

#### 2a. Vectors
So many operations in R are performed on vectors. A vector may be a sequence of scalars, for instance (e.g., 1, 2, 3, 4). Let's create a vector called `X`. In R, we do this with `c()`.

```r
X <- c(1, 2, 3, 4)
```

Like many programming languages, there's more than one way to do everything.

```r
Y <- 1:4
Z <- seq(from = 1, to = 4, by = 1)
```
Which one (if any) of `X`, `Y`, or `Z` are different? *Hint:* what happens when you evaluate `X == Y`?  Note here that, in contrast to `=` which is often used to assign values to arguments in a function call, the `==` operator is used to ask whether two objects are identical. Try `?all.equal`. We can see one of the *quirks* of binary code using the `==` operator.

```r
w <- 3 - 2.9
w == 0.1

q <- round(3 - 2.9, 1)
q == 0.1
```

#### 2b. Functions
A function is a command that does something. You have already been using
functions throughout this primer (`seq` and `mean`). Let’s examine functions more closely. Among other things, a function has a *name*, *arguments*, and *values*. For instance,

```r
?mean
```

This will open the help page (again), showing us the *arguments*. The first argument `x` is the object for which a mean will be calculated. The second argument
is `trim = 0`. If we read about this argument, we find that it will “trim” a specified
fraction of the most extreme observations of x. The fact that the argument trim
is already set equal to zero means that is the default. If you do not use trim,
then the function will use trim = 0. Thus, these two are equivalent.

```r
mean(1:4)
mean(1:4, trim = 0)
```

#### 2c. Writing your own functions
The reason R has become *lingua franca* for scientific computing is its extensibility. It's *object-oriented* nature means anyone can write code that anyone can use. People publish entire ***packages*** (which I'll show you how to install and load in a moment), which are integrated collections of functions that do different cool stuff. There are hundreds if not thousands of these; if you need to do something in R, odds are that there is already a package for it.

A function can take any input, do stuff, including produce graphics, or
interact with the operating system, or manipulated numbers. You decide on the
arguments of the function. Let’s make our own function to calculate a mean. Pretend you work for an unethical boss who wants you to show that average sales are higher
than in reality; i.e., your function should be able to take a vector of company sales (we'll call this vector `real.sales`), provide the average of `real.sales` and add 10%.

```r
bogus.mean <- function(x, cheat) {
	sum.of.x <- sum(x)
	n <- length(x)
	true.mean <- sum.of.x / n
	(1 + cheat) * trueMean
}
```

Remember, you decide the arguments of the function, in this case, `x` and `cheat`.

```r
real.sales <- c(1:10)
adjust <- 0.1

bogus.mean(x = real.sales, cheat = adjust)
```

### 3. Numerical integration of ODEs
To study continuous population dynamics, we often need to integrate
complex nonlinear functions of population dynamics. To do this, we need
to use numerical techniques that turn the infinitely small steps of calculus, `dt`,
into very small, but finite steps, in order to approximate the change in `N`, given
the change in `t`, or `dN/dt`. Mathematicians and computer scientists have devised
clever ways of doing this very accurately. In R, the best package
for this is `deSolve`, which contains several solvers for differential equations
that perform numerical integration. We will access these solvers (i.e. numerical
integraters) using the `ode` function in the `deSolve` package. This function, `ode`,
is a *wrapper* for the underlying suite of functions that do the work. That is,
it provides a simple way to use any one of the small suite of functions.
When we have an ordinary differential equation (ODE) such as exponential
growth we say that we *solve* the equation for a particular time interval given
a set of parameters and initial conditions or initial population size. For instance,
we say that we solve the exponential growth model for time at *t* = 0, 1 . . . 25, with
parameters *r* = 1, and N0 = 0.1.
Let’s do an example with `ode`, using exponential growth. We first have to define
a function in a particular way. The arguments for the function must be `time`, a
vector of populations, and a vector of model parameters.

```r
install.packages('deSolve')
library(deSolve)
```

Now let's write our ODE.

```r
exp.growth <- function(t, y, p) {
  N <- y[1]
  with(as.list(p), {
    dN.dt <- r * N
    return(list(dN.dt))
    })
}
```

Note that I like to convert y into a readable state variable `N`. I also like to use `with` which allows me to use the names of my
parameters. This works only if `p` is a vector with named parameters (see
below). Finally, we return the derivative as a list of one component.

The following is equivalent, but slightly less readable or transparent.

```r
clunky.exp.growth <- function(t, y, p) {
  dN.dt <- p[1] * y[1] * (1 - p[2] * y[1])
  return(list(dN.dt))
}
```
To solve the ODE, we will need to specify parameters, and initial conditions.
Because we are using a vector of named parameters, we need to make sure we
name them! We also need to supply the time steps we want.

```r
p <- c('r' = 0.1)
y0 <- c('N' = 0.1)
t <- 1:25
```
Now you put it all into `ode`, with the correct arguments. The output is a matrix,
with the first column being the time steps, and the remaining being your state
variables. We already loaded the `deSolve` package, so the `ode` function ought to be ready to go!

```r
?ode
sim <- ode(y = y0, times = t, func = exp.growth, parms = p, method = 'lsoda')
```

Now let's looks at the output.

```r
head(sim)
class(sim)
sim.frame <- as.data.frame(sim)
names(sim.frame)
names(sim.frame) <- c('t', 'abundance')
```
Now that it's a data frame we can do all sorts of easy manipulation.

```r
sim.frame$t
sim.frame$abundance
```
And we can use R's base graphics system to make quick and easy plots. I also recommend looking up `?points` for a particular homework problem...

```r
plot(abundance ~ t, data = sim.frame, type = 'l', lwd = 3, col = 'purple', bty = 'l')
```

In RStudio, we can save this plot as a PDF or PNG by clicking `Export` above the graphics pane.
