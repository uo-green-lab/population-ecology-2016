# Population Ecology
BI 471/571:  Population Ecology     	

## Spring 2016
### Homework 1
Problems 1: single species dynamics

Due 4/7/2016
 
1.   Hastings *Chapter 2*: Problem #1.
 
2.   The world’s human population size is expected to double in size in approximately 50 years.  Assuming continuous exponential population growth, calculate r for the human population.  If the population size in 2009 was 6.9 billion, what is the projected population size for the year 2050?
 
3.  A population of annual grasses increases by 12% every year.  What is the approximate doubling time?
 
4.  Consider the town or city in which you live and the causes of human death there.  Based on actual reasons people die there, explain why you think the human death rate is or is not significantly density-independent as assumed in Problem 2.  Describe three mechanisms that do introduce density dependence, however trivial they may be compared with the total death rate, into human mortality.
 
5.  Upload into the [google slides](https://docs.google.com/presentation/d/1XFiaqomDgDIb9LeCqwbuB9qDz_He26GN5hua1FNWrhc/edit?usp=sharing) a photo of an organism that you will share with the class next week.  Make sure to contribute a new species (one that a fellow student has not already uploaded).  Explain in 3-4 sentences why you think the population dynamics of this organism should be modeled using a discrete versus continuous framework.  Explain your reasoning in the HW you turn in and be prepared to discuss your findings with the class. 

	**Using R:**

6.  For five consecutive days, you measure the size of a growing population of nematodes as 100, 158, 315, 398, and 794 individuals.  Plot the logarithm (base e) of population size vs.  time to estimate r. Show and annotate your code; embed your figure. Hint: `?lm` might be helpful.

7.  Simulate a population growing exponentially in continuous time for *r* = 0.25 and *N0* = 1. Store the results of this simulation in a data frame. Repeat this for two additional values of *r*, of your choosing. Visualize the results of all three simulations on a single plot, coloring each line a different color. Add a legend so it’s clear which runs correspond to which values of r. Show and annotate your code; embed your figure. Hint: check `?points` and `?legend`.

