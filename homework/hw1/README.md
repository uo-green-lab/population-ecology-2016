# Population Ecology
## Spring 2016
### Homework 1
This homework assignment will start with a quick crash-course in R. By the end, you'll understand assignment, data structures, creating functions and basic plotting. I'm going to encourage you **NOT** to copy/paste these code snippets. Instead, take the time to write everything out on your own.
> R is a language. Use it everyday and you will learn quickly.
> -Henry Stevens

#### 1. An introduction to R computing

In general in R, we perform an action, and take the results of that action and
assign the results to a new object. Here I add
two numbers and assign the result to an object called `a`.

```r
a <- 2 + 3
a
```
Use an arrow to make the assignment with a
less-than sign, <, and a dash. Note also that to reveal the contents of the object,
you can type the name of the object. You can then use the new object to perform another action, and assign:

```r
b <- a + a
```

You can also perform multiple actions on the same line by using a semicolon. I generally discourage this approach, as it makes debugging and reading code tougher.

```r
a + a; a + b
```

#### 2. Data structures
A single real number is called a scalar. But, most
objects in R are more complex. Here we describe some of these other objects:
*vectors*, *matrices*, *data frames*, *lists*, and *functions*. R operates (does stuff) to objects.

#### 2a. Vectors
So many operations in R are performed on vectors. A vector may be a sequence of scalars, for instance (e.g., 1, 2, 3, 4). Let's create a vector called `X`. In R, we do this with `c()`.

```r
X <- c(1, 2, 3, 4)
```

Like many programming languages, there's more than one way to do anything.

```r
Y <- 1:4
Z <- seq(from = 1, to = 4, by = 1)
```
Which one (if any) of `X`, `Y`, or `Z` are different? *Hint:* try running `X == Y`. Note here that `=` is often used to assign values to arguments, whereas the `==` operator is used when asking if two objects are equal.




