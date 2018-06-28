
---
title: "Control structures and functions"
---


Control Structures, Looping, and Applying
=========================================

Control Structures and Looping
------------------------------

### Control Structures in R

-   [R has multiple types of control structures that allows for
    sequential evaluation of statements.]{}

-   [For loops]{}

        for (x in set) {operations}

-   [while loops]{}

        while (x in condition){operations}

-   [If statements (conditional)]{}

        if (condition) {
        some operations 
         } else { other operations }

### Control Structure and Looping Examples

    x<-1:9
    length(x)
    # a simple conditional then two expressions
    if (length(x)<=10) {
       x<-c(x,10:20);print(x)}
    # more complex 
    if (length(x)<5) {
        print(x)
    } else {
        print(x[5:20])
    }           
    # print the values of x, one at a time
    for (i in x) print(i) 
    for(i in x) i   # note R will not echo in a loop

### Control Structure and Looping Examples

    # loop over a character vector
    y<-c('a','b','hi there')            
    for (i in y) print(i)

    # and a while loop
    j<-1                
    while(j<10) { # do this while j<10      
      print(j)
      j<-j+2} # at each iteration, increase j by 2

Applying
--------

### Why Does R Have Apply Functions

-   [Often we want to apply the same function to all the rows or columns
    of a matrix, or all the elements of a list.]{}

-   [We could do this in a loop, but loops take a lot of time in an
    interpreted language like R.]{}

-   [R has more efficient built-in operators, the apply functions.]{}

[example]{} If mat is a matrix and fun is a function (such as mean, var,
lm ...) that takes a vector as its argument, then you can:

    apply(mat,1,fun) # over rows--second argument is 1      
    apply(mat,2,fun) # over columns--second argument is 2

In either case, the output is a vector.

### Apply Function Exercise

1.  [Using the matrix and rnorm functions, create a matrix with 20 rows
    and 10 columns (200 values total) of random normal deviates.]{}

2.  [Compute the mean for each row of the matrix.]{}

3.  [Compute the median for each column.]{}

### Related Apply Functions

-   [`lapply(list, function)` applies the function to every element of
    list]{}

-   [`sapply(list or vector, function)` applies the function to every
    element of list or vector, and returns a vector, when possible
    (easier to process)]{}

-   [`tapply(x, factor, fun)` uses the factor to split vector x into
    groups, and then applies fun to each group]{}

### Related Apply Function Examples

    # create a list
    my.list <- list(a=1:3,b=5:10,c=11:20)
    my.list
    # Get the mean for each member of the list
    # return a vector
    sapply( my.list, mean)
    # Get the full summary for each member of
    # the list, returned as a list
    lapply( my.list, summary)
    # Find the mean for each group defined by a factor
    my.vector <- 1:10
    my.factor <- factor(
      c(1,1,1,2,2,2,3,3,3,3))
    tapply(my.vector, my.factor, mean)

Functions
=========


Function Overview
-----------------

-   [Functions are objects and are assigned to names, just like data.]{}

        myFunction = function(argument1,argument2) {
          expression1
          expression2
        }

-   [We write functions for anything we need to do again and again.]{}

-   [You may test your commands interactively at first, and then use the
    `history()` feature and an editor to create the function.]{}

-   [It is wise to include a comment at the start of each function to
    say what it does and to document functions of more than a few
    lines.]{}

Example Functions
-----------------

    add1 = function(x) {
        # this function adds one to the first argument and returns it
        x + 1
    }
    add1(17)
    ## [1] 18
    add1(c(17,18,19,20))
    ## [1] 18 19 20 21

You can use the `edit()` function to make changes to a function. The
following command will open a window, allow you to make changes, and
assign the result to a new function, `add2`.

    add2 = edit(add1)

Further Reading
---------------

The amount of learning material for R is simply astonishing!

-   [[Thomas Girke’s R and Bioconductor
    Manual](http://manuals.bioinformatics.ucr.edu/home/R_BioCondManual)]{}

-   [[A HUGE collection of contributed R documentation and
    tutorials](http://cran.r-project.org/other-docs.html)]{}

-   [[Bioconductor course
    materials](http://www.bioconductor.org/help/course-materials/)]{}

-   [[Sean Davis’ website](http://watson.nci.nih.gov/~sdavis/)]{}

-   [[The Official R Manuals](http://cran.r-project.org/manuals.html)]{}
