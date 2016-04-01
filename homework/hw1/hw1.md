# Population Ecology
BI 471/571:  Population Ecology     	
Spring 2016

### Homework 1

#### 1. Instructions
You may use any medium of your preference to complete this assignment. This includes hand-writing on paper, creating a Microsoft Word/Apple Pages document or using typography languages like [LaTeX](https://latex-project.org/ftp.html) and [Markdown](http://25.io/mou/). For instance, one easy approach is to use Markdown in [Mou](http://25.io/mou/) to embed text, code and figures into a single github-friendly document. If you are using anything other than LaTeX, you will need a way to insert equations and solutions into your homework document. One option is to handwrite equations/algebra, and screenshot/scan/paste or otherwise save these equations as image files, and embed the images into your homework file. Another way is to use the [Equation Editor in Microsoft Word](https://www.youtube.com/watch?v=QPQfJFBCspg). Once your homework is complete and ready to submit, compile your answers into a readable **PDF** file (e.g., [from a Word file](https://support.office.com/en-us/article/Convert-a-document-to-PDF-f7f18dda-5610-431b-9c76-e5df21eccccf)) and host it in a folder labelled `homework` in your personal course github repository, by Thursday at midnight. In short, each homework should be organized as a single digestible document, with the requisite solutions, code and graphics all in one place. It ought to be clearly labelled (e.g., `hw1`, `hw2`). We also recommend making a seperate `code` folder in your repository as a place to save all of the code you will be writing in class. This [easy Github cheatsheet](https://guides.github.com/introduction/getting-your-project-on-github/) should have all the information you need to succesfully upload your course materials and gain Github street cred. Your Github profile if rapidly becoming just as, if not more, important than your things like your LinkedIn page and resume/CV for certain career paths. Plus, you are contributing to open and reproducible scientific computing!

**Important:** As soon as you have setup your Github repository for this course (don't worry if it's empty), Slack [Jessica Green](jlgreen@uoregon.edu) the hyperlink to your repository. See below for information on Slack.

**Communication:** You are encouraged to work together to tackle the homework problems. The best way to do that outside of class and office hours is to download [Slack](https://slack.com/downloads) and join the Population Ecology channel. You can do that by accepting the invitation already sent to your you@uoregon.edu address. Slack is a professional messaging app that is easy to use, and will put you in touch (instantly) with your classmates and instructors.


###Problems 1:
Single species dynamics

Due 4/7/2016
 
1.   Hastings *Chapter 2*: Problem #1.
 
2.   The world’s human population size is expected to double in size in approximately 50 years.  Assuming continuous exponential population growth, calculate r for the human population.  If the population size in 2009 was 6.9 billion, what is the projected population size for the year 2050?
 
3.  A population of annual grasses increases by 12% every year.  What is the approximate doubling time?
 
4.  Consider the town or city in which you live and the causes of human death there.  Based on actual reasons people die there, explain why you think the human death rate is or is not significantly density-independent as assumed in Problem 2.  Describe three mechanisms that do introduce density dependence, however trivial they may be compared with the total death rate, into human mortality.
 
5.  Upload into the [google slides](https://docs.google.com/presentation/d/1XFiaqomDgDIb9LeCqwbuB9qDz_He26GN5hua1FNWrhc/edit?usp=sharing) a photo of an organism that you will share with the class next week.  Make sure to contribute a new species (one that a fellow student has not already uploaded).  Explain in 3-4 sentences why you think the population dynamics of this organism should be modeled using a discrete versus continuous framework.  Explain your reasoning in the HW you turn in and be prepared to discuss your findings with the class. 

	**Using R:**

6.  For five consecutive days, you measure the size of a growing population of nematodes as 100, 158, 315, 398, and 794 individuals.  Plot the logarithm (base e) of population size vs.  time to estimate *r*. Show and annotate your code; embed your figure. Hint: `?lm` might be helpful.

7.  Simulate a population growing exponentially in continuous time for 100 time steps; *r* = 0.25 and *N0* = 1. Store the results of this simulation in a data frame. Repeat this for two additional values of *r*, of your choosing. Visualize the results of all three simulations on a single plot, coloring each line a different color. Add a legend so it’s clear which runs correspond to which values of *r*. Show and annotate your code; embed your figure. Hint: check `?points` and `?legend`.

