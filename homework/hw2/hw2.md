# Population Ecology
BI 471/571:  Population Ecology     	
Spring 2016

### Homework 2

#### 1. Instructions
See the [instructions section](../hw1/hw1.md) in HW 1.

### Problems 2:
Single species dynamics

> Due 4/14/2016

1. [Hastings](../additional-readings) Problems `4.1` & `4.3`
 
2.  **(a)** Write a function to simulate continuous time logistic growth in `R`. Using the values `r` = 0.25 and `K` = 100, simulate and plot this model over the time range `t` = 0 to `t` = 100, using `runif()` to randomly draw the initial conditions 0.01 < `N0` < 0.1 from a uniform distribution. Include any code and figures.

	**(b)** Simulate this model two additional times for the same parameter set, but with `K` = 50 and `K` = 25. Plot the population level growth rate (hint: `?diff`) vs. population abundance for all three simulations (on the same plot). Include any code and figures.
	
	**(c)** Find the population abundance that yields the maximum population growth rate for each of the above three simulations. Visualize the effect of `K` on maximum population growth rate by plotting these values against their corresponding `K` parameters. Include any code and figures.

3.	Suppose you manage a [fishery](https://en.wikipedia.org/wiki/Fishery) and are tasked with maximizing the fishery's yield by managing the populations of three fish species that grow according to the theta logistic growth model (see Hastings [Ch. 4]((../additional-readings)). A scientist visited the fishery and determined the `theta` value for each fish:  `0.5 for species A`, `1 for species B` and `1.8 for species C`. Which species will be maintained at the highest population abundance in your fishery? Include any code and figures.

